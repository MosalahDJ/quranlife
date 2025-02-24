// ignore_for_file: use_build_context_synchronously

import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:get/get.dart';
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
            title: Text('location_service_disabled'.tr),
            content: Text('enable_gps_message'.tr),
            actions: <Widget>[
              TextButton(
                child: Text('cancel'.tr),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
              TextButton(
                child: Text('open_settings'.tr),
                onPressed: () async {
                  Navigator.of(context).pop();
                  await Geolocator.openLocationSettings();
                },
              ),
              TextButton(
                child: Text('retry'.tr),
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
              title: Text('permission_denied'.tr),
              content: Text('location_permission_required'.tr),
              actions: <Widget>[
                TextButton(
                  child: Text('ok'.tr),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                ),
                TextButton(
                  child: Text('retry'.tr),
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
            title: Text('permission_denied_permanently'.tr),
            content: Text('enable_permission_settings'.tr),
            actions: <Widget>[
              TextButton(
                child: Text('cancel'.tr),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
              TextButton(
                child: Text('open_settings'.tr),
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
    if (_currentPosition == null) return;

    setState(() {
      // Add destination marker immediately
      markers.clear();
      markers.addAll({
        // Add current location marker
        Marker(
          markerId: const MarkerId('origin'),
          position:
              LatLng(_currentPosition!.latitude, _currentPosition!.longitude),
          icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueBlue),
        ),
        // Add destination marker
        Marker(
          markerId: const MarkerId('destination'),
          position: destination,
          icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueRed),
        ),
      });
    });

    try {
      final origin =
          LatLng(_currentPosition!.latitude, _currentPosition!.longitude);
      final url =
          Uri.parse('https://maps.googleapis.com/maps/api/directions/json?'
              'origin=${origin.latitude},${origin.longitude}'
              '&destination=${destination.latitude},${destination.longitude}'
              '&key=$apiKey');

      final response = await http.get(url);
      final data = json.decode(response.body);

      if (data['status'] == 'OK') {
        PolylinePoints polylinePoints = PolylinePoints();
        List<PointLatLng> result = polylinePoints
            .decodePolyline(data['routes'][0]['overview_polyline']['points']);

        List<LatLng> polylineCoordinates = [];
        for (var point in result) {
          polylineCoordinates.add(LatLng(point.latitude, point.longitude));
        }

        setState(() {
          polylines.clear();
          polylines.add(
            Polyline(
              polylineId: const PolylineId('route'),
              color: Colors.blue,
              points: polylineCoordinates,
              width: 5,
            ),
          );
        });

        // Animate camera to show both points
        final GoogleMapController controller = await _controller.future;
        final bounds = LatLngBounds(
          southwest: LatLng(
            origin.latitude < destination.latitude
                ? origin.latitude
                : destination.latitude,
            origin.longitude < destination.longitude
                ? origin.longitude
                : destination.longitude,
          ),
          northeast: LatLng(
            origin.latitude > destination.latitude
                ? origin.latitude
                : destination.latitude,
            origin.longitude > destination.longitude
                ? origin.longitude
                : destination.longitude,
          ),
        );
        controller.animateCamera(CameraUpdate.newLatLngBounds(bounds, 100));
      }
    } catch (e) {
      // print('Error getting directions: $e');
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
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const CircularProgressIndicator(),
                    const SizedBox(height: 16),
                    Text(
                      'searching_location'.tr,
                      style: const TextStyle(
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
        label: Text('my_current_location'.tr),
        icon: const Icon(Icons.location_searching),
      ),
    );
  }
}
