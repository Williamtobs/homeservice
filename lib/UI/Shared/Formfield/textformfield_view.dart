import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

/// *  textInputType - The type of information for which to optimize the text input control.
/// *  hintText - Text that suggests what sort of input the field accepts.
/// *  prefixIcon - Pass Icon if required
/// *  defaultText - If there is predefined value is there for a text field
/// *  focusNode - Currently focus node
/// *  obscureText - Is Password field?
/// *  controller - Text controller
/// *  functionValidate - Validation function(currently I have used to check empty field)
/// *  parametersValidate - Value to validate
/// *  actionKeyboard - Keyboard action eg. next, done, search, etc
/// *  onSubmitField - Done click action
/// *  onFieldTap - On focus on TextField

class TextFormFieldWidget extends StatefulWidget {
  final TextInputType? textInputType;
  final String? hintText;
  final Widget? suffixIcon;
  final String? defaultText;
  final FocusNode? focusNode;
  final bool? obscureText;
  final TextEditingController? controller;
  final Function? functionValidate;
  final Function? onPressed;
  final String? parametersValidate;
  final TextInputAction? actionKeyboard;
  final Function? onSubmitField;
  final Function? onFieldTap;
  final String? Function(String?)? validate;

  const TextFormFieldWidget(
      {
        Key? key,
        this.hintText,
        this.focusNode,
        this.textInputType,
        this.defaultText,
        this.obscureText = false,
        this.controller,
        this.functionValidate,
        this.parametersValidate,
        this.actionKeyboard = TextInputAction.next,
        this.onSubmitField,
        this.onFieldTap,
        this.suffixIcon, this.onPressed, this.validate}) : super(key: key);

  @override
  _TextFormFieldWidgetState createState() => _TextFormFieldWidgetState();
}

class _TextFormFieldWidgetState extends State<TextFormFieldWidget> {

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      maxLines: 1,
      //cursorColor: primaryColor,
      obscureText: widget.obscureText!,
      keyboardType: widget.textInputType,
      textInputAction: widget.actionKeyboard,
      focusNode: widget.focusNode,

      style: GoogleFonts.montserrat(
        color: const Color.fromRGBO(132, 132, 132, 1),
        fontSize: 14.0,
        fontWeight: FontWeight.w600,
      ),
      initialValue: widget.defaultText,
      decoration: InputDecoration(
        filled: true,
        fillColor: const Color.fromRGBO(229, 229, 229, 1),
        suffixIcon: widget.suffixIcon,
        hintText: widget.hintText,
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15.0),
          borderSide: const BorderSide(color: Colors.white),
          ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15.0),
          borderSide: const BorderSide(color: Colors.white),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15.0),
          borderSide: const BorderSide(color: Colors.white),
        ),
        errorBorder: OutlineInputBorder(
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
      controller: widget.controller,
      validator: widget.validate,
      onFieldSubmitted: (value) {
        if (widget.onSubmitField != null) widget.onSubmitField!();
      },
      onTap: () {
        if (widget.onFieldTap != null) widget.onFieldTap!();
      },
    );
  }
}