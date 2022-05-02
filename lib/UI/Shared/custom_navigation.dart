// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../History/history_screen.dart';
import '../Home/home.dart';
import 'images.dart';

class CustomNavigation extends StatefulWidget {
  CustomNavigation({Key? key}) : super(key: key);

  @override
  State<CustomNavigation> createState() => _CustomNavigationState();
}

class _CustomNavigationState extends State<CustomNavigation> {
  int _index = 1;

  PageController? controller;

  @override
  void initState() {
    super.initState();
    controller = PageController(initialPage: 1);
  }

  @override
  void dispose() {
    controller?.dispose();
    super.dispose();
  }

  void pageChange(int index) {
    setState(() {
      _index = index;
    });
  }

  nextFunction() {
    controller?.nextPage(
        duration: const Duration(milliseconds: 300), curve: Curves.ease);
  }

  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      PageView(
        controller: controller,
        children: [
          HistoryScreen(),
          HomeScreen(),
          Center(
            child: Text('Testing Screen, 2'),
          ),
        ],
        scrollDirection: Axis.horizontal,
        physics: const NeverScrollableScrollPhysics(),
      ),
      Positioned(
        bottom: 0,
        child: Container(
          padding:
              const EdgeInsets.only(top: 10, bottom: 10, left: 20, right: 20),
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                  color: Colors.grey.withOpacity(0.5),
                  spreadRadius: 5,
                  blurRadius: 7,
                  offset: const Offset(0, 3))
            ],
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              GestureDetector(
                onTap: () {
                  controller?.animateToPage(0,
                      duration: const Duration(milliseconds: 300),
                      curve: Curves.ease);
                },
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Icon(
                      Icons.history_outlined,
                      color: Color.fromRGBO(132, 132, 132, 1),
                      size: 30,
                    ),
                    const SizedBox(height: 5),
                    Text('History',
                        style: GoogleFonts.montserrat(
                            fontWeight: FontWeight.w600,
                            color: const Color.fromRGBO(132, 132, 132, 1),
                            fontSize: 14.0)),
                    const SizedBox(height: 3),
                  ],
                ),
              ),
              Container(
                padding: const EdgeInsets.only(bottom: 5),
                width: 50,
                alignment: Alignment.bottomCenter,
                child: Text('',
                    style: GoogleFonts.montserrat(
                        fontWeight: FontWeight.w600,
                        color: const Color.fromRGBO(132, 132, 132, 1),
                        fontSize: 10.0)),
              ),
              GestureDetector(
                onTap: () {
                  controller?.animateToPage(2,
                      duration: const Duration(milliseconds: 300),
                      curve: Curves.ease);
                },
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Icon(
                      Icons.chat_bubble_outlined,
                      color: Color.fromRGBO(132, 132, 132, 1),
                      size: 30,
                    ),
                    const SizedBox(height: 5),
                    Text('Chat',
                        style: GoogleFonts.montserrat(
                            fontWeight: FontWeight.w600,
                            color: const Color.fromRGBO(132, 132, 132, 1),
                            fontSize: 14.0)),
                    const SizedBox(height: 3),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
      Align(
        alignment: Alignment.bottomCenter,
        child: GestureDetector(
          onTap: () {
            controller?.animateToPage(1,
                duration: const Duration(milliseconds: 300),
                curve: Curves.ease);
          },
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Container(
                width: 80,
                padding: const EdgeInsets.all(4),
                decoration: const BoxDecoration(
                    color: Colors.white, shape: BoxShape.circle),
                child: Image.asset(homeicon, height: 75, width: 75),
              ),
              Container(
                padding: const EdgeInsets.only(bottom: 4),
                alignment: Alignment.bottomCenter,
                child: Text('Home',
                    style: GoogleFonts.montserrat(
                        fontWeight: FontWeight.w600,
                        color: const Color.fromRGBO(132, 132, 132, 1),
                        fontSize: 14.0)),
              ),
            ],
          ),
        ),
      ),
    ]);
  }
}
