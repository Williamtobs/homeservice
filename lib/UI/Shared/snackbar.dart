import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SnackkBar extends StatelessWidget {
  const SnackkBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SnackBar(
        content: Text('Select time',
            style: GoogleFonts.montserrat(
                fontWeight: FontWeight.w600,
                color: const Color.fromRGBO(31, 68, 141, 1),
                fontSize: 24.0)));
  }
}
