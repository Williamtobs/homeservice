import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Appbar extends StatelessWidget {
  final String? notification;
  const Appbar({Key? key, required this.notification}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      centerTitle: true,
      backgroundColor: const Color.fromRGBO(254, 254, 254, 1),
      elevation: 0,
      leading: IconButton(
        icon: const Icon(
          Icons.arrow_back_ios_new_outlined,
          color: Colors.black,
        ),
        onPressed: () {
          Navigator.of(context).pop();
        },
      ),
      title: Text(notification!,
          style: GoogleFonts.montserrat(
              fontWeight: FontWeight.w600,
              fontStyle: FontStyle.normal,
              color: const Color.fromRGBO(0, 0, 0, 1),
              fontSize: 29.0)),
    );
  }
}
