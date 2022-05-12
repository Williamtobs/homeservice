import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SettingListTile extends StatelessWidget {
  final String title;
  final Icon icon;
  const SettingListTile({Key? key, required this.title, required this.icon})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      width: MediaQuery.of(context).size.width,
      child: ListTile(
        leading: icon,
        title: Text(title,
            style: GoogleFonts.montserrat(
                fontWeight: FontWeight.w500,
                fontStyle: FontStyle.normal,
                color: const Color.fromARGB(255, 14, 13, 13),
                fontSize: 15.0)),
        trailing: const Icon(
          Icons.arrow_forward_ios,
          color: Color.fromARGB(255, 14, 13, 13),
        ),
      ),
    );
  }
}
//Icon(Icons.account_circle, color: Color.fromARGB(255, 14, 13, 13),)
//arrow_forward_ios
