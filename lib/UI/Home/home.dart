import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'gridview.dart';

class HomeScreen extends StatelessWidget{
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.subject_outlined,
          color: Color.fromRGBO(255, 255, 255, 1)), onPressed: () {  },
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.notifications,
            color: Color.fromRGBO(255, 255, 255, 1)), onPressed: (){},
          ),
        ],
      ),
      body: Column(
        children: [
          Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            color: const Color.fromRGBO(31, 68, 141, 1),
            child: Stack(
              children: [
                Align(
                  alignment:Alignment.topCenter,
                  child: SizedBox(
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height * 0.35,
                    child: Stack(
                      children:[ Positioned(
                        top: -18,
                        left: -20,
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
                        bottom: -15,
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
                                padding: const EdgeInsets.only(left: 20.0, right: 20.0,),
                                child: Text('Hi, John', style: GoogleFonts.montserrat(
                                    fontWeight: FontWeight.w700,
                                    color: const Color.fromRGBO(255, 255, 255, 1),
                                    fontSize: 28.0
                                )),
                              ),
                            const SizedBox(height: 5),
                            Padding(
                              padding: const EdgeInsets.only(left: 20.0, right: 20.0),
                              child: Text('Do you need some help today?', style: GoogleFonts.montserrat(
                                  fontWeight: FontWeight.w600,
                                  color: const Color.fromRGBO(255, 255, 255, 1),
                                  fontSize: 16.0
                              )),
                            ),]
                          ),
                        )
                      ]
                    ),
                  ),
                ),
                Positioned(
                  bottom: 0,
                  child: Container(
                      height: MediaQuery.of(context).size.height * 0.68,
                      width: MediaQuery.of(context).size.width,
                    decoration: const BoxDecoration(
                        color: Color.fromRGBO(255, 255, 255, 1),
                        borderRadius: BorderRadius.only(topLeft: Radius.circular(35),
                            topRight: Radius.circular(35))
                    ),
                    child: Padding(
                      padding: const EdgeInsets.only(left: 20.0, right: 20.0,
                          bottom: 10.0, top: 10),
                      child: ListView(
                        physics: const BouncingScrollPhysics(),
                        children: [
                          Container(
                            height: 120,
                            width: 100,
                            decoration: const BoxDecoration(
                                color: Color.fromRGBO(202, 220, 255, 1),
                                borderRadius: BorderRadius.only(topLeft: Radius.circular(15),
                                  topRight: Radius.circular(15), bottomLeft: Radius.circular(15),
                                  bottomRight: Radius.circular(15),)
                            ),
                            padding: const EdgeInsets.all(40),
                            child: SizedBox(
                              width: 50,
                              child: Text('Enjoy 20% discount'
                                  ' on your first service', style: GoogleFonts.montserrat(
                                  fontWeight: FontWeight.w600,
                                  color: const Color.fromRGBO(0, 0, 0, 1),
                                  fontSize: 19.0
                              )),
                            ),
                          ),
                          const SizedBox(height: 20),
                          Text('Services', style: GoogleFonts.montserrat(
                              fontWeight: FontWeight.w600,
                              color: const Color.fromRGBO(0, 0, 0, 1),
                              fontSize: 19.0
                          )),
                          const SizedBox(height: 10),
                          const Gridview()
                        ],
                      ),
                    )),
                )
              ],
            ),
          ),
        ],
      )
    );
  }

}