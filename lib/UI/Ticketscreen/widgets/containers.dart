import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Containers extends StatelessWidget {
  final String name;
  final Color boxColor;
  final Color textColor;
  const Containers(
      {Key? key,
      required this.name,
      required this.boxColor,
      required this.textColor})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 86,
      height: 35,
      alignment: Alignment.center,
      padding: const EdgeInsets.all(5),
      decoration: BoxDecoration(
          color: boxColor, borderRadius: BorderRadius.circular(30)),
      child: Text(name,
          style: GoogleFonts.montserrat(
              fontWeight: FontWeight.w500, color: textColor, fontSize: 18.0)),
    );
  }
}
