import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:homeservice/Constants/states.dart';
import 'package:homeservice/Constants/validators.dart';
import 'package:homeservice/Database/database.dart';
import 'package:homeservice/Providers/auth_providers.dart';
import 'package:homeservice/UI/Login/login_view.dart';
import 'package:homeservice/UI/Shared/Formfield/create_passwordfield.dart';
import 'package:homeservice/UI/Shared/Formfield/textformfield_view.dart';
import 'package:homeservice/UI/Shared/custom_navigation.dart';
import 'package:homeservice/UI/Shared/images.dart';
import 'package:homeservice/UI/Startup/onboarding_screen2.dart';

import 'VerifyEmail/verify_email_screen.dart';

class SignUp extends StatefulWidget {
  const SignUp({Key? key}) : super(key: key);

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController controller = TextEditingController();
  bool agree = false;
  bool visibility = true;
  bool _isLoading = false;
  final _email = TextEditingController();
  final _password = TextEditingController();
  TextEditingController firstName = TextEditingController();
  TextEditingController surName = TextEditingController();
  TextEditingController phone = TextEditingController();
  TextEditingController code = TextEditingController();
  var uid;
  String? state;

  void _onRememberMeChanged(bool? newValue) => setState(() {
        agree = newValue!;
      });

  void loading() {
    setState(() {
      _isLoading = !_isLoading;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Consumer(builder: (context, ref, _) {
      final _auth = ref.watch(authenticationProvider);
      final data = ref.watch(fireBaseAuthProvider);

      //FirebaseAuth _auth = FirebaseAuth.instance;

      Future<void> _onPressedFunction() async {
        if (!_formKey.currentState!.validate()) {
          return;
        }
        //print('here');
        loading();
        await _auth
            .signUpWithEmailAndPassword(_email.text, _password.text, context)
            .whenComplete(() => _auth.authStateChange.listen((event) async {
                  if (event == null) {
                    loading();
                    return;
                  }
                  saveInfo(data.currentUser!.uid);
                  final User user = data.currentUser!;
                  await user.sendEmailVerification().then((value) async {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => const VerifyEmail()));
                  });
                  print(data.currentUser!.uid);
                }));
      }

      return Form(
        key: _formKey,
        child: Scaffold(
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
              title: Text(
                'Register Account',
                textAlign: TextAlign.center,
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
                                top: 8, left: 20, right: 20, bottom: 10),
                            height: MediaQuery.of(context).size.height * 0.88,
                            width: MediaQuery.of(context).size.width,
                            decoration: const BoxDecoration(
                                color: Color.fromRGBO(255, 255, 255, 1),
                                borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(35),
                                    topRight: Radius.circular(35))),
                            child:
                                ListView(padding: EdgeInsets.zero, children: [
                              const SizedBox(
                                height: 10,
                              ),
                              Row(
                                children: [
                                  Text('Hello!',
                                      style: GoogleFonts.montserrat(
                                          fontWeight: FontWeight.w600,
                                          color:
                                              const Color.fromRGBO(0, 0, 0, 1),
                                          fontSize: 30.0)),
                                  const SizedBox(width: 10),
                                  Image.asset(hello, width: 35, height: 35)
                                ],
                              ),
                              const SizedBox(height: 5),
                              Text('Create an account to continue',
                                  style: GoogleFonts.montserrat(
                                      fontWeight: FontWeight.w600,
                                      color: const Color.fromRGBO(
                                          132, 132, 132, 1),
                                      fontSize: 17.0)),
                              const SizedBox(height: 5),
                              TextFormFieldWidget(
                                hintText: "First Name",
                                controller: firstName,
                                textInputType: TextInputType.text,
                                validate: Validators().validateTextField,
                              ),
                              const SizedBox(height: 5),
                              TextFormFieldWidget(
                                hintText: "Last Name",
                                controller: surName,
                                textInputType: TextInputType.text,
                                validate: Validators().validateTextField,
                              ),
                              const SizedBox(height: 5),
                              TextFormFieldWidget(
                                hintText: "Your phone number",
                                controller: phone,
                                textInputType: TextInputType.text,
                                validate: Validators().validateTextField,
                              ),
                              const SizedBox(height: 5),
                              TextFormFieldWidget(
                                hintText: "Your Email Address",
                                textInputType: TextInputType.emailAddress,
                                validate: Validators().validateEmail,
                                controller: _email,
                              ),
                              const SizedBox(height: 5),
                              PasswordField(
                                controller: _password,
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
                                hintText: 'Password',
                              ),
                              const SizedBox(height: 5),
                              Container(
                                  height: 50.0,
                                  padding: const EdgeInsets.all(15),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(15.0),
                                    border: Border.all(
                                        color:
                                            const Color.fromRGBO(0, 0, 0, 1)),
                                  ),
                                  child: DropdownButtonHideUnderline(
                                      child: DropdownButton(
                                    borderRadius: BorderRadius.circular(15.0),
                                    hint: Text(
                                      'State',
                                      style: GoogleFonts.montserrat(
                                        color: const Color.fromRGBO(
                                            132, 132, 132, 1),
                                        fontSize: 14.0,
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                    icon: const Icon(
                                        Icons.keyboard_arrow_down_outlined,
                                        color: Colors.black),
                                    value: state,
                                    isDense: true,
                                    onChanged: (String? value) {
                                      setState(() {
                                        state = value;
                                        print(state);
                                        //hint = value!;
                                        //state.didChange(value);
                                      });
                                    },
                                    items: states
                                        .map((String value) =>
                                            DropdownMenuItem<String>(
                                              value: value,
                                              child: Text(
                                                value,
                                                style: GoogleFonts.montserrat(
                                                  color: const Color.fromRGBO(
                                                      132, 132, 132, 1),
                                                  fontSize: 13.0,
                                                  fontWeight: FontWeight.w600,
                                                ),
                                              ),
                                            ))
                                        .toList(),
                                  ))),
                              const SizedBox(height: 5),
                              TextFormFieldWidget(
                                controller: code,
                                hintText: "Discount Code",
                                textInputType: TextInputType.text,
                              ),
                              const SizedBox(height: 5),
                              Row(children: [
                                Checkbox(
                                  value: agree,
                                  activeColor: Colors.green,
                                  onChanged: _onRememberMeChanged,
                                  shape: const CircleBorder(),
                                ),
                                Expanded(
                                  child: Text(
                                      'By creating an account you agree to our Terms of services',
                                      style: GoogleFonts.montserrat(
                                          fontWeight: FontWeight.w600,
                                          color: const Color.fromRGBO(
                                              132, 132, 132, 1),
                                          fontSize: 13.0)),
                                )
                              ]),
                              const SizedBox(height: 5),
                              Align(
                                alignment: Alignment.center,
                                child: Container(
                                  width: 334,
                                  height: 45,
                                  alignment: Alignment.center,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(35.0),
                                      color:
                                          const Color.fromRGBO(31, 68, 141, 1)),
                                  child: ElevatedButton(
                                    onPressed: _onPressedFunction,
                                    style: ElevatedButton.styleFrom(
                                        shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(35.0),
                                        ),
                                        minimumSize: const Size.fromHeight(45),
                                        elevation: 0,
                                        primary: const Color.fromRGBO(
                                            31, 68, 141, 1)),
                                    child: _isLoading
                                        ? const Center(
                                            child: CircularProgressIndicator(
                                            color: Colors.white,
                                          ))
                                        : Text('Create Account',
                                            style: GoogleFonts.montserrat(
                                              fontWeight: FontWeight.w600,
                                              color: const Color.fromRGBO(
                                                  255, 255, 255, 1),
                                              fontSize: 16.0,
                                            )),
                                  ),
                                ),
                              ),
                              const SizedBox(height: 5),
                              Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text('Already have an account? ',
                                        style: GoogleFonts.roboto(
                                          fontWeight: FontWeight.w600,
                                          color: const Color.fromRGBO(
                                              78, 78, 78, 1),
                                          fontSize: 12.0,
                                        )),
                                    const SizedBox(height: 5),
                                    GestureDetector(
                                      onTap: () {
                                        Navigator.of(context).push(
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    const Login()));
                                      },
                                      child: Text('Log in',
                                          style: GoogleFonts.roboto(
                                            fontWeight: FontWeight.w600,
                                            color: const Color.fromRGBO(
                                                31, 68, 141, 1),
                                            fontSize: 13.0,
                                          )),
                                    )
                                  ])
                            ])),
                      )
                    ]),
                  ),
                ],
              ),
            )),
      );
    });
  }

  var setup = Database();

  saveInfo(var uid) async {
    //print(state);
    await setup.storeUserData(
        uid: uid,
        phone: phone.text.trim(),
        state: state!,
        email: _email.text.trim(),
        code: code.text.trim(),
        firstName: firstName.text.trim(),
        lastName: surName.text.trim(),
        amount: '0',
        houseAddress: '',
        deliveryAddress: '');
  }
}
