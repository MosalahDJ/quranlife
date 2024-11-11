import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quranlife/features/controller/more%20controllers/historycontroller.dart';

class HistoryPage extends StatelessWidget {
  HistoryPage({super.key});
  final HistoryController historyctrl = Get.find();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("History"),
        centerTitle: true,
        elevation: 10,
      ),
      body: GetBuilder<HistoryController>(
        builder: (controller) => ListView.builder(
          itemCount: historyctrl.historyitems.length,
          itemBuilder: (context, index) => Column(
            children: [
              const SizedBox(
                height: 5,
              ),
              Card(
                  child: ListTile(
                onTap: () {},
                title: Text(historyctrl.historyitems[index]),
              ))
            ],
          ),
        ),
      ),
    );
  }
}
