import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'UI/Startup/splash_screen.dart';



Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(
      const ProviderScope(
          child: MyApp()));
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
