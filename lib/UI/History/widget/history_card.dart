import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class HistoryCard extends StatelessWidget {
  final String orderType;
  final String id;
  final String scheduledDate;
  final String scheduledTime;
  final String amount;

  const HistoryCard(
      {Key? key,
      required this.orderType,
      required this.id,
      required this.scheduledDate,
      required this.scheduledTime,
      required this.amount})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 8.0, bottom: 8),
      child: Container(
        padding: const EdgeInsets.all(10),
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(25),
          border: Border.all(
            color: Colors.grey,
            width: 1,
          ),
        ),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Row(
            children: [
              Text(orderType,
                  style: GoogleFonts.montserrat(
                      fontWeight: FontWeight.w500,
                      color: Colors.black,
                      fontSize: 14.0)),
              const Spacer(),
              Text(id,
                  style: GoogleFonts.montserrat(
                      fontWeight: FontWeight.w400,
                      color: Colors.black,
                      fontSize: 12.0)),
            ],
          ),
          const SizedBox(
            height: 15,
          ),
          Row(
            children: [
              Text('Pick-Up Date',
                  style: GoogleFonts.montserrat(
                      fontWeight: FontWeight.w500,
                      color: Colors.black,
                      fontSize: 12.0)),
              const Spacer(),
              Text('Price',
                  style: GoogleFonts.montserrat(
                      fontWeight: FontWeight.w500,
                      color: Colors.black,
                      fontSize: 12.0)),
            ],
          ),
          const SizedBox(
            height: 5,
          ),
          Row(
            children: [
              Text('$scheduledDate $scheduledTime',
                  style: GoogleFonts.montserrat(
                      fontWeight: FontWeight.w500,
                      color: Colors.black,
                      fontSize: 12.0)),
              const Spacer(),
              Text(amount,
                  style: GoogleFonts.montserrat(
                      fontWeight: FontWeight.w500,
                      color: Colors.black,
                      fontSize: 12.0)),
            ],
          ),
        ]),
      ),
    );
  }
}
