import 'package:flutter/material.dart';
import 'package:project/core/Utils/constants.dart';

class InformationsForm extends StatelessWidget {
  const InformationsForm({
    super.key,
    required this.formtitle,
    this.keyboardtype,
    this.obsecure,
    this.hint,
    this.lines,
    this.textctrl,
    this.isrequired = false,
    this.validator,
    this.suffixbutton,
    required this.focusnode,
    this.prefixicon,
  });
  final String formtitle;
  final TextInputType? keyboardtype;
  final bool? obsecure;
  final String? hint;
  final int? lines;
  final TextEditingController? textctrl;
  final bool isrequired;
  final String? Function(String?)? validator;
  final Widget? suffixbutton;
  final Widget? prefixicon;

  final FocusNode focusnode;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(formtitle, style: Theme.of(context).textTheme.titleLarge),
        TextFormField(
          autovalidateMode: AutovalidateMode.onUserInteraction,
          focusNode: focusnode,
          validator: validator,
          controller: textctrl,
          maxLines: lines,
          obscureText: obsecure == null ? false : obsecure!,
          keyboardType: keyboardtype,
          cursorColor: kmaincolor,
          decoration: InputDecoration(
            prefixIcon: prefixicon,
            suffixIcon: Visibility(
              visible: suffixbutton == null ? false : true,
              child: suffixbutton == null ? const Text("") : suffixbutton!,
            ),
            hintText: hint,
            hintStyle: Theme.of(context).textTheme.labelLarge,
            border: const UnderlineInputBorder(
              borderSide: BorderSide(
                style: BorderStyle.solid,
                color: Color(0xFF3D3825),
              ),
            ),
            focusedBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: kmaincolor),
            ),
            errorBorder: const UnderlineInputBorder(
              borderSide: BorderSide(color: Colors.red),
            ),
          ),
        ),
      ],
    );
  }
}
