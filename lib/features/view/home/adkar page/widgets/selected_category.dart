// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:quranlife/core/Utils/constants.dart';
// import 'package:quranlife/features/controller/adkar%20controller/adkar_controller.dart';
// import 'package:quranlife/features/view/home/adkar%20page/widgets/duaa_page.dart';

// class SelectedCategory extends StatelessWidget {
//   SelectedCategory({super.key});
//   final AdkarController _adkarctrl = Get.find();


//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         backgroundColor: kmaincolor,
//       ),
//       body: SafeArea(
//         minimum: const EdgeInsets.all(5),
//         child: GridView.builder(
//           itemCount: _adkarctrl.filteredAdkar.length,
//           gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
//               crossAxisCount: 2),
//           itemBuilder: (context, index) => InkWell(
//             onTap: () => Get.to(() => DuaaPage()),
//             child: Card(
//               child: Container(),
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }
