import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quranlife/core/Utils/constants.dart';
import 'package:quranlife/core/Utils/size_config.dart';
import 'package:quranlife/core/widgets/gradient_background.dart';
import 'package:quranlife/core/widgets/shimmer_text.dart';

class Zakatpage extends StatefulWidget {
  const Zakatpage({super.key});

  @override
  State<Zakatpage> createState() => _ZakatpageState();
}

class _ZakatpageState extends State<Zakatpage> {
  final _formKey = GlobalKey<FormState>();
  int _selectedIndex = 0;
  double? _calculatedZakat;
  final TextEditingController _amountController = TextEditingController();

  final List<Map<String, dynamic>> _zakatTypes = [
    {
      'title': 'Money & Savings',
      'nisab': 85, // 85 grams of gold
      'rate': 0.025,
      'icon': Icons.attach_money,
      'hint': 'Enter total amount of money'
    },
    {
      'title': 'Gold',
      'nisab': 85, // 85 grams of gold
      'rate': 0.025,
      'icon': Icons.g_mobiledata_sharp,
      'hint': 'Enter weight in grams'
    },
    {
      'title': 'Silver',
      'nisab': 595, // 595 grams of silver
      'rate': 0.025,
      'icon': Icons.format_color_reset_rounded,
      'hint': 'Enter weight in grams'
    },
    {
      'title': 'Business Assets',
      'nisab': 85, // Equivalent to gold
      'rate': 0.025,
      'icon': Icons.business,
      'hint': 'Enter total value'
    },
  ];

  void _calculateZakat() {
    if (_formKey.currentState!.validate()) {
      final amount = double.parse(_amountController.text);
      final rate = _zakatTypes[_selectedIndex]['rate'];
      setState(() {
        _calculatedZakat = amount * rate;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        extendBodyBehindAppBar: true,
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.transparent,
          centerTitle: true,
          title: ShimmerText(
            text: 'Calculate Your Zakat'.tr,
            style: Theme.of(context).textTheme.headlineSmall,
          ),
        ),
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        body: Stack(children: [
          Gradientbackground(
            height: Sizeconfig.screenheight! / 2.5,
            gradientcolor: [
              kmaincolor,
              Get.isDarkMode ? kmaincolor3dark : kmaincolor3,
            ],
          ),
          Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage(
                    'lib/core/assets/images/background_image/arch.jpg'),
                opacity: 0.2,
                repeat: ImageRepeat.repeat,
              ),
            ),
          ),
          SafeArea(
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    SizedBox(
                      height: 100,
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: _zakatTypes.length,
                        itemBuilder: (context, index) {
                          return GestureDetector(
                            onTap: () {
                              setState(() {
                                _selectedIndex = index;
                                _calculatedZakat = null;
                                _amountController.clear();
                              });
                            },
                            child: Container(
                              width: 100,
                              margin: const EdgeInsets.all(8),
                              decoration: BoxDecoration(
                                color: _selectedIndex == index
                                    ? Theme.of(context).primaryColor
                                    : Colors.grey[200],
                                borderRadius: BorderRadius.circular(12),
                              ),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Icon(
                                    _zakatTypes[index]['icon'],
                                    color: _selectedIndex == index
                                        ? Colors.white
                                        : Colors.black,
                                  ),
                                  const SizedBox(height: 8),
                                  Text(
                                    _zakatTypes[index]['title'],
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      color: _selectedIndex == index
                                          ? Colors.white
                                          : Colors.black,
                                      fontSize: 12,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                    const SizedBox(height: 20),
                    Form(
                      key: _formKey,
                      child: TextFormField(
                        controller: _amountController,
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                          labelText: _zakatTypes[_selectedIndex]['hint'],
                          border: const OutlineInputBorder(),
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter a value';
                          }
                          if (double.tryParse(value) == null) {
                            return 'Please enter a valid number';
                          }
                          return null;
                        },
                      ),
                    ),
                    const SizedBox(height: 20),
                    ElevatedButton(
                      onPressed: _calculateZakat,
                      style: ElevatedButton.styleFrom(
                        padding: const EdgeInsets.all(16),
                      ),
                      child: const Text('Calculate Zakat'),
                    ),
                    if (_calculatedZakat != null) ...[
                      const SizedBox(height: 20),
                      Card(
                        child: Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Column(
                            children: [
                              const Text(
                                'Your Zakat Amount:',
                                style: TextStyle(fontSize: 18),
                              ),
                              const SizedBox(height: 8),
                              Text(
                                '\$${_calculatedZakat!.toStringAsFixed(2)}',
                                style: const TextStyle(
                                  fontSize: 24,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.green,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                    const SizedBox(height: 20),
                    const Card(
                      child: Padding(
                        padding: EdgeInsets.all(16.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Important Notes:',
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            SizedBox(height: 8),
                            Text(
                              '• Zakat is mandatory when wealth exceeds the Nisab value\n'
                              '• Nisab is equivalent to 85 grams of gold or 595 grams of silver\n'
                              '• The general rate of Zakat is 2.5% of the total wealth\n'
                              '• Zakat year (Hawl) is based on the lunar calendar\n'
                              '• Consult with a scholar for specific cases',
                              style: TextStyle(fontSize: 14),
                            ),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(height: 20),
                    const Text(
                      'References:',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const Text(
                      '1. Sahih Al-Bukhari (1395, 1451)\n'
                      '2. Sahih Muslim (979)\n'
                      '3. Sunan Abu Dawood (1573)\n'
                      '4. Jami` at-Tirmidhi (620)',
                      style: TextStyle(fontSize: 14),
                    ),
                  ],
                ),
              ),
            ),
          )
        ]));
  }

  @override
  void dispose() {
    _amountController.dispose();
    super.dispose();
  }
}
