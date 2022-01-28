import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

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
      validator: _validatePassword,
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

String? _validatePassword(String? pass1) {
  RegExp hasUpper = RegExp(r'[A-Z]');
  RegExp hasLower = RegExp(r'[a-z]');
  RegExp hasDigit = RegExp(r'\d');
  RegExp hasPunct = RegExp(r'[_!@#\$&*~-]');
  if (!RegExp(r'.{6,}').hasMatch(pass1!)) {
    return 'Passwords must have at least 8 characters';
  }
  if (!hasUpper.hasMatch(pass1)) {
    return 'Passwords must have at least one uppercase character';
  }
  if (!hasLower.hasMatch(pass1)) {
    return 'Passwords must have at least one lowercase character';
  }
  if (!hasDigit.hasMatch(pass1)) {
    return 'Passwords must have at least one number';
  }
  if (!hasPunct.hasMatch(pass1)) {
    return 'Passwords need at least one special character like !@#\$&*~-';
  }
  return null;
}
