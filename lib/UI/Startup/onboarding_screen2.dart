import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:homeservice/UI/Login/login_view.dart';
import 'package:homeservice/UI/Shared/images.dart';
import 'package:homeservice/UI/Signup/signup_view.dart';

class OnboardingScreen2 extends StatelessWidget{
  const OnboardingScreen2({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Stack(
          alignment: Alignment.topCenter,
            children:[
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
                      onboarding2,
                    ),
                  ),),
                  height: MediaQuery.of(context).size.height * 0.80,
                width: MediaQuery.of(context).size.width,
            ),
              ),
              Positioned(
                  bottom: 0,
                  child: Container(
                    padding: const EdgeInsets.all(15),
                    height: MediaQuery.of(context).size.height * 0.40,
                    width: MediaQuery.of(context).size.width,
                    decoration: const BoxDecoration(
                        color: Color.fromRGBO(255, 255, 255, 1),
                        borderRadius: BorderRadius.only(topLeft: Radius.circular(30), topRight: Radius.circular(30))
                    ),
                    child: SingleChildScrollView(
                      physics: const AlwaysScrollableScrollPhysics(),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset(name,
                            width: 246,
                            height: 40,
                          ),
                          const SizedBox(height: 10,),
                          SizedBox(
                            width: 232,
                            child: Text('Let???s take care of all '
                              'your needs.',
                              textAlign: TextAlign.center,
                              style: GoogleFonts.montserrat(
                                  fontWeight: FontWeight.w500,
                                  color: const Color.fromRGBO(0, 0, 0, 1),
                                  fontSize: 22.0
                              ),),
                          ),
                          const SizedBox(height: 10,),
                          Container(
                            width: 334,
                            height: 50,
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(35.0),
                              color: const Color.fromRGBO(31, 68, 141, 1)
                            ),
                            child: ElevatedButton(onPressed:(){Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) => const SignUp()));},
                              style: ElevatedButton.styleFrom(
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(35.0),
                                ),
                                minimumSize: const Size.fromHeight(50),
                                elevation: 0,
                              primary: const Color.fromRGBO(31, 68, 141, 1)
                            ),
                              child:
                                Text('Sign Up', style: GoogleFonts.montserrat(
                                  fontWeight: FontWeight.w600,
                                  color: const Color.fromRGBO(255, 255, 255, 1),
                                  fontSize: 21.0,
                                )),
                                ),
                          ),
                          const SizedBox(height: 10,),
                          Container(
                            width: 334,
                            height: 50,
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(35.0),
                                color: const Color.fromRGBO(255, 255, 255, 1),
                                border: Border.all(color: const Color.fromRGBO(31, 68, 141, 1))
                            ),
                            child: ElevatedButton(onPressed:(){Navigator.of(context).push(MaterialPageRoute(builder: (context) => const Login()));},
                              style: ElevatedButton.styleFrom(
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(35.0),
                                ),
                                  minimumSize: const Size.fromHeight(50),
                                  elevation: 0,
                                  primary: const Color.fromRGBO(255, 255, 255, 1)
                              ),
                              child:
                            Text('Log in', style: GoogleFonts.montserrat(
                              fontWeight: FontWeight.w600,
                              color: const Color.fromRGBO(31, 68, 141, 1),
                              fontSize: 21.0,
                            )),
                            ),
                          )
                        ],
                      ),
                    ),
                  ))
            ]
        ),
      )
    );
  }

}