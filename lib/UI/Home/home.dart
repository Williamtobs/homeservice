import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:homeservice/UI/Notification/notification_screen.dart';
import 'package:homeservice/UI/Shared/Sidebar/side_bar.dart';

import 'gridview.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        extendBodyBehindAppBar: true,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          actions: [
            IconButton(
              icon: const Icon(Icons.notifications,
                  color: Color.fromRGBO(255, 255, 255, 1)),
              onPressed: () {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => const NotificationScreen()));
              },
            ),
          ],
        ),
        drawer: const SideBar(),
        body: Column(
          children: [
            Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
              color: const Color.fromRGBO(31, 68, 141, 1),
              child: Stack(
                children: [
                  Align(
                    alignment: Alignment.topCenter,
                    child: SizedBox(
                      width: MediaQuery.of(context).size.width,
                      height: MediaQuery.of(context).size.height * 0.35,
                      child: Stack(children: [
                        Positioned(
                          top: -20,
                          left: -25,
                          child: Container(
                            width: 150,
                            height: 150,
                            decoration: const BoxDecoration(
                              color: Color.fromRGBO(255, 255, 255, 0.15),
                              shape: BoxShape.circle,
                            ),
                          ),
                        ),
                        Positioned(
                          bottom: -20,
                          right: -25,
                          child: Container(
                            width: 150,
                            height: 150,
                            decoration: const BoxDecoration(
                              color: Color.fromRGBO(255, 255, 255, 0.15),
                              shape: BoxShape.circle,
                            ),
                          ),
                        ),
                        Positioned(
                          bottom: 50,
                          left: 0,
                          child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(
                                    left: 20.0,
                                    right: 20.0,
                                  ),
                                  child: Text('Hi, John',
                                      style: GoogleFonts.montserrat(
                                          fontWeight: FontWeight.w700,
                                          color: const Color.fromRGBO(
                                              255, 255, 255, 1),
                                          fontSize: 28.0)),
                                ),
                                const SizedBox(height: 5),
                                Padding(
                                  padding: const EdgeInsets.only(
                                      left: 20.0, right: 20.0),
                                  child: Text('Do you need some help today?',
                                      style: GoogleFonts.montserrat(
                                          fontWeight: FontWeight.w600,
                                          color: const Color.fromRGBO(
                                              255, 255, 255, 1),
                                          fontSize: 16.0)),
                                ),
                              ]),
                        )
                      ]),
                    ),
                  ),
                  Positioned(
                    bottom: 0,
                    child: Container(
                        height: MediaQuery.of(context).size.height * 0.68,
                        width: MediaQuery.of(context).size.width,
                        decoration: const BoxDecoration(
                            color: Color.fromRGBO(255, 255, 255, 1),
                            borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(35),
                                topRight: Radius.circular(35))),
                        child: Padding(
                          padding: const EdgeInsets.only(
                              left: 10.0, right: 10.0, bottom: 10.0, top: 40.0),
                          child: SingleChildScrollView(
                            physics: const BouncingScrollPhysics(),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Container(
                                  height: 100,
                                  decoration: const BoxDecoration(
                                      color: Color.fromRGBO(31, 68, 141, 1),
                                      borderRadius: BorderRadius.only(
                                        topLeft: Radius.circular(15),
                                        topRight: Radius.circular(15),
                                        bottomLeft: Radius.circular(15),
                                        bottomRight: Radius.circular(15),
                                      )),
                                  padding: const EdgeInsets.only(
                                      left: 40, right: 40, top: 20, bottom: 20),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text('Account Balance',
                                          style: GoogleFonts.montserrat(
                                              fontWeight: FontWeight.w600,
                                              fontStyle: FontStyle.normal,
                                              color: const Color.fromRGBO(
                                                  255, 255, 255, 1),
                                              fontSize: 13.0)),
                                      const SizedBox(
                                        height: 15,
                                      ),
                                      Row(
                                        children: [
                                          Text('N2000.00',
                                              style: GoogleFonts.montserrat(
                                                  fontWeight: FontWeight.w600,
                                                  fontStyle: FontStyle.normal,
                                                  color: const Color.fromRGBO(
                                                      255, 255, 255, 1),
                                                  fontSize: 21.0)),
                                          const SizedBox(
                                            width: 10,
                                          ),
                                          const Icon(
                                            Icons.visibility_outlined,
                                            size: 20,
                                            color: Color.fromRGBO(
                                                255, 255, 255, 1),
                                          ),
                                          const Spacer(),
                                          Container(
                                            width: 106,
                                            height: 26,
                                            padding: const EdgeInsets.all(5),
                                            decoration: BoxDecoration(
                                              color: const Color.fromRGBO(
                                                  255, 255, 255, 1),
                                              borderRadius:
                                                  BorderRadius.circular(25),
                                            ),
                                            child: Row(
                                              children: [
                                                const Icon(
                                                  Icons.add_circle_outlined,
                                                  size: 18,
                                                  color: Color.fromRGBO(
                                                      31, 68, 141, 1),
                                                ),
                                                const SizedBox(width: 15),
                                                Text('Add Money',
                                                    style:
                                                        GoogleFonts.montserrat(
                                                            fontWeight:
                                                                FontWeight.w600,
                                                            fontStyle: FontStyle
                                                                .normal,
                                                            color: const Color
                                                                    .fromRGBO(
                                                                31, 68, 141, 1),
                                                            fontSize: 10.0)),
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                                const SizedBox(
                                  height: 20,
                                ),
                                Container(
                                  height: 120,
                                  width: MediaQuery.of(context).size.width,
                                  decoration: const BoxDecoration(
                                      color: Color.fromRGBO(202, 220, 255, 1),
                                      borderRadius: BorderRadius.only(
                                        topLeft: Radius.circular(15),
                                        topRight: Radius.circular(15),
                                        bottomLeft: Radius.circular(15),
                                        bottomRight: Radius.circular(15),
                                      )),
                                  padding: const EdgeInsets.only(
                                      left: 40, right: 40, top: 40, bottom: 20),
                                  child: SizedBox(
                                    width: 50,
                                    child: Text(
                                        'Enjoy 20% discount'
                                        ' on your first service',
                                        style: GoogleFonts.montserrat(
                                            fontWeight: FontWeight.w600,
                                            color: const Color.fromRGBO(
                                                0, 0, 0, 1),
                                            fontSize: 19.0)),
                                  ),
                                ),
                                const SizedBox(height: 20),
                                Align(
                                  alignment: Alignment.topLeft,
                                  child: Text('Services',
                                      style: GoogleFonts.montserrat(
                                          fontWeight: FontWeight.w600,
                                          color:
                                              const Color.fromRGBO(0, 0, 0, 1),
                                          fontSize: 19.0)),
                                ),
                                const SizedBox(height: 20),
                                const Gridview(),
                                const SizedBox(height: 40),
                              ],
                            ),
                          ),
                        )),
                  )
                ],
              ),
            ),
          ],
        ));
  }
}
