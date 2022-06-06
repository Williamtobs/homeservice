import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:share/share.dart';

import '../../app_bar.dart';
import '../../images.dart';

class ReferAndEarn extends StatelessWidget {
  const ReferAndEarn({Key? key}) : super(key: key);

  final String referralLink = 'homeservice.com/user/123454';
  //TextEditingController _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      //const Color.fromRGBO(243, 243, 243, 1),
      appBar: PreferredSize(
          preferredSize: Size.fromHeight(AppBar().preferredSize.height),
          child: const Appbar(
            notification: 'Refer and Earn',
          )),
      body: Padding(
        padding: const EdgeInsets.all(15),
        child: SingleChildScrollView(
          physics: const AlwaysScrollableScrollPhysics(),
          child: Column(
            children: [
              const SizedBox(
                height: 10,
              ),
              Image.asset(
                gift,
                height: 200,
              ),
              const SizedBox(
                height: 15,
              ),
              Text(
                'Get 1,000 Discount',
                style: GoogleFonts.montserrat(
                    fontWeight: FontWeight.w600,
                    color: const Color.fromRGBO(31, 68, 141, 1),
                    fontSize: 16.0),
              ),
              const SizedBox(
                height: 10,
              ),
              Text('On your next booked service',
                  style: GoogleFonts.montserrat(
                      fontWeight: FontWeight.w600,
                      color: Colors.black,
                      fontSize: 16.0)),
              const SizedBox(
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Text(
                  'You will receive 1,000 discount when you recommend a friend to us and they book a service for the first time.',
                  textAlign: TextAlign.center,
                  style: GoogleFonts.montserrat(
                      fontWeight: FontWeight.w600,
                      color: Colors.black,
                      fontSize: 14.0),
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    width: 250,
                    height: 50,
                    decoration:
                        BoxDecoration(borderRadius: BorderRadius.circular(15)),
                    child: TextField(
                      controller: TextEditingController()..text = referralLink,
                      decoration: InputDecoration(
                        isDense: true,
                        enabled: false,
                        //hintText: 'homeservice.com/user/123454',
                        hintStyle: GoogleFonts.montserrat(
                            fontWeight: FontWeight.w500,
                            color: const Color.fromRGBO(119, 119, 119, 1),
                            fontSize: 12.0),
                        filled: true,
                        fillColor: const Color.fromRGBO(233, 233, 233, 1),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15)),
                        //focusedBorder: InputBorder.none
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  GestureDetector(
                    onTap: () {
                      Share.share(referralLink);
                    },
                    child: Container(
                      height: 45,
                      width: 46,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          color: const Color.fromRGBO(31, 68, 141, 1)),
                      child: const Icon(
                        Icons.ios_share,
                        size: 24,
                        color: Color.fromRGBO(255, 255, 255, 1),
                      ),
                    ),
                  )
                ],
              ),
              const SizedBox(height: 30),
              Text(
                'Rewards',
                style: GoogleFonts.montserrat(
                    fontWeight: FontWeight.w600,
                    color: const Color.fromRGBO(31, 68, 141, 1),
                    fontSize: 16.0),
              ),
              const SizedBox(height: 15),
              SizedBox(
                height: 80,
                width: MediaQuery.of(context).size.width * 0.50,
                child: Card(
                    elevation: 1,
                    shape: RoundedRectangleBorder(
                        side: const BorderSide(
                            width: 3, color: Color.fromRGBO(243, 243, 243, 1)),
                        borderRadius: BorderRadius.circular(15)),
                    child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'Earned',
                            style: GoogleFonts.montserrat(
                                fontWeight: FontWeight.w600,
                                color: const Color.fromRGBO(31, 68, 141, 1),
                                fontSize: 16.0),
                          ),
                          const SizedBox(height: 5),
                          Text(
                            'N 5,000',
                            style: GoogleFonts.montserrat(
                                fontWeight: FontWeight.w500,
                                color: Colors.black,
                                fontSize: 14.0),
                          )
                        ],
                      ),
                    )),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
