import 'package:flutter/material.dart';

class ProfileTextField extends StatelessWidget {
  final TextEditingController controller;
  final Color? color;
  final bool? enable;
  const ProfileTextField(
      {Key? key, required this.controller, this.color, this.enable})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      enabled: enable ?? false,
      controller: controller,
      decoration: InputDecoration(
        filled: true,
        fillColor: color ?? const Color.fromRGBO(229, 229, 229, 1),
        enabledBorder: const OutlineInputBorder(
          borderSide: BorderSide(
            color: Color.fromRGBO(0, 0, 0, 0.5),
          ),
        ),
        focusedBorder: const OutlineInputBorder(
          borderSide: BorderSide(
            color: Color.fromRGBO(0, 0, 0, 0.5),
          ),
        ),
      ),
    );
  }
}
