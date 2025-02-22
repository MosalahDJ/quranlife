import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

class ZakatController extends GetxController {
  final RxInt selectedIndex = 0.obs;
  final Rxn<double> calculatedZakat = Rxn<double>();
  final RxMap<String, dynamic> zakatRules = <String, dynamic>{}.obs;

  final List<Map<String, dynamic>> zakatTypes = [
    {
      'title': 'Money & Savings',
      'arabicKey': 'زكاة_النقود',
      'icon': Icons.attach_money,
      'hint': 'Enter total amount of money'
    },
    {
      'title': 'Business Assets',
      'arabicKey': 'زكاة_عروض_التجارة',
      'icon': Icons.business,
      'hint': 'Enter total value'
    },
    {
      'title': 'Agriculture',
      'arabicKey': 'زكاة_الزروع_والثمار',
      'icon': Icons.agriculture,
      'hint': 'Enter weight in kilograms'
    },
    {
      'title': 'Livestock',
      'arabicKey': 'زكاة_الأنعام',
      'icon': Icons.pets,
      'hint': 'Enter number of animals'
    },
    {
      'title': 'Mining & Treasures',
      'arabicKey': 'زكاة_الركاز_والمعادن',
      'icon': Icons.diamond,
      'hint': 'Enter value'
    },
    {
      'title': 'Stocks & Investments',
      'arabicKey': 'زكاة_الأسهم_والاستثمارات',
      'icon': Icons.trending_up,
      'hint': 'Enter total value'
    },
  ];

  @override
  void onInit() {
    super.onInit();
    loadZakatRules();
  }

  Future<void> loadZakatRules() async {
    final String jsonString = await rootBundle.loadString('lib/core/assets/json/zakat.json');
    zakatRules.value = json.decode(jsonString);
  }

  void updateSelectedIndex(int index) {
    selectedIndex.value = index;
    calculatedZakat.value = null;
  }

  void calculateZakat(String amount) {
    if (amount.isEmpty) return;
    
    final double inputAmount = double.parse(amount);
    final String type = zakatTypes[selectedIndex.value]['arabicKey'];
    double zakatAmount = 0;

    switch (type) {
      case 'زكاة_النقود':
        final nisabGold = zakatRules[type]['نصاب_ذهب'];
        if (inputAmount >= nisabGold) {
          zakatAmount = inputAmount * (zakatRules[type]['نسبة_الزكاة'] / 100);
        }
        break;

      case 'زكاة_عروض_التجارة':
        zakatAmount = inputAmount * (zakatRules[type]['نسبة_الزكاة'] / 100);
        break;

      case 'زكاة_الزروع_والثمار':
        final nisab = zakatRules[type]['نصاب'];
        if (inputAmount >= nisab) {
          zakatAmount = inputAmount * (zakatRules[type]['نسبة_الزكاة']['سقي_بتكلفة'] / 100);
        }
        break;

      case 'زكاة_الركاز_والمعادن':
        zakatAmount = inputAmount * (zakatRules[type]['نسبة_الزكاة'] / 100);
        break;

      case 'زكاة_الأسهم_والاستثمارات':
        zakatAmount = inputAmount * (zakatRules[type]['نسبة_الزكاة'] / 100);
        break;
    }

    calculatedZakat.value = zakatAmount;
  }

  double calculateLivestockZakat(String type, int count) {
    if (zakatRules.isEmpty) return 0;
    
    final livestock = zakatRules['زكاة_الأنعام'][type];
    for (var range in livestock) {
      if (count >= range['من'] && count <= range['إلى']) {
        return range['زكاة'].toDouble();
      }
    }
    return 0;
  }
}