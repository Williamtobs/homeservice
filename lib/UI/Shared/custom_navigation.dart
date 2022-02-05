import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:homeservice/UI/Home/home.dart';

import 'images.dart';

class CustomNavigation extends StatefulWidget{
  CustomNavigation({Key? key}) : super(key: key);

  @override
  State<CustomNavigation> createState() => _CustomNavigationState();
}

class _CustomNavigationState extends State<CustomNavigation> {
  int _index = 0;

  PageController? controller;

  @override
  void initState() {
    super.initState();
    controller = PageController();
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
    return Stack(
      children: [
        PageView(
          controller: controller,
          children: const [
            HomeScreen(),
            Center(
              child: Text(
                  'Testing Screen, 1'
              ),
            ),
            Center(
              child: Text(
                'Testing Screen, 2'
              ),
            ),
            Center(
              child: Text(
                  'Testing Screen, 3'
              ),
            ),
            Center(
              child: Text(
                  'Testing Screen, 4'
              ),
            )
          ],
          scrollDirection: Axis.horizontal,
          physics: const NeverScrollableScrollPhysics(),
        ),
        Positioned(
          bottom: 0,
          child: Container(
            padding: const EdgeInsets.only(top: 10, bottom: 10, left: 20, right: 20),
            height: 60,
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.5),
                spreadRadius: 5,
                blurRadius: 7,
                offset: const Offset(0,3)
              )
            ],
          ),
          child: Row(
            mainAxisAlignment : MainAxisAlignment.spaceBetween,
            children: [
              GestureDetector(
                onTap: (){
                  controller?.animateToPage( 2,
                      duration: const Duration(milliseconds: 300), curve: Curves.ease);
                },
                child: Column(
                  mainAxisAlignment : MainAxisAlignment.center,
                  children: [
                    const Icon(
                      Icons.miscellaneous_services_outlined,
                      color: Color.fromRGBO(132, 132, 132, 1),
                      size: 28,
                  ),
                    const SizedBox(height: 5),
                    Text('My Services', style: GoogleFonts.montserrat(
                        fontWeight: FontWeight.w600,
                        color: const Color.fromRGBO(132, 132, 132, 1),
                        fontSize: 10.0
                    )),
                    const SizedBox(height: 3),
                  ],
                ),
              ),
              GestureDetector(
                onTap: (){
                  controller?.animateToPage(1,
                      duration: const Duration(milliseconds: 300), curve: Curves.ease);
                },
                child: Column(
                  mainAxisAlignment : MainAxisAlignment.center,
                  children: [
                    const Icon(
                      Icons.history_outlined,
                      color: Color.fromRGBO(132, 132, 132, 1),
                      size: 28,
                    ),
                    const SizedBox(height: 5),
                    Text('History', style: GoogleFonts.montserrat(
                        fontWeight: FontWeight.w600,
                        color: const Color.fromRGBO(132, 132, 132, 1),
                        fontSize: 10.0
                    )),
                    const SizedBox(height: 3),
                  ],
                ),
              ),
              Container(
                padding: const EdgeInsets.only(bottom: 5),
                width: 50, alignment: Alignment.bottomCenter,
                child: Text('', style: GoogleFonts.montserrat(
                  fontWeight: FontWeight.w600,
                  color: const Color.fromRGBO(132, 132, 132, 1),
                  fontSize: 10.0
                )),
              ),
              GestureDetector(
                onTap: (){
                  controller?.animateToPage(3,
                      duration: const Duration(milliseconds: 300), curve: Curves.ease);
                },
                child: Column(
                  mainAxisAlignment : MainAxisAlignment.center,
                  children: [
                    const Icon(
                      Icons.mark_email_read,
                      color: Color.fromRGBO(132, 132, 132, 1),
                      size: 28,
                    ),
                    const SizedBox(height: 5),
                    Text('Message', style: GoogleFonts.montserrat(
                        fontWeight: FontWeight.w600,
                        color: const Color.fromRGBO(132, 132, 132, 1),
                        fontSize: 10.0
                    )),
                    const SizedBox(height: 3),
                  ],
                ),
              ),
              GestureDetector(
                onTap: (){
                  controller?.animateToPage(4,
                      duration: const Duration(milliseconds: 300), curve: Curves.ease);
                },
                child: Column(
                  mainAxisAlignment : MainAxisAlignment.center,
                  children: [
                    const Icon(
                      Icons.chat_bubble_outlined,
                      color: Color.fromRGBO(132, 132, 132, 1),
                      size: 28,
                    ),
                    const SizedBox(height: 5),
                    Text('Chat', style: GoogleFonts.montserrat(
                        fontWeight: FontWeight.w600,
                        color: const Color.fromRGBO(132, 132, 132, 1),
                        fontSize: 10.0
                    )),
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
            onTap: (){
              controller?.animateToPage( 0,
                  duration: const Duration(milliseconds: 300), curve: Curves.ease);
            },
            child: Column(
              mainAxisAlignment : MainAxisAlignment.end,
              children: [
                Container(
                  width: 80,
                  padding: const EdgeInsets.all(4),
                  decoration: const BoxDecoration(
                      color: Colors.white,
                      shape: BoxShape.circle
                  ),
                  child: Image.asset(homeicon, height: 75, width: 75),
                ),
                Container(
                  padding: const EdgeInsets.only(bottom: 4),
                  alignment: Alignment.bottomCenter,
                  child: Text('Home', style: GoogleFonts.montserrat(
                      fontWeight: FontWeight.w600,
                      color: const Color.fromRGBO(132, 132, 132, 1),
                      fontSize: 10.0
                  )),
                ),
              ],
            ),
          ),
        ),
    ]
    );
  }
}