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
        title: const Text('Zakat Calculator'),
        centerTitle: true,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                _buildZakatTypesList(),
                const SizedBox(height: 20),
                _buildInputForm(),
                const SizedBox(height: 20),
                _buildCalculateButton(),
                const SizedBox(height: 20),
                _buildResultCard(),
                const SizedBox(height: 20),
                _buildInfoSection(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildZakatTypesList() {
    return SizedBox(
      height: 100,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: _controller.zakatTypes.length,
        itemBuilder: (context, index) => _buildZakatTypeItem(context, index),
      ),
    );
  }

  Widget _buildZakatTypeItem(BuildContext context, int index) {
    return Obx(() => GestureDetector(
          onTap: () {
            _controller.updateSelectedIndex(index);
            _amountController.clear();
          },
          child: Container(
            width: 100,
            margin: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: _controller.selectedIndex.value == index
                  ? Theme.of(context).primaryColor
                  : Colors.grey[200],
              borderRadius: BorderRadius.circular(12),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.2),
                  spreadRadius: 1,
                  blurRadius: 4,
                  offset: const Offset(0, 2),
                ),
              ],
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  _controller.zakatTypes[index]['icon'],
                  color: _controller.selectedIndex.value == index
                      ? Colors.white
                      : Colors.black,
                  size: 28,
                ),
                const SizedBox(height: 8),
                Text(
                  _controller.zakatTypes[index]['title'],
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: _controller.selectedIndex.value == index
                        ? Colors.white
                        : Colors.black,
                    fontSize: 12,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
          ),
        ));
  }

  Widget _buildInputForm() {
    return Form(
      key: _formKey,
      child: Obx(() => TextFormField(
            controller: _amountController,
            keyboardType: TextInputType.number,
            decoration: InputDecoration(
              labelText: _controller.zakatTypes[_controller.selectedIndex.value]
                  ['hint'],
              border: const OutlineInputBorder(),
              prefixIcon: const Icon(Icons.calculate),
              filled: true,
              fillColor: Colors.grey[50],
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
          )),
    );
  }

  Widget _buildCalculateButton() {
    return ElevatedButton(
      onPressed: () {
        if (_formKey.currentState!.validate()) {
          _controller.calculateZakat(_amountController.text);
        }
      },
      style: ElevatedButton.styleFrom(
        padding: const EdgeInsets.all(16),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
      ),
      child: const Text(
        'Calculate Zakat',
        style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
      ),
    );
  }

  Widget _buildResultCard() {
    return Obx(() {
      if (_controller.calculatedZakat.value != null) {
        return Card(
          elevation: 4,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                const Text(
                  'Your Zakat Amount',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
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
                  'Type: ${_controller.zakatTypes[_controller.selectedIndex.value]['title']}',
                  style: const TextStyle(
                    fontSize: 14,
                    color: Colors.grey,
                  ),
                ),
              ],
            ),
          ),
        );
      }
      return const SizedBox.shrink();
    });
  }

  Widget _buildInfoSection() {
    return const Card(
      elevation: 2,
      child: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Important Notes:',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 8),
            Text(
              '• Zakat is mandatory when wealth exceeds Nisab\n'
              '• The general rate is 2.5% of the total wealth\n'
              '• Zakat year (Hawl) is based on lunar calendar\n'
              '• Different types of wealth have different calculations\n'
              '• Consult with a scholar for specific cases',
              style: TextStyle(fontSize: 14),
            ),
            SizedBox(height: 16),
          ],
        ),
      ),
    );
  }
}
