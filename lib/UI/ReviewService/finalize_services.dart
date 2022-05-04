import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../Shared/app_bar.dart';
import 'change_address.dart';

class FinalizeServices extends StatelessWidget {
  final String serviceType;
  final String address;
  final String number;
  final String date;
  final String amount;
  final String services;
  const FinalizeServices(
      {Key? key,
      required this.address,
      required this.number,
      required this.date,
      required this.amount,
      required this.serviceType,
      required this.services})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(250, 250, 250, 1),
      appBar: PreferredSize(
          preferredSize: Size.fromHeight(AppBar().preferredSize.height + 5),
          child: const Appbar(
            notification: 'Service Checkout',
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
                        Text('Service Type',
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
                        Text('Service Details',
                            style: GoogleFonts.montserrat(
                                fontWeight: FontWeight.w500,
                                color: const Color.fromRGBO(31, 68, 141, 1),
                                fontSize: 17.0)),
                        const SizedBox(
                          height: 10,
                        ),
                        Row(
                          children: [
                            Text('Address',
                                style: GoogleFonts.montserrat(
                                    fontWeight: FontWeight.w400,
                                    color: const Color.fromRGBO(0, 0, 0, 1),
                                    fontSize: 12.0)),
                            const Spacer(),
                            Text(address,
                                style: GoogleFonts.montserrat(
                                    fontWeight: FontWeight.w400,
                                    color: const Color.fromRGBO(0, 0, 0, 1),
                                    fontSize: 12.0)),
                            const SizedBox(
                              width: 2,
                            ),
                            IconButton(
                                onPressed: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => ChangeAddress(
                                              address: address,
                                            )),
                                  );
                                  //ChangeAddress
                                },
                                icon: Icon(Icons.arrow_forward_ios))
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
                            Text('Phone Number',
                                style: GoogleFonts.montserrat(
                                    fontWeight: FontWeight.w400,
                                    color: const Color.fromRGBO(0, 0, 0, 1),
                                    fontSize: 12.0)),
                            const Spacer(),
                            Text(number,
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
                            Text('Pick-up Date & Time',
                                style: GoogleFonts.montserrat(
                                    fontWeight: FontWeight.w400,
                                    color: const Color.fromRGBO(0, 0, 0, 1),
                                    fontSize: 12.0)),
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
                              Text('Amount',
                                  style: GoogleFonts.montserrat(
                                      fontWeight: FontWeight.w400,
                                      color: const Color.fromRGBO(0, 0, 0, 1),
                                      fontSize: 12.0)),
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
                              Text('Services',
                                  style: GoogleFonts.montserrat(
                                      fontWeight: FontWeight.w400,
                                      color: const Color.fromRGBO(0, 0, 0, 1),
                                      fontSize: 12.0)),
                              const Spacer(),
                              Text(services,
                                  textAlign: TextAlign.end,
                                  style: GoogleFonts.montserrat(
                                      fontWeight: FontWeight.w400,
                                      color: const Color.fromRGBO(0, 0, 0, 1),
                                      fontSize: 12.0)),
                            ],
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
