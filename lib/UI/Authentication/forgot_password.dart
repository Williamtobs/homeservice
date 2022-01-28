import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:homeservice/UI/Authentication/otp_screen.dart';
import 'package:homeservice/UI/Shared/Formfield/textformfield_view.dart';
import 'package:homeservice/UI/Shared/images.dart';

class ForgotPassword extends StatelessWidget{
  const ForgotPassword({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Text('Reset Password', style: GoogleFonts.montserrat(
                    fontWeight: FontWeight.w600,
                    color: const Color.fromRGBO(0, 0, 0, 1),
                    fontSize: 29.0
                )),
                Image.asset(thinking, width: 35, height: 35)
              ],
            ),
            const SizedBox(height: 10),
            Text('Enter the email associated with your account and we’ll '
                'send an email with instructions to reset '
                'your password.', style: GoogleFonts.montserrat(
                fontWeight: FontWeight.w600,
                color: const Color.fromRGBO(78, 78, 78, 1),
                fontSize: 15.0
            )),
            const SizedBox(height: 10),
            const TextFormFieldWidget(hintText: "Email Address", textInputType: TextInputType.emailAddress, ),
            const SizedBox(height: 10),
            Align(
              alignment: Alignment.center,
              child: Container(
                width: 334,
                height: 45,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(35.0),
                    color: const Color.fromRGBO(31, 68, 141, 1)
                ),
                child: ElevatedButton(onPressed:(){
                  Navigator.of(context).push(MaterialPageRoute(builder: (context) => const OtpScreen()));
                }, style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(35.0),
                    ),
                    minimumSize: const Size.fromHeight(45),
                    elevation: 0,
                    primary: const Color.fromRGBO(31, 68, 141, 1)
                ),
                  child:
                  Text('RESET', style: GoogleFonts.montserrat(
                    fontWeight: FontWeight.w600,
                    color: const Color.fromRGBO(255, 255, 255, 1),
                    fontSize: 20.0,
                  )),
                ),
              ),
            ),
          ],
        ),
      )
    );
  }

}