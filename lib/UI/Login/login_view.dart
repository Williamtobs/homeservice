
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:homeservice/UI/Authentication/forgot_password.dart';
import 'package:homeservice/UI/Shared/Formfield/textformfield_view.dart';
import 'package:homeservice/UI/Shared/images.dart';

class Login extends StatefulWidget{
  const Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {

  bool visibility = true;
  bool agree = false;

  void _onRememberMeChanged(bool? newValue) => setState(() {
    agree = newValue!; });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                            title: Text('Log in',
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
                        child: Column(
                            crossAxisAlignment : CrossAxisAlignment.start,
                            children:[
                              Row(
                                children: [
                                  Text('Welcome back!', style: GoogleFonts.montserrat(
                                      fontWeight: FontWeight.w600,
                                      color: const Color.fromRGBO(0, 0, 0, 1),
                                      fontSize: 30.0
                                  )),
                                  Image.asset(welcome, width: 35, height: 35)
                                ],
                              ),
                              const SizedBox(height: 5),

                              Text('Email',  style: GoogleFonts.montserrat(
                                  fontWeight: FontWeight.w600,
                                  color: const Color.fromRGBO(78, 78, 78, 1),
                                  fontSize: 14.0
                              )),
                              const SizedBox(height: 5),
                              const TextFormFieldWidget(hintText: "Email Address", textInputType: TextInputType.emailAddress, ),
                              const SizedBox(height: 10),
                              Text('Password',  style: GoogleFonts.montserrat(
                                  fontWeight: FontWeight.w600,
                                  color: const Color.fromRGBO(78, 78, 78, 1),
                                  fontSize: 14.0
                              )),
                              const SizedBox(height: 5),
                              TextFormFieldWidget(textInputType: TextInputType.text, suffixIcon: IconButton(
                                icon: visibility ? const Icon(
                                  Icons.visibility_outlined,
                                ) : const Icon( Icons.visibility_off_outlined,),
                                 onPressed: () { setState(() {
                                   visibility = !visibility;
                                 }); },
                              ), obscureText: visibility, ),
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
                                  child: ElevatedButton(onPressed:(){}, style: ElevatedButton.styleFrom(
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(35.0),
                                      ),
                                      minimumSize: const Size.fromHeight(45),
                                      elevation: 0,
                                      primary: const Color.fromRGBO(31, 68, 141, 1)
                                  ),
                                    child:
                                    Text('Sign in', style: GoogleFonts.montserrat(
                                      fontWeight: FontWeight.w600,
                                      color: const Color.fromRGBO(255, 255, 255, 1),
                                      fontSize: 17.0,
                                    )),
                                  ),
                                ),
                              ),
                              const SizedBox(height: 5),
                              Row(
                                  mainAxisAlignment : MainAxisAlignment.center,
                                  children: [
                                    Checkbox(value: agree, onChanged: _onRememberMeChanged,),
                                    Text('Remember me ', style: GoogleFonts.roboto(
                                      fontWeight: FontWeight.w600,
                                      color: const Color.fromRGBO(78, 78, 78, 1),
                                      fontSize: 12.0,
                                    )),
                                    const SizedBox(height: 20),
                                    GestureDetector(
                                      onTap: (){
                                        Navigator.of(context).push(MaterialPageRoute(builder: (context) => const ForgotPassword()));
                                      },
                                      child: Text('Forgot Password', style: GoogleFonts.roboto(
                                        fontWeight: FontWeight.w600,
                                        color: const Color.fromRGBO(240, 11, 52, 1),
                                        fontSize: 13.0,
                                      )),
                                    )
                                  ]
                              ),
                              const Spacer(),
                              Align(
                                alignment: Alignment.center,
                                child: GestureDetector(child: Text('Create new account', style: GoogleFonts.roboto(
                                  fontWeight: FontWeight.w600,
                                  color: const Color.fromRGBO(78, 78, 78, 1),
                                  fontSize: 12.0,
                                ))),
                              )
                            ]
                        )
                    ),
                  )

                ]
            ),
          )
        ],
      )
    );
  }
}