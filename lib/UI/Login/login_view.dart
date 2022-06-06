import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:homeservice/Constants/validators.dart';
import 'package:homeservice/Providers/auth_providers.dart';
import 'package:homeservice/UI/Authentication/forgot_password.dart';
import 'package:homeservice/UI/Shared/Formfield/textformfield_view.dart';
import 'package:homeservice/UI/Shared/custom_navigation.dart';
import 'package:homeservice/UI/Shared/images.dart';
import 'package:homeservice/UI/Signup/signup_view.dart';
import 'package:homeservice/UI/Startup/onboarding_screen2.dart';

import '../Signup/VerifyEmail/verify_email_screen.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final _formKey = GlobalKey<FormState>();
  bool visibility = true;
  bool agree = false;
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();

  void _onRememberMeChanged(bool? newValue) => setState(() {
        agree = newValue!;
      });

  final _focusNode = FocusNode();
  bool _isLoading = false;

  @override
  void initState() {
    super.initState();
    _focusNode.addListener(() {});
  }

  void loading() {
    setState(() {
      _isLoading = !_isLoading;
    });
  }

  @override
  void dispose() {
    _focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer(builder: (context, ref, _) {
      final _auth = ref.watch(authenticationProvider);
      final data = ref.watch(fireBaseAuthProvider);

      Future<void> _onPressedFunction() async {
        if (!_formKey.currentState!.validate()) {
          return;
        }
        loading();
        await _auth
            .signInWithEmailAndPassword(email.text, password.text, context)
            .whenComplete(() => _auth.authStateChange.listen((event) async {
                  final User user = data.currentUser!;
                  if (event == null) {
                    loading();
                    return;
                  }
                  if (user.emailVerified == true) {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => CustomNavigation()));
                  } else {
                    await user.sendEmailVerification();

                    final snackBar = SnackBar(
                        backgroundColor: const Color.fromRGBO(31, 68, 141, 1),
                        content: Text('Check your mail for verification link',
                            style: GoogleFonts.montserrat(
                                fontWeight: FontWeight.w600,
                                color: Colors.white,
                                fontSize: 16.0)));
                    ScaffoldMessenger.of(context).showSnackBar(snackBar);
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => const VerifyEmail()));
                    loading();
                  }
                }));
        loading();
      }

      return Scaffold(
          extendBodyBehindAppBar: true,
          appBar: AppBar(
            backgroundColor: Colors.transparent,
            elevation: 0,
            leading: IconButton(
              icon: const Icon(Icons.arrow_back_ios_outlined,
                  color: Color.fromRGBO(255, 255, 255, 1)),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            centerTitle: true,
            title: Text(
              'Login',
              //textAlign: TextAlign.center,
              style: GoogleFonts.montserrat(
                  fontWeight: FontWeight.w600,
                  color: const Color.fromRGBO(255, 255, 255, 1),
                  fontSize: 17.0),
            ),
            actions: [
              IconButton(
                icon: const Icon(Icons.clear_outlined,
                    color: Color.fromRGBO(255, 255, 255, 1)),
                onPressed: () {
                  Navigator.of(context).pushReplacement(MaterialPageRoute(
                      builder: (context) => const OnboardingScreen2()));
                },
              ),
            ],
          ),
          body: SingleChildScrollView(
            child: Form(
              key: _formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  SizedBox(
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height,
                    child: Stack(children: [
                      Container(color: const Color.fromRGBO(255, 255, 255, 1)),
                      Align(
                        alignment: Alignment.topCenter,
                        child: Container(
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              fit: BoxFit.cover,
                              colorFilter: ColorFilter.mode(
                                  Colors.blue.withOpacity(0.7),
                                  BlendMode.dstATop),
                              image: const AssetImage(
                                onboarding3,
                              ),
                            ),
                          ),
                          height: MediaQuery.of(context).size.height * 0.30,
                          width: MediaQuery.of(context).size.width,
                        ),
                      ),
                      Positioned(
                        bottom: 0,
                        child: Container(
                            padding: const EdgeInsets.only(
                                top: 20, left: 20, right: 20, bottom: 10),
                            height: MediaQuery.of(context).size.height * 0.80,
                            width: MediaQuery.of(context).size.width,
                            decoration: const BoxDecoration(
                                color: Color.fromRGBO(255, 255, 255, 1),
                                borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(35),
                                    topRight: Radius.circular(35))),
                            child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    children: [
                                      Text('Welcome back!',
                                          style: GoogleFonts.montserrat(
                                              fontWeight: FontWeight.w600,
                                              color: const Color.fromRGBO(
                                                  0, 0, 0, 1),
                                              fontSize: 30.0)),
                                      const SizedBox(width: 10),
                                      Image.asset(welcome,
                                          width: 25, height: 25)
                                    ],
                                  ),
                                  const SizedBox(height: 5),
                                  Text('Email',
                                      style: GoogleFonts.montserrat(
                                          fontWeight: FontWeight.w600,
                                          color: const Color.fromRGBO(
                                              78, 78, 78, 1),
                                          fontSize: 14.0)),
                                  const SizedBox(height: 5),
                                  TextFormFieldWidget(
                                    validate: Validators().validateTextField,
                                    controller: email,
                                    hintText: "Email Address",
                                    textInputType: TextInputType.emailAddress,
                                  ),
                                  const SizedBox(height: 10),
                                  Text('Password',
                                      style: GoogleFonts.montserrat(
                                          fontWeight: FontWeight.w600,
                                          color: const Color.fromRGBO(
                                              78, 78, 78, 1),
                                          fontSize: 14.0)),
                                  const SizedBox(height: 5),
                                  TextFormFieldWidget(
                                    validate: Validators().validateTextField,
                                    controller: password,
                                    textInputType: TextInputType.text,
                                    suffixIcon: IconButton(
                                      icon: visibility
                                          ? const Icon(
                                              Icons.visibility_outlined,
                                            )
                                          : const Icon(
                                              Icons.visibility_off_outlined,
                                            ),
                                      onPressed: () {
                                        setState(() {
                                          visibility = !visibility;
                                        });
                                      },
                                    ),
                                    obscureText: visibility,
                                  ),
                                  const SizedBox(height: 10),
                                  Align(
                                    alignment: Alignment.center,
                                    child: Container(
                                      width: 334,
                                      height: 45,
                                      alignment: Alignment.center,
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(35.0),
                                          color: const Color.fromRGBO(
                                              31, 68, 141, 1)),
                                      child: ElevatedButton(
                                        onPressed: () {
                                          _onPressedFunction();
                                          // Navigator.of(context).push(
                                          //     MaterialPageRoute(
                                          //         builder: (context) =>
                                          //             CustomNavigation()));
                                        },
                                        style: ElevatedButton.styleFrom(
                                            shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(35.0),
                                            ),
                                            minimumSize:
                                                const Size.fromHeight(45),
                                            elevation: 0,
                                            primary: const Color.fromRGBO(
                                                31, 68, 141, 1)),
                                        child: _isLoading == true
                                            ? const CircularProgressIndicator(
                                                color: Color.fromARGB(
                                                    255, 233, 229, 229),
                                              )
                                            : Text('Sign in',
                                                style: GoogleFonts.montserrat(
                                                  fontWeight: FontWeight.w600,
                                                  color: const Color.fromRGBO(
                                                      255, 255, 255, 1),
                                                  fontSize: 17.0,
                                                )),
                                      ),
                                    ),
                                  ),
                                  const SizedBox(height: 15),
                                  Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Padding(
                                          padding:
                                              const EdgeInsets.only(right: 5.0),
                                          child: SizedBox(
                                              height: 13,
                                              width: 13,
                                              child: Checkbox(
                                                value: agree,
                                                onChanged: _onRememberMeChanged,
                                              )),
                                        ),
                                        Text('Remember me ',
                                            style: GoogleFonts.roboto(
                                              fontWeight: FontWeight.w600,
                                              color: const Color.fromRGBO(
                                                  78, 78, 78, 1),
                                              fontSize: 12.0,
                                            )),
                                        const SizedBox(width: 20),
                                        GestureDetector(
                                          onTap: () {
                                            Navigator.of(context).push(
                                                MaterialPageRoute(
                                                    builder: (context) =>
                                                        const ForgotPassword()));
                                          },
                                          child: Text('Forgot Password',
                                              style: GoogleFonts.roboto(
                                                fontWeight: FontWeight.w600,
                                                color: const Color.fromRGBO(
                                                    240, 11, 52, 1),
                                                fontSize: 13.0,
                                              )),
                                        )
                                      ]),
                                  const Spacer(),
                                  Align(
                                    alignment: Alignment.center,
                                    child: GestureDetector(
                                        onTap: () {
                                          Navigator.of(context).push(
                                              MaterialPageRoute(
                                                  builder: (context) =>
                                                      const SignUp()));
                                        },
                                        child: Text('Create new account',
                                            style: GoogleFonts.roboto(
                                              fontWeight: FontWeight.w600,
                                              color: const Color.fromRGBO(
                                                  78, 78, 78, 1),
                                              fontSize: 12.0,
                                            ))),
                                  )
                                ])),
                      )
                    ]),
                  )
                ],
              ),
            ),
          ));
    });
  }
}
