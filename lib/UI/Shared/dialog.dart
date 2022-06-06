import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:homeservice/UI/Shared/custom_navigation.dart';

class DialogMessage extends StatelessWidget {
  final String message;
  final String subMessage;
  final String response;
  final String image;
  final bool failed;
  const DialogMessage(
      {Key? key,
      required this.message,
      required this.subMessage,
      required this.response,
      required this.image,
      required this.failed})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(25),
      ),
      backgroundColor: Colors.white,
      elevation: 0,
      child: SizedBox(
        width: MediaQuery.of(context).size.width,
        height: 400,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              image,
              height: 80,
              width: 80,
            ),
            const SizedBox(
              height: 40,
            ),
            //checkDialog
            Text(message,
                style: GoogleFonts.montserrat(
                    fontWeight: FontWeight.w600,
                    color: Colors.black,
                    fontSize: 18.0)),
            const SizedBox(
              height: 10,
            ),
            Center(
              child: Text(subMessage,
                  textAlign: TextAlign.center,
                  style: GoogleFonts.montserrat(
                      fontWeight: FontWeight.w400,
                      color: Colors.black,
                      fontSize: 14.0)),
            ),
            const SizedBox(
              height: 20,
            ),
            Container(
                width: 100,
                decoration: BoxDecoration(
                  color: const Color.fromRGBO(31, 68, 141, 1),
                  borderRadius: BorderRadius.circular(25),
                ),
                child: TextButton(
                  onPressed: () {
                    if (failed) {
                      Navigator.pop(context);
                    } else {
                      Navigator.pushAndRemoveUntil(context,
                          MaterialPageRoute(builder: (context) {
                        return CustomNavigation();
                      }), (route) => false);
                    }
                  },
                  child: Text(response,
                      style: GoogleFonts.montserrat(
                          fontWeight: FontWeight.w400,
                          color: Colors.white,
                          fontSize: 14.0)),
                ))
          ],
        ),
      ),
    );
  }
}
