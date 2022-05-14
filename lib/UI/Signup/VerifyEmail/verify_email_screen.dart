import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../Providers/auth_providers.dart';
import '../../Login/login_view.dart';
import '../../Shared/images.dart';

class VerifyEmail extends StatelessWidget {
  const VerifyEmail({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer(builder: (context, ref, _) {
      final _auth = ref.watch(authenticationProvider);
      final data = ref.watch(fireBaseAuthProvider);
      final User user = data.currentUser!;

      void emailVerified() async {
        await _auth.signOut();
        Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(builder: (context) => const Login()),
            ModalRoute.withName('/'));
      }

      void resendVerificationMail() async {
        if (user.emailVerified == false) {
          await user.sendEmailVerification();
          final snackBar = SnackBar(
              backgroundColor: const Color.fromRGBO(31, 68, 141, 1),
              content: Text('Confirmation mail sent!!!',
                  style: GoogleFonts.montserrat(
                      fontWeight: FontWeight.w600,
                      color: Colors.white,
                      fontSize: 16.0)));
          ScaffoldMessenger.of(context).showSnackBar(snackBar);
        }
        final snackBar = SnackBar(
            backgroundColor: const Color.fromRGBO(31, 68, 141, 1),
            content: Text('Email verified, proceed to login',
                style: GoogleFonts.montserrat(
                    fontWeight: FontWeight.w600,
                    color: Colors.white,
                    fontSize: 16.0)));
        ScaffoldMessenger.of(context).showSnackBar(snackBar);
      }

      return Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(children: [
            const SizedBox(
              height: 20,
            ),
            Image.asset(email),
            //Color.fromRGBO(31, 68, 141, 1),
            const SizedBox(
              height: 10,
            ),
            SizedBox(
              width: 150,
              child: Text('Yeay Confirm Your Email',
                  textAlign: TextAlign.center,
                  style: GoogleFonts.montserrat(
                      fontWeight: FontWeight.w700,
                      fontStyle: FontStyle.normal,
                      color: const Color.fromRGBO(31, 68, 141, 1),
                      fontSize: 16.0)),
            ),
            const SizedBox(
              height: 10,
            ),
            SizedBox(
              width: 250,
              child: Text(
                  'Please check your email for confirmation mail. Click link in '
                  'email to verify your account',
                  textAlign: TextAlign.center,
                  style: GoogleFonts.montserrat(
                      fontWeight: FontWeight.w500,
                      fontStyle: FontStyle.normal,
                      color: const Color.fromRGBO(0, 0, 0, 1),
                      fontSize: 14.0)),
            ),
            const SizedBox(
              height: 40,
            ),
            GestureDetector(
              onTap: resendVerificationMail,
              child: Text("Resend Confirmation Mail",
                  textAlign: TextAlign.center,
                  style: GoogleFonts.montserrat(
                      fontWeight: FontWeight.w500,
                      fontStyle: FontStyle.normal,
                      color: const Color.fromRGBO(31, 68, 141, 1),
                      fontSize: 14.0)),
            ),
            const SizedBox(
              height: 10,
            ),
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
                  onPressed: emailVerified,
                  child: Text('PROCEED TO LOGIN',
                      style: GoogleFonts.montserrat(
                          fontWeight: FontWeight.w500,
                          color: const Color.fromRGBO(255, 255, 255, 1),
                          fontSize: 19.0))),
            ),
          ]),
        ),
      );
    });
  }
}
