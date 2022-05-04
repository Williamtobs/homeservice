import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class OrderSummary extends StatelessWidget {
  final String id;
  const OrderSummary({Key? key, required this.id}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
        body: Padding(
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
                          'ID-123456',
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
                        Text(
                          'Bodija, Ibadan',
                          style: GoogleFonts.montserrat(
                              fontWeight: FontWeight.w400,
                              color: Colors.black,
                              fontSize: 14.0),
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
                      '10 : AM',
                      style: GoogleFonts.montserrat(
                          fontWeight: FontWeight.w400,
                          color: Colors.black,
                          fontSize: 14.0),
                    ),
                    const Spacer(),
                    Text(
                      '05/05/2022',
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
                      'Laundry',
                      style: GoogleFonts.montserrat(
                          fontWeight: FontWeight.w600,
                          color: Colors.black,
                          fontSize: 18.0),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Text(
                      '1x Cloth(es) Basket',
                      style: GoogleFonts.montserrat(
                          fontWeight: FontWeight.w600,
                          color: Colors.black,
                          fontSize: 14.0),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    Text(
                      '1x Other Types',
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
                          '11,000',
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
        ));
  }
}
