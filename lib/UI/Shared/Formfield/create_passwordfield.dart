import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:homeservice/Constants/validators.dart';

class PasswordField extends StatelessWidget{
  final String? hintText;
  final Widget? suffixIcon;
  final String? defaultText;
  final FocusNode? focusNode;
  final bool obscureText;
  final TextEditingController? controller;
  final Function? functionValidate;
  final String? parametersValidate;
  final TextInputAction? actionKeyboard;
  final bool? filled;
  final Widget? label;
  final Function(String?)? onSaved;
  final Function? onFieldTap;
  final String? Function(String?)? validator;
  final TextInputType? keyboardType;
  final Function? onPressed;

  const PasswordField(
      {Key? key,
        this.hintText,
        this.focusNode,
        this.defaultText,
        this.label,
        required this.obscureText,
        this.controller,
        this.functionValidate,
        this.filled,
        this.parametersValidate,
        this.actionKeyboard = TextInputAction.next,
        this.onSaved,
        this.onFieldTap,
        this.validator,
        this.keyboardType,
        this.suffixIcon, this.onPressed}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      validator: Validators().validatePassword,
      onSaved: onSaved,
      autofocus: false,
      obscureText: obscureText,
      keyboardType: TextInputType.text,
      maxLines: 1,
      decoration: InputDecoration(
        filled: true,
        fillColor: const Color.fromRGBO(229, 229, 229, 1),
        hintText: hintText,
        suffixIcon: suffixIcon,
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15.0),
          borderSide: const BorderSide(color: Colors.white),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15.0),
      borderSide: const BorderSide(color: Colors.white),
    ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15.0),
          borderSide: const BorderSide(color: Colors.white),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15.0),
          borderSide: const BorderSide(color: Colors.white),
        ),
        hintStyle: GoogleFonts.montserrat(
          color: const Color.fromRGBO(132, 132, 132, 1),
          fontSize: 14.0,
          fontWeight: FontWeight.w600,
        ),
          contentPadding: const EdgeInsets.all(20),
        isDense: true,
        errorStyle: GoogleFonts.montserrat(
          color: const Color.fromRGBO(240, 11, 52, 1),
          fontSize: 14.0,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }

}