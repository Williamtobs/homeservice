import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:homeservice/UI/Authentication/create_password.dart';
import 'package:otp_text_field/otp_text_field.dart';
import 'package:otp_text_field/style.dart';

class OtpScreen extends StatelessWidget{
  const OtpScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Verification', style: GoogleFonts.montserrat(
                fontWeight: FontWeight.w600,
                color: const Color.fromRGBO(0, 0, 0, 1),
                fontSize: 26.0
            )),
            const SizedBox(height: 10),
            OTPTextField(
              length: 4,
              width: MediaQuery.of(context).size.width,
              fieldWidth: 57,
              style: const TextStyle(
                  fontSize: 17
              ),
              textFieldAlignment: MainAxisAlignment.spaceAround,
              fieldStyle: FieldStyle.box,
              onCompleted: (pin) {
                Navigator.of(context).push(MaterialPageRoute(builder: (context) => const CreatePassword()));
                print("Completed: " + pin);
              },
            ),
            const SizedBox(height: 20),
            Align(
              alignment: Alignment.center,
              child: Text('Didn’t receive code?', style: GoogleFonts.montserrat(
                  fontWeight: FontWeight.w600,
                  color: const Color.fromRGBO(78, 78, 78, 1),
                  fontSize: 13.0
              ))
            ),
            const SizedBox(height: 10),
            Align(
                alignment: Alignment.center,
                child: Text('Resend Now', style: GoogleFonts.montserrat(
                    fontWeight: FontWeight.w600,
                    color: const Color.fromRGBO(240, 11, 52, 1),
                    fontSize: 13.0
                ))
            )
          ],
          ),
        ));
  }

}