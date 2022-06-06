import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pinput/pinput.dart';

import '../../../Service/api_service.dart';
import '../VerifyEmail/verify_email_screen.dart';

class EnterOtpScreen extends StatefulWidget {
  final String phone;
  final String referenceId;
  const EnterOtpScreen(
      {Key? key, required this.phone, required this.referenceId})
      : super(key: key);

  @override
  State<EnterOtpScreen> createState() => _EnterOtpScreenState();
}

class _EnterOtpScreenState extends State<EnterOtpScreen> {
  final TextEditingController _pinPutController = TextEditingController();
  final FocusNode _pinPutFocusNode = FocusNode();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(height: 40),
            Text('Verification',
                textAlign: TextAlign.center,
                style: GoogleFonts.montserrat(
                    fontWeight: FontWeight.w500,
                    fontStyle: FontStyle.normal,
                    color: const Color.fromRGBO(31, 68, 141, 1),
                    fontSize: 20.0)),
            const SizedBox(height: 20),
            SizedBox(
              width: 200,
              child: Text('Enter the code sent to the number',
                  textAlign: TextAlign.center,
                  style: GoogleFonts.montserrat(
                      fontWeight: FontWeight.w500,
                      fontStyle: FontStyle.normal,
                      color: const Color.fromRGBO(0, 0, 0, 1),
                      fontSize: 14.0)),
            ),
            const SizedBox(height: 10),
            Text('+234${widget.phone}',
                textAlign: TextAlign.center,
                style: GoogleFonts.montserrat(
                    fontWeight: FontWeight.w500,
                    fontStyle: FontStyle.normal,
                    color: const Color.fromRGBO(0, 0, 0, 1),
                    fontSize: 14.0)),
            const SizedBox(height: 20),
            Pinput(
              length: 6,
              focusNode: _pinPutFocusNode,
              controller: _pinPutController,
              onCompleted: verifyOtp,
            ),
            const SizedBox(height: 30),
            Container(
              width: MediaQuery.of(context).size.width,
              height: 50,
              decoration: BoxDecoration(
                color: const Color.fromRGBO(31, 68, 141, 1),
                borderRadius: BorderRadius.circular(15),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 2,
                    blurRadius: 2,
                    offset: const Offset(0, 3), // changes position of shadow
                  ),
                ],
              ),
              child: TextButton(
                  onPressed: () {},
                  child: Text('Verify Number',
                      style: GoogleFonts.montserrat(
                          fontWeight: FontWeight.w500,
                          color: const Color.fromRGBO(255, 255, 255, 1),
                          fontSize: 19.0))),
            ),
          ],
        ),
      ),
    );
  }

  void _showSnackBar(String pin, BuildContext context) {
    final snackBar = SnackBar(
      duration: const Duration(seconds: 3),
      content: SizedBox(
        height: 80.0,
        child: Center(
          child: Text(
            'Pin Submitted. Value: $pin',
            style: const TextStyle(fontSize: 25.0),
          ),
        ),
      ),
      backgroundColor: Colors.deepPurpleAccent,
    );
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

  var service = ApiService();
  verifyOtp(String pin) async {
    service.verifyOtp(pin, widget.referenceId).then((value) {
      if (value['valid'] == true) {
        Navigator.push(context,
            MaterialPageRoute(builder: ((context) => const VerifyEmail())));
        //
      } else {
        final snackBar = SnackBar(
            backgroundColor: const Color.fromRGBO(31, 68, 141, 1),
            content: Text('Pin incorrect or network issue',
                style: GoogleFonts.montserrat(
                    fontWeight: FontWeight.w600,
                    color: Colors.white,
                    fontSize: 18.0)));
        ScaffoldMessenger.of(context).showSnackBar(snackBar);
      }
    });
  }
}
