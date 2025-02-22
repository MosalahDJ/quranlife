import 'dart:convert';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

class ZakatController extends GetxController {
  final Rxn<double> calculatedZakat = Rxn<double>();
  final Rx<Map<String, dynamic>> zakatRules = Rx<Map<String, dynamic>>({});
  
  // Constants for zakat calculation
  final double goldPricePerGram = 65.0; // USD
  final double goldNisab = 85.0; // grams
  final double zakatRate = 2.5; // percentage

  @override
  void onInit() {
    super.onInit();
    loadZakatRules();
  }

  Future<void> loadZakatRules() async {
    try {
      final String jsonString = await rootBundle.loadString('lib/core/assets/json/zakat.json');
      zakatRules.value = json.decode(jsonString);
    } catch (e) {
      print('Error loading zakat rules: $e');
      // Set default values if JSON loading fails
      zakatRules.value = {
        'زكاة_النقود': {
          'نصاب_ذهب': 85.0,
          'نسبة_الزكاة': 2.5,
        }
      };
    }
  }

  void calculateZakat(String amount) {
    if (amount.isEmpty) return;

    final double inputAmount = double.parse(amount);
    final double nisabValue = goldNisab * goldPricePerGram;
    
    if (inputAmount >= nisabValue) {
      calculatedZakat.value = inputAmount * (zakatRate / 100);
    } else {
      calculatedZakat.value = 0;
    }
  }

  // Helper getters
  double get currentNisabValue => goldNisab * goldPricePerGram;
  String get nisabDescription => 'Nisab (${goldNisab}g of gold): \$${currentNisabValue.toStringAsFixed(2)}';
  String get rateDescription => 'Zakat Rate: $zakatRate%';
  
  // Get zakat rules for display
  Map<String, String> get otherZakatTypes => {
    'Business Assets': '2.5% of total value',
    'Agriculture': '5-10% based on irrigation method',
    'Livestock': 'Varies by type and number',
    'Mining & Treasures': '20% of found value',
    'Stocks & Investments': '2.5% of total value'
  };
}