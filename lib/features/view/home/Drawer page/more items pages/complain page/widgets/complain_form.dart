import 'package:flutter/material.dart';
import 'package:quranlife/core/Utils/size_config.dart';

class ComplainForm extends StatelessWidget {
  const ComplainForm(
      {super.key, required this.maxlines, required this.titletext});
  final int maxlines;
  final String titletext;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          height: Sizeconfig.screenheight! / 90,
        ),
        Text(
          titletext,
          style: const TextStyle(
            fontSize: 18,
          ),
        ),
        SizedBox(
          height: Sizeconfig.screenheight! / 100,
        ),
        Form(
            child: SizedBox(
          height: maxlines == 1
              ? Sizeconfig.screenheight! / 15
              : Sizeconfig.screenheight! / 5,
          child: TextFormField(
            maxLines: maxlines,
            decoration: const InputDecoration(
                fillColor: Colors.white,
                filled: true,
                border: OutlineInputBorder(
                    borderSide: BorderSide(width: 0, style: BorderStyle.none),
                    borderRadius: BorderRadius.all(Radius.circular(5)))),
          ),
        )),
      ],
    );
  }
}
