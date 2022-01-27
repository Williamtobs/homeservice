import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:homeservice/UI/Shared/images.dart';

import 'onboarding_screen.dart';

class SplashScreen extends StatefulWidget{
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  @override
  void initState() {
    super.initState();
    Timer(const Duration(seconds: 5),
            ()=>Navigator.pushReplacement(context,
            MaterialPageRoute(builder:
                (context) => const OnboardingScreen()
            )
        )
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(255, 255, 255, 1),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
            logo,
            height: 246.0,
            width: 246.0,
          ),
          const SizedBox(height: 5),
          Image.asset(
            name1,
            height: 45,
          width: 276,)
      ],
    ),
        ));
  }
}