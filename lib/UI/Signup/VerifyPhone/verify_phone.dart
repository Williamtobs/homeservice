import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:homeservice/Service/api_service.dart';

import '../../Shared/images.dart';
import 'enter_otp.dart';

class VerifyPhone extends StatelessWidget {
  final String phone;
  final String senderId;
  VerifyPhone({Key? key, required this.phone, required this.senderId})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            const SizedBox(height: 40),
            Text('Verify Phone',
                textAlign: TextAlign.center,
                style: GoogleFonts.montserrat(
                    fontWeight: FontWeight.w500,
                    fontStyle: FontStyle.normal,
                    color: const Color.fromRGBO(31, 68, 141, 1),
                    fontSize: 16.0)),
            const SizedBox(height: 20),
            Image.asset(
              otp,
              height: 300,
            ),
            const SizedBox(height: 20),
            SizedBox(
              width: 300,
              child: Text(
                  'You will receive a verification code on +234$phone to verify your '
                  'phone number.',
                  textAlign: TextAlign.center,
                  style: GoogleFonts.montserrat(
                      fontWeight: FontWeight.w500,
                      fontStyle: FontStyle.normal,
                      color: const Color.fromRGBO(0, 0, 0, 1),
                      fontSize: 14.0)),
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
                  onPressed: () {
                    sendVerification(context);
                  },
                  child: Text('Continue',
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

  var service = ApiService();
  sendVerification(BuildContext context) async {
    service.postOtp(senderId, '234$phone').then((value) {
      if (value['message'] == 'sent') {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: ((context) => EnterOtpScreen(
                      phone: phone,
                      referenceId: value['reference_id'],
                    ))));
      } else {
        final snackBar = SnackBar(
            backgroundColor: const Color.fromRGBO(31, 68, 141, 1),
            content: Text('Error! something went wrong',
                style: GoogleFonts.montserrat(
                    fontWeight: FontWeight.w600,
                    color: Colors.white,
                    fontSize: 18.0)));
        ScaffoldMessenger.of(context).showSnackBar(snackBar);
      }
    });
  }
}
