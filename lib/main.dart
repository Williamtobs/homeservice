import 'package:flutter/material.dart';

import 'UI/Startup/splash_screen.dart';



void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Home Service App',
      debugShowCheckedModeBanner: false,
      home: const SplashScreen(),
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.white,
        colorScheme: const  ColorScheme.light(
          secondary: Color.fromRGBO(31, 68, 141, 1),
          primary: Color.fromRGBO(31, 68, 141, 1),
        ),
      ),
    );
  }
}
