import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:homeservice/UI/Shared/app_bar.dart';
import 'package:homeservice/UI/Shared/images.dart';

class TicketScreen extends StatefulWidget {
  final String eventName;
  final String description;
  const TicketScreen(
      {Key? key, required this.eventName, required this.description})
      : super(key: key);

  @override
  State<TicketScreen> createState() => _TicketScreenState();
}

class _TicketScreenState extends State<TicketScreen> {
  int amount = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(250, 250, 250, 1),
      appBar: PreferredSize(
          preferredSize: Size.fromHeight(AppBar().preferredSize.height),
          child: const Appbar(
            notification: 'Tickets',
          )),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 10,
                ),
                Container(
                  //height: 697,
                  padding: const EdgeInsets.all(10),
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      color: const Color.fromRGBO(255, 255, 255, 1)),
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(15),
                          child: Image.asset(
                            stage,
                            height: 198,
                            width: MediaQuery.of(context).size.width,
                          ),
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        Text('Events',
                            style: GoogleFonts.montserrat(
                                fontWeight: FontWeight.w500,
                                color: const Color.fromRGBO(119, 119, 119, 1),
                                fontSize: 12.0)),
                        const SizedBox(
                          height: 10,
                        ),
                        Text(widget.eventName,
                            style: GoogleFonts.montserrat(
                                fontWeight: FontWeight.w600,
                                color: const Color.fromRGBO(0, 0, 0, 1),
                                fontSize: 24.0)),
                        const SizedBox(
                          height: 10,
                        ),
                        Text(widget.description,
                            style: GoogleFonts.montserrat(
                                fontWeight: FontWeight.w600,
                                color: const Color.fromRGBO(0, 0, 0, 1),
                                fontSize: 14.0)),
                        const SizedBox(
                          height: 10,
                        ),
                        Text('Ticket Type:',
                            style: GoogleFonts.montserrat(
                                fontWeight: FontWeight.w500,
                                color: const Color.fromRGBO(119, 119, 119, 1),
                                fontSize: 12.0)),
                        const SizedBox(
                          height: 10,
                        ),
                        Row(
                          children: [
                            Container(
                              width: 273,
                              height: 39,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(15)),
                              child: TextField(
                                decoration: InputDecoration(
                                    hintText: 'Choose your ticket type...',
                                    hintStyle: GoogleFonts.montserrat(
                                        fontWeight: FontWeight.w500,
                                        color: const Color.fromRGBO(
                                            119, 119, 119, 1),
                                        fontSize: 12.0),
                                    filled: true,
                                    fillColor:
                                        const Color.fromRGBO(233, 233, 233, 1),
                                    border: InputBorder.none,
                                    focusedBorder: InputBorder.none),
                              ),
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            Container(
                              height: 39,
                              width: 46,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(15),
                                  color: const Color.fromRGBO(31, 68, 141, 1)),
                              child: const Icon(
                                Icons.arrow_drop_down_outlined,
                                size: 17,
                                color: Color.fromRGBO(255, 255, 255, 1),
                              ),
                            )
                          ],
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Text('How many?',
                            style: GoogleFonts.montserrat(
                                fontWeight: FontWeight.w500,
                                color: const Color.fromRGBO(119, 119, 119, 1),
                                fontSize: 12.0)),
                        const SizedBox(
                          height: 10,
                        ),
                        SizedBox(
                          width: 100,
                          child: Row(
                            children: [
                              GestureDetector(
                                onTap: () {
                                  if (amount <= 0) {
                                    return;
                                  }
                                  setState(() {
                                    amount--;
                                  });
                                },
                                child: Container(
                                  height: 20,
                                  width: 20,
                                  color: const Color.fromRGBO(234, 234, 234, 1),
                                  child: const Icon(Icons.remove_outlined,
                                      size: 15,
                                      color: Color.fromRGBO(0, 0, 0, 1)),
                                ),
                              ),
                              const SizedBox(
                                width: 5,
                              ),
                              Text(amount.toString(),
                                  style: GoogleFonts.montserrat(
                                      fontWeight: FontWeight.w700,
                                      color: const Color.fromRGBO(0, 0, 0, 1),
                                      fontSize: 21.0)),
                              const SizedBox(
                                width: 5,
                              ),
                              GestureDetector(
                                onTap: () {
                                  setState(() {
                                    amount++;
                                  });
                                },
                                child: Container(
                                  height: 20,
                                  width: 20,
                                  color: const Color.fromRGBO(234, 234, 234, 1),
                                  child: const Icon(Icons.add_outlined,
                                      size: 15,
                                      color: Color.fromRGBO(0, 0, 0, 1)),
                                ),
                              )
                            ],
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Row(
                          children: [
                            Text('15,000',
                                style: GoogleFonts.montserrat(
                                    fontWeight: FontWeight.w600,
                                    color: const Color.fromRGBO(31, 68, 141, 1),
                                    fontSize: 21.0)),
                            const Spacer(),
                            Container(
                              width: 165,
                              height: 54,
                              decoration: BoxDecoration(
                                  color: const Color.fromRGBO(255, 255, 255, 1),
                                  borderRadius: BorderRadius.circular(15),
                                  border: Border.all(
                                      color:
                                          const Color.fromRGBO(31, 68, 141, 1),
                                      width: 3)),
                              child: TextButton(
                                  onPressed: () {},
                                  child: Text('Pay',
                                      style: GoogleFonts.montserrat(
                                          fontWeight: FontWeight.w600,
                                          color: const Color.fromRGBO(
                                              31, 68, 141, 1),
                                          fontSize: 20.0))),
                            )
                          ],
                        )
                      ]),
                )
              ]),
        ),
      ),
    );
  }
}
