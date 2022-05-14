import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../Constants/validators.dart';
import '../../../Database/database.dart';
import '../../../Providers/auth_providers.dart';
import '../widgets/other_text_field.dart';

class UpdateEmail extends StatelessWidget {
  UpdateEmail({Key? key}) : super(key: key);

  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _newEmailController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  String? message;

  @override
  Widget build(BuildContext context) {
    return Consumer(builder: (context, ref, _) {
      final FirebaseAuth auth = FirebaseAuth.instance;
      final data = ref.watch(fireBaseAuthProvider);
      final _auth = ref.watch(authenticationProvider);

      Future<void> _onPressedFunction() async {
        if (!_formKey.currentState!.validate()) {
          return;
        }
        final User user = auth.currentUser!;
        await _auth
            .signInWithEmailAndPassword(
                _emailController.text, _passwordController.text, context)
            .whenComplete(() => _auth.authStateChange.listen((event) async {
                  if (event == null) {
                    return;
                  }
                  await user
                      .verifyBeforeUpdateEmail(_newEmailController.text)
                      .then((value) {
                    message = 'Success';
                    saveInfo(data.currentUser!.uid);
                    print(message!);
                    final snackBar = SnackBar(
                        backgroundColor: const Color.fromRGBO(31, 68, 141, 1),
                        content: Text('Successful! update email',
                            style: GoogleFonts.montserrat(
                                fontWeight: FontWeight.w600,
                                color: Colors.white,
                                fontSize: 16.0)));
                    ScaffoldMessenger.of(context).showSnackBar(snackBar);
                  }).catchError((onError) {
                    message = 'error';
                    final snackBar = SnackBar(
                        backgroundColor: const Color.fromRGBO(31, 68, 141, 1),
                        content: Text('Process failed! Something went wrong',
                            style: GoogleFonts.montserrat(
                                fontWeight: FontWeight.w600,
                                color: Colors.white,
                                fontSize: 16.0)));
                    ScaffoldMessenger.of(context).showSnackBar(snackBar);
                  });
                }));
      }

      return Form(
        key: _formKey,
        child: Scaffold(
          backgroundColor: const Color.fromRGBO(250, 250, 250, 1),
          appBar: AppBar(
            elevation: 0,
            backgroundColor: Colors.white,
            leading: IconButton(
              icon: const Icon(
                Icons.arrow_back_ios_new_outlined,
                color: Colors.black,
              ),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            centerTitle: true,
            title: Text('Change Email',
                style: GoogleFonts.montserrat(
                    fontWeight: FontWeight.w600,
                    fontStyle: FontStyle.normal,
                    color: const Color.fromRGBO(0, 0, 0, 1),
                    fontSize: 16.0)),
            actions: [
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: GestureDetector(
                  onTap: () {
                    _onPressedFunction();
                  },
                  child: Text('Save',
                      style: GoogleFonts.montserrat(
                          fontWeight: FontWeight.w500,
                          fontStyle: FontStyle.normal,
                          color: const Color.fromRGBO(0, 0, 0, 1),
                          fontSize: 14.0)),
                ),
              )
            ],
          ),
          body: SingleChildScrollView(
            child: Column(
              children: [
                const SizedBox(
                  height: 20,
                ),
                Container(
                  color: Colors.white,
                  width: MediaQuery.of(context).size.width,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      children: [
                        const SizedBox(
                          height: 20,
                        ),
                        SizedBox(
                          width: MediaQuery.of(context).size.width,
                          height: 50,
                          child: OtherTextField(
                            controller: _emailController,
                            label: 'Email',
                            validate: Validators().validateEmail,
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        SizedBox(
                          width: MediaQuery.of(context).size.width,
                          height: 50,
                          child: OtherTextField(
                            controller: _passwordController,
                            label: 'Password',
                            validate: Validators().validateTextField,
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        SizedBox(
                          width: MediaQuery.of(context).size.width,
                          height: 50,
                          child: OtherTextField(
                            controller: _newEmailController,
                            label: 'New email',
                            validate: Validators().validateEmail,
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      );
    });
  }

  var setup = Database();
  saveInfo(var uid) async {
    await setup.updateEmail(uid: uid, email: _newEmailController.text);
  }
}
