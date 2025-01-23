import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quranlife/features/controller/quraan%20controller/quraan_controller.dart';

class SavedAyahs extends StatelessWidget {
  SavedAyahs({super.key});
  final QuraanController quranctrl = Get.find();

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        appBar: AppBar(),
        body: GetBuilder<QuraanController>(
          builder: (c) => ListView.builder(
              itemCount: quranctrl.savedayahsId.length,
              itemBuilder: (context, index) {
                // int numberOfAya = int.parse(quranctrl.savedayahsId[index])
                // surah.ayahs.numberInSurah

                return Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                          color: Colors.red,
                          child: IconButton(
                            icon: const Icon(Icons.delete),
                            onPressed: () {
                              quranctrl.removeSavedAyah(index);
                            },
                            color: Colors.white,
                            iconSize: 30,
                          )),
                      Container(
                          color: Colors.blue,
                          child: const Text(
                            "",
                            style: TextStyle(fontSize: 34, color: Colors.red),
                          )),
                    ],
                  ),
                );
              }),
        ),
      ),
    );
  }
}
