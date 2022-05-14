import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../Providers/auth_providers.dart';

class OrderSummary extends ConsumerWidget {
  final String id;
  const OrderSummary({Key? key, required this.id}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final data = ref.watch(fireBaseAuthProvider);

    var orders =
        FirebaseFirestore.instance.collection('Orders').doc(id).snapshots();
    return Scaffold(
        backgroundColor: const Color.fromRGBO(250, 250, 250, 1),
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
          centerTitle: true,
          leading: IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: const Icon(Icons.arrow_back_ios)),
          title: Text(
            'Order summary',
            style: GoogleFonts.montserrat(
                fontWeight: FontWeight.w500,
                color: Colors.black,
                fontSize: 17.0),
          ),
          iconTheme: const IconThemeData(color: Colors.black),
        ),
        body: StreamBuilder<DocumentSnapshot>(
            stream: orders,
            builder: (context, snapshot) {
              if (!snapshot.hasData) {
                return const Center(
                    child:
                        CircularProgressIndicator()); // Show a CircularProgressIndicator when the stream is loading
              }
              if (snapshot.error != null) {
                return const Center(
                    child: Text(
                        'Some error occurred')); // Show an error just in case(no internet etc)
              }
              Map<String, dynamic> data =
                  snapshot.data!.data() as Map<String, dynamic>;

              return Padding(
                padding: const EdgeInsets.all(10.0),
                child: Column(
                  children: [
                    Container(
                      padding: const EdgeInsets.all(20),
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(25)),
                      width: MediaQuery.of(context).size.width,
                      child: Column(
                        children: [
                          Row(
                            children: [
                              Text(
                                'Order Information',
                                style: GoogleFonts.montserrat(
                                    fontWeight: FontWeight.w600,
                                    color: Colors.black,
                                    fontSize: 16.0),
                              ),
                              const Spacer(),
                              Text(
                                'ID - ${data['service_id']}',
                                style: GoogleFonts.montserrat(
                                    fontWeight: FontWeight.w400,
                                    color: const Color.fromRGBO(31, 68, 141, 1),
                                    fontSize: 14.0),
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Row(
                            children: [
                              Text(
                                'Service Location',
                                style: GoogleFonts.montserrat(
                                    fontWeight: FontWeight.w600,
                                    color: Colors.black,
                                    fontSize: 16.0),
                              ),
                              const Spacer(),
                              Container(
                                width: 130,
                                child: Text(
                                  '${data['address']}',
                                  textAlign: TextAlign.end,
                                  style: GoogleFonts.montserrat(
                                      fontWeight: FontWeight.w400,
                                      color: Colors.black,
                                      fontSize: 14.0),
                                ),
                              ),
                            ],
                          ),
                          // const SizedBox(
                          //   height: 10,
                          // ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Row(
                        children: [
                          Text(
                            'Date and Time',
                            style: GoogleFonts.montserrat(
                                fontWeight: FontWeight.w600,
                                color: Colors.black,
                                fontSize: 16.0),
                          ),
                          const Spacer(),
                          Text(
                            '${data['date_time']}',
                            style: GoogleFonts.montserrat(
                                fontWeight: FontWeight.w400,
                                color: Colors.black,
                                fontSize: 14.0),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 20),
                    Container(
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(25)),
                      padding: const EdgeInsets.all(20),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            '${data['service_type']}',
                            style: GoogleFonts.montserrat(
                                fontWeight: FontWeight.w600,
                                color: Colors.black,
                                fontSize: 18.0),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Text(
                            '${data['service']}',
                            style: GoogleFonts.montserrat(
                                fontWeight: FontWeight.w600,
                                color: Colors.black,
                                fontSize: 14.0),
                          ),
                          const SizedBox(
                            height: 15,
                          ),
                          Row(
                            children: [
                              Text(
                                'Amount',
                                style: GoogleFonts.montserrat(
                                    fontWeight: FontWeight.w600,
                                    color: const Color.fromRGBO(31, 68, 141, 1),
                                    fontSize: 16.0),
                              ),
                              const Spacer(),
                              Text(
                                '${data['amount']}',
                                style: GoogleFonts.montserrat(
                                    fontWeight: FontWeight.w600,
                                    color: Colors.black,
                                    fontSize: 14.0),
                              ),
                            ],
                          )
                        ],
                      ),
                    )
                  ],
                ),
              );
            }));
  }
}
