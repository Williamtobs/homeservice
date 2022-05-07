import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../Shared/app_bar.dart';

class TrainBookedSummary extends StatelessWidget {
  final String serviceType;
  final String station;
  final String type;
  final String date;
  final String amount;
  final String services;
  const TrainBookedSummary(
      {Key? key,
      required this.date,
      required this.amount,
      required this.serviceType,
      required this.services,
      required this.station,
      required this.type})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(250, 250, 250, 1),
      appBar: PreferredSize(
          preferredSize: Size.fromHeight(AppBar().preferredSize.height + 5),
          child: const Appbar(
            notification: 'Ticket Checkout',
          )),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Stack(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  color: Colors.white,
                  child: Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Train Ticket Type',
                            style: GoogleFonts.montserrat(
                                fontWeight: FontWeight.w500,
                                color: const Color.fromRGBO(31, 68, 141, 1),
                                fontSize: 17.0)),
                        const SizedBox(
                          height: 10,
                        ),
                        Container(
                          padding: const EdgeInsets.all(10),
                          decoration: BoxDecoration(
                              color: const Color.fromRGBO(31, 68, 141, 1),
                              borderRadius: BorderRadius.circular(20)),
                          child: Text(serviceType,
                              style: GoogleFonts.montserrat(
                                  fontWeight: FontWeight.w500,
                                  color: Colors.white,
                                  fontSize: 14.0)),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Text('Ticket Details',
                            style: GoogleFonts.montserrat(
                                fontWeight: FontWeight.w500,
                                color: const Color.fromRGBO(31, 68, 141, 1),
                                fontSize: 17.0)),
                        const SizedBox(
                          height: 10,
                        ),
                        Row(
                          children: [
                            Text('Station',
                                style: GoogleFonts.montserrat(
                                    fontWeight: FontWeight.w500,
                                    color: const Color.fromRGBO(0, 0, 0, 1),
                                    fontSize: 14.0)),
                            const Spacer(),
                            Text(station,
                                style: GoogleFonts.montserrat(
                                    fontWeight: FontWeight.w400,
                                    color: const Color.fromRGBO(0, 0, 0, 1),
                                    fontSize: 12.0)),
                            // const SizedBox(
                            //   width: 2,
                            // ),
                          ],
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        const Divider(),
                        const SizedBox(
                          height: 5,
                        ),
                        Row(
                          children: [
                            Text('Type',
                                style: GoogleFonts.montserrat(
                                    fontWeight: FontWeight.w500,
                                    color: const Color.fromRGBO(0, 0, 0, 1),
                                    fontSize: 14.0)),
                            const Spacer(),
                            Text(type,
                                style: GoogleFonts.montserrat(
                                    fontWeight: FontWeight.w400,
                                    color: const Color.fromRGBO(0, 0, 0, 1),
                                    fontSize: 12.0)),
                          ],
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        const Divider(),
                        const SizedBox(
                          height: 5,
                        ),
                        Row(
                          children: [
                            Text(
                                serviceType == 'Laundry'
                                    ? 'Pick-up Date & Time'
                                    : 'Date & Time',
                                style: GoogleFonts.montserrat(
                                    fontWeight: FontWeight.w500,
                                    color: const Color.fromRGBO(0, 0, 0, 1),
                                    fontSize: 14.0)),
                            const Spacer(),
                            Text(date,
                                style: GoogleFonts.montserrat(
                                    fontWeight: FontWeight.w400,
                                    color: const Color.fromRGBO(0, 0, 0, 1),
                                    fontSize: 12.0)),
                          ],
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        const Divider(),
                        const SizedBox(
                          height: 5,
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),
                Container(
                  color: Colors.white,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Summary',
                              style: GoogleFonts.montserrat(
                                  fontWeight: FontWeight.w500,
                                  color: const Color.fromRGBO(31, 68, 141, 1),
                                  fontSize: 17.0)),
                          const SizedBox(
                            height: 10,
                          ),
                          Row(
                            children: [
                              Text('Services',
                                  style: GoogleFonts.montserrat(
                                      fontWeight: FontWeight.w500,
                                      color: const Color.fromRGBO(0, 0, 0, 1),
                                      fontSize: 14.0)),
                              const Spacer(),
                              Text(services,
                                  textAlign: TextAlign.end,
                                  style: GoogleFonts.montserrat(
                                      fontWeight: FontWeight.w400,
                                      color: const Color.fromRGBO(0, 0, 0, 1),
                                      fontSize: 12.0)),
                            ],
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          const Divider(),
                          const SizedBox(
                            height: 5,
                          ),
                          Row(
                            children: [
                              Text('Amount',
                                  style: GoogleFonts.montserrat(
                                      fontWeight: FontWeight.w500,
                                      color: const Color.fromRGBO(0, 0, 0, 1),
                                      fontSize: 14.0)),
                              const Spacer(),
                              Text(amount,
                                  style: GoogleFonts.montserrat(
                                      fontWeight: FontWeight.w400,
                                      color: const Color.fromRGBO(0, 0, 0, 1),
                                      fontSize: 12.0)),
                            ],
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          const Divider(),
                          const SizedBox(
                            height: 5,
                          ),
                          Row(
                            children: [
                              Text('Service Charge',
                                  style: GoogleFonts.montserrat(
                                      fontWeight: FontWeight.w500,
                                      color: const Color.fromRGBO(0, 0, 0, 1),
                                      fontSize: 14.0)),
                              const Spacer(),
                              Text('500',
                                  style: GoogleFonts.montserrat(
                                      fontWeight: FontWeight.w400,
                                      color: const Color.fromRGBO(0, 0, 0, 1),
                                      fontSize: 12.0)),
                            ],
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          const Divider(),
                          const SizedBox(
                            height: 5,
                          ),
                        ]),
                  ),
                )
              ],
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Container(
                  decoration: BoxDecoration(
                    color: const Color.fromRGBO(31, 68, 141, 1),
                    borderRadius: BorderRadius.circular(25),
                  ),
                  width: MediaQuery.of(context).size.width,
                  child: TextButton(
                    onPressed: () {},
                    child: Text('Continue',
                        style: GoogleFonts.montserrat(
                            fontWeight: FontWeight.w400,
                            color: Colors.white,
                            fontSize: 16.0)),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
