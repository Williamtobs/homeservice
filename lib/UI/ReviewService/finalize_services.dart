import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:uuid/uuid.dart';

import '../../Database/orders_database.dart';
import '../../Model/orders.dart';
import '../../Providers/auth_providers.dart';
import '../Shared/app_bar.dart';
import 'change_address.dart';

class FinalizeServices extends StatefulWidget {
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
  State<FinalizeServices> createState() => _FinalizeServicesState();
}

class _FinalizeServicesState extends State<FinalizeServices> {
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
    print(v1_exact);
    return Consumer(builder: (context, ref, _) {
      final data = ref.watch(fireBaseAuthProvider);
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
                            child: Text(widget.serviceType,
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
                                      fontWeight: FontWeight.w500,
                                      color: const Color.fromRGBO(0, 0, 0, 1),
                                      fontSize: 14.0)),
                              const Spacer(),
                              Text(widget.address,
                                  style: GoogleFonts.montserrat(
                                      fontWeight: FontWeight.w400,
                                      color: const Color.fromRGBO(0, 0, 0, 1),
                                      fontSize: 12.0)),
                              // const SizedBox(
                              //   width: 2,
                              // ),
                              IconButton(
                                  onPressed: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => ChangeAddress(
                                                address: widget.address,
                                              )),
                                    );
                                    //ChangeAddress
                                  },
                                  icon: const Icon(Icons.arrow_forward_ios))
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
                              Text('Order Id',
                                  style: GoogleFonts.montserrat(
                                      fontWeight: FontWeight.w500,
                                      color: const Color.fromRGBO(0, 0, 0, 1),
                                      fontSize: 14.0)),
                              const Spacer(),
                              Text(v1_exact,
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
                              Text('Phone Number',
                                  style: GoogleFonts.montserrat(
                                      fontWeight: FontWeight.w500,
                                      color: const Color.fromRGBO(0, 0, 0, 1),
                                      fontSize: 14.0)),
                              const Spacer(),
                              Text(widget.number,
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
                          if (widget.address.length > 2) {
                            Barbing service = Barbing(
                              data.currentUser!.uid,
                              v1_exact,
                              widget.address,
                              widget.number,
                              widget.date,
                              widget.amount,
                              widget.services,
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
                                    'Successful! Your order has been placed',
                                    style: GoogleFonts.montserrat(
                                        fontWeight: FontWeight.w600,
                                        color: Colors.white,
                                        fontSize: 18.0)));
                            ScaffoldMessenger.of(context)
                                .showSnackBar(snackBar);
                          } else {
                            final snackBar = SnackBar(
                                backgroundColor:
                                    const Color.fromRGBO(31, 68, 141, 1),
                                content: Text(
                                    'Process failed! Choose delivery address',
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

  // void requestBarbingService(var data, var uuid, var response) async {
  //   Barbing service = Barbing(data, uuid, widget.address, widget.number,
  //       widget.date, widget.amount, widget.services, widget.serviceType);
  //   await response.addNewServiceOrder(service, data, uuid);
  // }
}
