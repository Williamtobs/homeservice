import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class OtherTextField extends StatelessWidget {
  final TextEditingController controller;
  final String label;
  final String? Function(String?) validate;
  final bool? obscureText;
  final TextAlign? textAlign;
  const OtherTextField(
      {Key? key,
      required this.controller,
      required this.label,
      required this.validate,
      this.obscureText,
      this.textAlign})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      validator: validate,
      obscureText: obscureText ?? false,
      decoration: InputDecoration(
        labelText: label,
        filled: true,
        fillColor: Colors.white,
        enabledBorder: const UnderlineInputBorder(
          borderSide: BorderSide(
            color: Color.fromRGBO(0, 0, 0, 0.5),
          ),
        ),
        focusedBorder: const UnderlineInputBorder(
          borderSide: BorderSide(
            color: Color.fromRGBO(0, 0, 0, 0.5),
          ),
        ),
      ),
    );
  }
}
