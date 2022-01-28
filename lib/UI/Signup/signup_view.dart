import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:homeservice/Constants/validators.dart';
import 'package:homeservice/UI/Home/home.dart';
import 'package:homeservice/UI/Shared/Formfield/create_passwordfield.dart';
import 'package:homeservice/UI/Shared/Formfield/textformfield_view.dart';
import 'package:homeservice/UI/Shared/images.dart';

class SignUp extends StatefulWidget{
  const SignUp({Key? key}) : super(key: key);

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController controller = TextEditingController();
  bool agree = false;
  bool visibility = true;

  void _onRememberMeChanged(bool? newValue) => setState(() {
    agree = newValue!; });

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Scaffold(
        body: Column(
            mainAxisAlignment : MainAxisAlignment.end,
          children: [
            SizedBox(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
              child: Stack(
                children: [
                  Container(
                      color: const Color.fromRGBO(255, 255, 255, 1)
                  ),
                  Align(
                    alignment:Alignment.topCenter,
                    child: Container(
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          fit: BoxFit.cover,
                          colorFilter:
                          ColorFilter.mode(Colors.blue.withOpacity(0.7),
                              BlendMode.dstATop),
                          image: const AssetImage(
                            onboarding3,
                          ),
                        ),),
                      height: MediaQuery.of(context).size.height * 0.30,
                      width: MediaQuery.of(context).size.width,
                    ),
                  ),
                  Align(
                    alignment:Alignment.topCenter,
                    child: Container(
                      color: Colors.transparent,
                      child: Column(
                        children: [
                          const SizedBox(height: 10,),
                          ListTile(
                            tileColor: Colors.transparent,
                            leading: const Icon(
                              Icons.arrow_back_ios_outlined,
                                color: Color.fromRGBO(255, 255, 255, 1)
                            ),
                            title: Text('Register Account',
                              textAlign: TextAlign.center,
                              style: GoogleFonts.montserrat(
                                fontWeight: FontWeight.w600,
                                color: const Color.fromRGBO(255, 255, 255, 1),
                                fontSize: 17.0
                            ),),
                            trailing: const Icon(
                              Icons.clear_outlined,
                                color: Color.fromRGBO(255, 255, 255, 1)
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Positioned(
                    bottom: 0,
                    child: Container(
                      padding: const EdgeInsets.only(top: 20, left: 20, right: 20, bottom: 10),
                        height: MediaQuery.of(context).size.height * 0.80,
                      width: MediaQuery.of(context).size.width,
                      decoration: const BoxDecoration(
                          color: Color.fromRGBO(255, 255, 255, 1),
                          borderRadius: BorderRadius.only(topLeft: Radius.circular(35), topRight: Radius.circular(35))
                      ),
                      child: SingleChildScrollView(
                        physics: const AlwaysScrollableScrollPhysics(),
                        child: Column(
                            crossAxisAlignment : CrossAxisAlignment.start,
                          children:[
                            Row(
                              children: [
                                Text('Hello!', style: GoogleFonts.montserrat(
                                    fontWeight: FontWeight.w600,
                                    color: const Color.fromRGBO(0, 0, 0, 1),
                                    fontSize: 30.0
                                )),
                                Image.asset(hello, width: 35, height: 35)
                              ],
                            ),
                            const SizedBox(height: 5),
                            Text('Create an account to continue',  style: GoogleFonts.montserrat(
                                fontWeight: FontWeight.w600,
                                color: const Color.fromRGBO(132, 132, 132, 1),
                                fontSize: 17.0
                            )),
                            const SizedBox(height: 5),
                            Text('Your Name',  style: GoogleFonts.montserrat(
                                fontWeight: FontWeight.w600,
                                color: const Color.fromRGBO(78, 78, 78, 1),
                                fontSize: 14.0
                            )),
                            const SizedBox(height: 5),
                            TextFormFieldWidget(hintText: "First Name", textInputType: TextInputType.text,
                              validate: Validators().validateTextField,),
                            const SizedBox(height: 5),
                            TextFormFieldWidget(hintText: "Last Name", textInputType: TextInputType.text,
                              validate: Validators().validateTextField,),
                            const SizedBox(height: 5),
                            Text('Phone Number',  style: GoogleFonts.montserrat(
                                fontWeight: FontWeight.w600,
                                color: const Color.fromRGBO(78, 78, 78, 1),
                                fontSize: 14.0
                            )),
                            const SizedBox(height: 5),
                            TextFormFieldWidget(hintText: "Your phone number", textInputType: TextInputType.text,
                              validate: Validators().validateTextField, ),
                            const SizedBox(height: 5),
                            Text('Email Address',  style: GoogleFonts.montserrat(
                                fontWeight: FontWeight.w600,
                                color: const Color.fromRGBO(78, 78, 78, 1),
                                fontSize: 14.0
                            )),
                            TextFormFieldWidget(hintText: "Your Email Address", textInputType: TextInputType.emailAddress,
                              validate: Validators().validateEmail,
                              controller: controller, ),
                            const SizedBox(height: 5),
                            Text('Password',  style: GoogleFonts.montserrat(
                                fontWeight: FontWeight.w600,
                                color: const Color.fromRGBO(78, 78, 78, 1),
                                fontSize: 14.0
                            )),
                            const SizedBox(height: 5),
                            PasswordField(suffixIcon: IconButton(
                              icon: visibility ? const Icon(
                                Icons.visibility_outlined,
                              ) : const Icon( Icons.visibility_off_outlined,),
                              onPressed: () { setState(() {
                                visibility = !visibility;
                              }); },
                            ), obscureText: visibility, hintText: 'Password',),
                            const SizedBox(height: 5),
                            const TextFormFieldWidget(hintText: "State", textInputType: TextInputType.text, ),
                            const SizedBox(height: 5),
                            const TextFormFieldWidget(hintText: "Discount Code", textInputType: TextInputType.text, ),
                            const SizedBox(height: 5),
                            Row(
                              children:[
                                Checkbox(value: agree, onChanged: _onRememberMeChanged, shape: const CircleBorder(),),
                                Expanded(
                                  child: Text('By creating an account you agree to our Terms of services', style: GoogleFonts.montserrat(
                                      fontWeight: FontWeight.w600,
                                      color: const Color.fromRGBO(132, 132, 132, 1),
                                      fontSize: 13.0
                                  )),
                                )
                              ]
                            ),
                            const SizedBox(height: 5),
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
                                child: ElevatedButton(
                                  onPressed:(){
                                  if (_formKey.currentState!.validate()){
                                    Navigator.of(context).push(MaterialPageRoute(builder: (context) => const HomeScreen()));
                                    }
                                  },
                                  style: ElevatedButton.styleFrom(
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(35.0),
                                    ),
                                    minimumSize: const Size.fromHeight(45),
                                    elevation: 0,
                                    primary: const Color.fromRGBO(31, 68, 141, 1)
                                ),
                                  child:
                                  Text('Create Account', style: GoogleFonts.montserrat(
                                    fontWeight: FontWeight.w600,
                                    color: const Color.fromRGBO(255, 255, 255, 1),
                                    fontSize: 16.0,
                                  )),
                                ),
                              ),
                            ),
                            const SizedBox(height: 5),
                            Row(
                                mainAxisAlignment : MainAxisAlignment.center,
                              children: [
                                Text('Already have an account? ', style: GoogleFonts.roboto(
                                  fontWeight: FontWeight.w600,
                                  color: const Color.fromRGBO(78, 78, 78, 1),
                                  fontSize: 12.0,
                                )),
                                const SizedBox(height: 5),
                                Text('Log in', style: GoogleFonts.roboto(
                                  fontWeight: FontWeight.w600,
                                  color: const Color.fromRGBO(31, 68, 141, 1),
                                  fontSize: 13.0,
                                ))
                              ]
                            )
                          ]
                        ),
                      )
                    ),
                  )

                ]
              ),
            ),
          ],
        )
      ),
    );
  }
}