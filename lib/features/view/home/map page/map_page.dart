// ignore_for_file: use_build_context_synchronously

import 'dart:async';
import 'dart:io';
import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:geolocator/geolocator.dart';
import 'package:flutter_polyline_points/flutter_polyline_points.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class MapSample extends StatefulWidget {
  const MapSample({super.key});

  @override
  State<MapSample> createState() => MapSampleState();
}

class MapSampleState extends State<MapSample> {
  final Completer<GoogleMapController> _controller =
      Completer<GoogleMapController>();
  Position? _currentPosition;
  bool _isLoading = false;
  Set<Marker> markers = {};
  Set<Polyline> polylines = {};
  LatLng? destinationLocation;
  final String apiKey = dotenv.env['google_map_api_key']!;

  String mapStyle = '''
  [
    {
      "featureType": "poi",
      "stylers": [
        {
          "visibility": "off"
        }
      ]
    },
    {
      "featureType": "poi.place_of_worship",
      "stylers": [
        {
          "visibility": "on"
        }
      ]
    }
  ]
  ''';

  @override
  void initState() {
    super.initState();
    _getCurrentLocation();
  }

  Future<void> _getCurrentLocation() async {
    setState(() {
      _isLoading = true;
    });

    bool serviceEnabled;
    LocationPermission permission;

    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      await showDialog(
        context: context,
        barrierDismissible: false,
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text('خدمة تحديد الموقع غير مفعلة'),
            content: const Text('يرجى تفعيل GPS للحصول على موقعك الحالي'),
            actions: <Widget>[
              TextButton(
                child: const Text('إلغاء'),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
              TextButton(
                child: const Text('فتح الإعدادات'),
                onPressed: () async {
                  Navigator.of(context).pop();
                  await Geolocator.openLocationSettings();
                },
              ),
              TextButton(
                child: const Text('إعادة المحاولة'),
                onPressed: () {
                  Navigator.of(context).pop();
                  _getCurrentLocation();
                },
              ),
            ],
          );
        },
      );
      return;
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        await showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: const Text('تم رفض الإذن'),
              content: const Text('لا يمكن الوصول إلى موقعك بدون إذن'),
              actions: <Widget>[
                TextButton(
                  child: const Text('حسناً'),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                ),
                TextButton(
                  child: const Text('إعادة المحاولة'),
                  onPressed: () {
                    Navigator.of(context).pop();
                    _getCurrentLocation();
                  },
                ),
              ],
            );
          },
        );
        return;
      }
    }

    if (permission == LocationPermission.deniedForever) {
      await showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text('تم رفض الإذن بشكل دائم'),
            content: const Text('يرجى تفعيل إذن الموقع من إعدادات التطبيق'),
            actions: <Widget>[
              TextButton(
                child: const Text('إلغاء'),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
              TextButton(
                child: const Text('فتح الإعدادات'),
                onPressed: () async {
                  Navigator.of(context).pop();
                  await Geolocator.openAppSettings();
                },
              ),
            ],
          );
        },
      );
      return;
    }
    try {
      Position position = await Geolocator.getCurrentPosition();
      setState(() {
        _currentPosition = position;
      });

      final GoogleMapController controller = await _controller.future;
      controller.animateCamera(
        CameraUpdate.newCameraPosition(
          CameraPosition(
            target: LatLng(position.latitude, position.longitude),
            zoom: 17,
          ),
        ),
      );
    } finally {
      setState(() {
        _isLoading = false;
      });
    }
  }

  Future<void> getDirections(LatLng destination) async {
    if (_currentPosition == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('الرجاء الانتظار حتى يتم تحديد موقعك'),
          duration: Duration(seconds: 2),
        ),
      );
      return;
    }

    setState(() {
      _isLoading = true; // إضافة مؤشر التحميل
    });

    try {
      final origin =
          LatLng(_currentPosition!.latitude, _currentPosition!.longitude);

      // تحديث الماركرز
      setState(() {
        markers.clear();
        markers.addAll({
          Marker(
            markerId: const MarkerId('origin'),
            position: origin,
            icon:
                BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueBlue),
          ),
          Marker(
            markerId: const MarkerId('destination'),
            position: destination,
            icon:
                BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueRed),
          ),
        });
      });

      // جلب المسار من Google Directions API
      final url =
          Uri.parse('https://maps.googleapis.com/maps/api/directions/json?'
              'origin=${origin.latitude},${origin.longitude}'
              '&destination=${destination.latitude},${destination.longitude}'
              '&mode=driving' // تحديد وضع القيادة
              '&key=$apiKey');

      final response = await http.get(url).timeout(
        const Duration(seconds: 10), // إضافة timeout
        onTimeout: () {
          throw TimeoutException('فشل الاتصال بالخادم');
        },
      );

      if (response.statusCode != 200) {
        throw HttpException('فشل في الاتصال بالخادم: ${response.statusCode}');
      }

      final data = json.decode(response.body);

      if (data['status'] != 'OK') {
        throw Exception('فشل في جلب المسار: ${data['status']}');
      }

      // تحويل المسار إلى إحداثيات
      PolylinePoints polylinePoints = PolylinePoints();
      List<PointLatLng> result = polylinePoints
          .decodePolyline(data['routes'][0]['overview_polyline']['points']);

      if (result.isEmpty) {
        throw Exception('لم يتم العثور على مسار');
      }

      List<LatLng> polylineCoordinates = result
          .map((point) => LatLng(point.latitude, point.longitude))
          .toList();

      // تحديث المسار على الخريطة
      setState(() {
        polylines.clear();
        polylines.add(
          Polyline(
            polylineId: const PolylineId('route'),
            color: Colors.blue,
            points: polylineCoordinates,
            width: 5,
            patterns: [
              PatternItem.dash(20), // إضافة نمط متقطع للمسار
              PatternItem.gap(5),
            ],
          ),
        );
      });

      // تحريك الكاميرا لتظهر المسار كاملاً
      final GoogleMapController controller = await _controller.future;
      final bounds = LatLngBounds(
        southwest: LatLng(
          min(origin.latitude, destination.latitude),
          min(origin.longitude, destination.longitude),
        ),
        northeast: LatLng(
          max(origin.latitude, destination.latitude),
          max(origin.longitude, destination.longitude),
        ),
      );

      controller.animateCamera(
        CameraUpdate.newLatLngBounds(bounds, 100),
      );
    } catch (e) {
      print('Error getting directions: $e');
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('حدث خطأ: ${e.toString()}'),
          duration: const Duration(seconds: 3),
        ),
      );
    } finally {
      setState(() {
        _isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      body: Stack(
        children: [
          GoogleMap(
            style: mapStyle,
            mapType: MapType.normal,
            initialCameraPosition: CameraPosition(
              target: _currentPosition != null
                  ? LatLng(
                      _currentPosition!.latitude, _currentPosition!.longitude)
                  : const LatLng(0, 0),
              zoom: 14.4746,
            ),
            onMapCreated: (GoogleMapController controller) {
              _controller.complete(controller);
            },
            myLocationButtonEnabled: false,
            myLocationEnabled: true,
            markers: markers,
            polylines: polylines,
            onTap: (LatLng location) {
              destinationLocation = location;
              getDirections(location);
              print("___________________________________________");
              print("tapped");
              print("___________________________________________");
            },
          ),
          if (_isLoading)
            Container(
              alignment: Alignment.center,
              color: Colors.black.withOpacity(0.5),
              child: Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: const Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    CircularProgressIndicator(),
                    SizedBox(height: 16),
                    Text(
                      'جاري البحث عن موقعك...',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
            ),
        ],
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: _isLoading ? null : _getCurrentLocation,
        label: const Text('موقعي الحالي'),
        icon: const Icon(Icons.location_searching),
      ),
    );
  }
}
