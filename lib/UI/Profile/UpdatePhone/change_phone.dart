import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../Constants/validators.dart';
import '../../../Database/database.dart';
import '../../../Providers/auth_providers.dart';
import '../widgets/other_text_field.dart';

class ChangeNumber extends StatelessWidget {
  ChangeNumber({Key? key}) : super(key: key);

  final TextEditingController _controllerNumber = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Consumer(builder: (context, ref, _) {
      final FirebaseAuth auth = FirebaseAuth.instance;
      final data = ref.watch(fireBaseAuthProvider);
      Future<void> onPressed() async {
        if (!_formKey.currentState!.validate()) {
          return;
        }
        saveInfo(data.currentUser!.uid, context);
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
            title: Text('Change Password',
                style: GoogleFonts.montserrat(
                    fontWeight: FontWeight.w600,
                    fontStyle: FontStyle.normal,
                    color: const Color.fromRGBO(0, 0, 0, 1),
                    fontSize: 16.0)),
            actions: [
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: GestureDetector(
                  onTap: () {},
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
          body: Column(
            children: [
              const SizedBox(
                height: 20,
              ),
              Container(
                color: Colors.white,
                width: MediaQuery.of(context).size.width,
                child: Column(
                  children: [
                    const SizedBox(
                      height: 20,
                    ),
                    SizedBox(
                      width: MediaQuery.of(context).size.width,
                      height: 50,
                      child: OtherTextField(
                        controller: _controllerNumber,
                        obscureText: true,
                        label: 'New Phone number',
                        validate: Validators().validateTextField,
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      );
    });
  }

  var setup = Database();
  saveInfo(var uid, BuildContext context) async {
    await setup.updatePhone(
        uid: uid, phone: _controllerNumber.text, context: context);
  }
}
