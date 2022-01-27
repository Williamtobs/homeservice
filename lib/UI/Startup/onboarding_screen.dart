import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:homeservice/UI/Shared/images.dart';
import 'package:homeservice/UI/Startup/onboarding_screen2.dart';

class OnboardingScreen extends StatelessWidget{
  const OnboardingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold ( body: SizedBox(
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      child: Stack(
          alignment: Alignment.topCenter,
          children:[ Container(
            decoration: BoxDecoration(
              image: DecorationImage(
              fit: BoxFit.cover,
              colorFilter:
              ColorFilter.mode(Colors.blue.withOpacity(0.7),
                  BlendMode.dstATop),
              image: const AssetImage(
                onboarding1,
              ),
            ),),
            width: MediaQuery.of(context).size.width,
          ),
          Positioned(
              bottom: 0,
              child: Container(
                padding: const EdgeInsets.all(15),
                width: MediaQuery.of(context).size.width,
                decoration: const BoxDecoration(
                  color: Color.fromRGBO(255, 255, 255, 1),
                  borderRadius: BorderRadius.only(topLeft: Radius.circular(30), topRight: Radius.circular(30))
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(name,
                    width: 246,
                      height: 40,
                    ),
                    const SizedBox(height: 20,),
                    Text('Say Goodbye to chores.', style: GoogleFonts.montserrat(
                      fontWeight: FontWeight.w700,
                      color: const Color.fromRGBO(0, 0, 0, 1),
                      fontSize: 25.0,
                    ),
                    ),
                    const SizedBox(height: 15,),
                    SizedBox(
                      width: 232,
                      child: Text('Spend more time '
                        'doing what you love.',
                        textAlign: TextAlign.center,
                        style: GoogleFonts.montserrat(
                        fontWeight: FontWeight.w500,
                        color: const Color.fromRGBO(78, 78, 78, 1),
                        fontSize: 22.0
                      ),),
                    ),
                    const SizedBox(height: 20,),
                    Container(
                      width: 334,
                      height: 61,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(35.0),
                          color: const Color.fromRGBO(31, 68, 141, 1)
                      ),
                      child: ElevatedButton(onPressed:(){
                        Navigator.of(context).push(MaterialPageRoute(builder: (context) => const OnboardingScreen2()));
                      },
                          style: ElevatedButton.styleFrom(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(35.0),
                              ),
                              minimumSize: const Size.fromHeight(61),
                            elevation: 0,
                              primary: const Color.fromRGBO(31, 68, 141, 1)
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text('Get Started', style: GoogleFonts.montserrat(
                                fontWeight: FontWeight.w700,
                                color: const Color.fromRGBO(255, 255, 255, 1),
                                fontSize: 24.0,
                              )),
                              Image.asset(roc),
                            ],
                          )),
                    )
                  ],
                ),
              ))
          ]
        ),
    ));
  }

}