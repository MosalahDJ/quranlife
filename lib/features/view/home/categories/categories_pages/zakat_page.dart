import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quranlife/features/controller/zakat controller/zakat_controller.dart';

class ZakatPage extends StatelessWidget {
  ZakatPage({super.key});

  final _formKey = GlobalKey<FormState>();
  final TextEditingController _amountController = TextEditingController();
  final ZakatController _controller = Get.put(ZakatController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Money Zakat Calculator'),
        centerTitle: true,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                _buildInputForm(),
                const SizedBox(height: 20),
                _buildCalculateButton(),
                const SizedBox(height: 20),
                _buildResultCard(),
                const SizedBox(height: 20),
                _buildNisabInfo(),
                const SizedBox(height: 20),
                _buildOtherTypesInfo(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildInputForm() {
    return Form(
      key: _formKey,
      child: TextFormField(
        controller: _amountController,
        keyboardType: TextInputType.number,
        decoration: const InputDecoration(
          labelText: 'Enter your total money amount',
          border: OutlineInputBorder(),
          prefixIcon: Icon(Icons.attach_money),
          filled: true,
        ),
        validator: (value) {
          if (value == null || value.isEmpty) {
            return 'Please enter an amount';
          }
          if (double.tryParse(value) == null) {
            return 'Please enter a valid number';
          }
          return null;
        },
      ),
    );
  }

  Widget _buildCalculateButton() {
    return ElevatedButton(
      onPressed: () {
        if (_formKey.currentState!.validate()) {
          _controller.calculateZakat(_amountController.text);
        }
      },
      child: const Padding(
        padding: EdgeInsets.all(16.0),
        child: Text(
          'Calculate Zakat',
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }

  Widget _buildResultCard() {
    return Obx(() {
      if (_controller.calculatedZakat.value != null) {
        return Card(
          elevation: 4,
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                const Text(
                  'Your Zakat Amount',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 12),
                Text(
                  '\$${_controller.calculatedZakat.value!.toStringAsFixed(2)}',
                  style: TextStyle(
                    fontSize: 32,
                    fontWeight: FontWeight.bold,
                    color: Theme.of(Get.context!).primaryColor,
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  'Rate: ${_controller.zakatRate}%',
                  style: const TextStyle(fontSize: 14, color: Colors.grey),
                ),
              ],
            ),
          ),
        );
      }
      return const SizedBox.shrink();
    });
  }

  Widget _buildNisabInfo() {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Nisab Information',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            Obx(() => Text(
              'Current Nisab: \$${_controller.currentNisabValue.toStringAsFixed(2)}',
              style: const TextStyle(fontSize: 16, color: Colors.green),
            )),
            const SizedBox(height: 8),
            const Text(
              '• Nisab is the minimum amount for Zakat obligation\n'
              '• Equal to 85 grams of gold value\n'
              '• Zakat rate is 2.5% of total wealth\n'
              '• Applies to money held for one lunar year',
              style: TextStyle(fontSize: 14),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildOtherTypesInfo() {
    return const Card(
      child: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Other Types of Zakat',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8),
            Text(
              '1. Business Assets (2.5%)\n'
              '2. Agriculture (5-10%)\n'
              '3. Livestock (varies by type and number)\n'
              '4. Mining & Treasures (20%)\n'
              '5. Stocks & Investments (2.5%)\n\n'
              'Please consult with a scholar for detailed guidance on these types.',
              style: TextStyle(fontSize: 14),
            ),
          ],
        ),
      ),
    );
  }
}