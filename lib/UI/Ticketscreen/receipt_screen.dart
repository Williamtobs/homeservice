import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../Database/orders_database.dart';
import '../../Model/orders.dart';
import '../../Providers/auth_providers.dart';
import '../Shared/app_bar.dart';

class TrainBookedSummary extends StatefulWidget {
  final String serviceType;
  final String station;
  final String type;
  final String date;
  final String amount;
  final String number;
  final String services;
  const TrainBookedSummary(
      {Key? key,
      required this.date,
      required this.amount,
      required this.serviceType,
      required this.services,
      required this.station,
      required this.type,
      required this.number})
      : super(key: key);

  @override
  State<TrainBookedSummary> createState() => _TrainBookedSummaryState();
}

class _TrainBookedSummaryState extends State<TrainBookedSummary> {
  bool loading = false;
  String? error;

  @override
  Widget build(BuildContext context) {
    String generateRandomString(int len) {
      var r = Random();
      const _chars =
          'AaBbCcDdEeFfGgHhIiJjKkLlMmNnOoPpQqRrSsTtUuVvWwXxYyZz1234567890';
      return List.generate(len, (index) => _chars[r.nextInt(_chars.length)])
          .join();
    }

    var v1_exact = generateRandomString(12);
    return Consumer(builder: (context, ref, _) {
      final data = ref.watch(fireBaseAuthProvider);
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
                            child: Text(widget.serviceType,
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
                              Text(widget.station,
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
                              Text('Type',
                                  style: GoogleFonts.montserrat(
                                      fontWeight: FontWeight.w500,
                                      color: const Color.fromRGBO(0, 0, 0, 1),
                                      fontSize: 14.0)),
                              const Spacer(),
                              Text(widget.type,
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
                                  widget.serviceType == 'Laundry'
                                      ? 'Pick-up Date & Time'
                                      : 'Date & Time',
                                  style: GoogleFonts.montserrat(
                                      fontWeight: FontWeight.w500,
                                      color: const Color.fromRGBO(0, 0, 0, 1),
                                      fontSize: 14.0)),
                              const Spacer(),
                              Text(widget.date,
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
                                Text(widget.services,
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
                                Text(widget.amount,
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
                      onPressed: () async {
                        setState(() {
                          loading = true;
                        });
                        final response = ref.read(barbingDatabaseProvider);
                        try {
                          if (widget.station.length > 2) {
                            Barbing service = Barbing(
                              data.currentUser!.uid,
                              v1_exact,
                              widget.station,
                              widget.number,
                              widget.date,
                              widget.amount,
                              widget.services,
                              'Wallet',
                              widget.serviceType,
                            );
                            await response.addNewServiceOrder(
                                service, data.currentUser!.uid, v1_exact);
                            setState(() {
                              loading = false;
                            });
                            final snackBar = SnackBar(
                                backgroundColor:
                                    const Color.fromRGBO(31, 68, 141, 1),
                                content: Text(
                                    'Successful! Your ticket have been booked',
                                    style: GoogleFonts.montserrat(
                                        fontWeight: FontWeight.w600,
                                        color: Colors.white,
                                        fontSize: 18.0)));
                            ScaffoldMessenger.of(context)
                                .showSnackBar(snackBar);
                          }
                        } catch (e) {
                          setState(() {
                            loading = false;
                            error = e.toString();
                          });
                          final snackBar = SnackBar(
                              backgroundColor:
                                  const Color.fromRGBO(31, 68, 141, 1),
                              content: Text(
                                  'Error! $error or something went wrong',
                                  style: GoogleFonts.montserrat(
                                      fontWeight: FontWeight.w600,
                                      color: Colors.white,
                                      fontSize: 18.0)));
                          ScaffoldMessenger.of(context).showSnackBar(snackBar);
                        }
                      },
                      child: loading == true
                          ? const CircularProgressIndicator(
                              color: Colors.white,
                            )
                          : Text('Continue',
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
    });
  }
}
