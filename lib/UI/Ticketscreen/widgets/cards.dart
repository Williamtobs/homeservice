import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:homeservice/UI/Ticketscreen/ticket_screen.dart';

import '../train_ticket.dart';

class Cards extends StatelessWidget {
  final String showName;
  final String description;
  const Cards({Key? key, required this.showName, required this.description})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      //height: 100,
      decoration: const BoxDecoration(
          color: Color.fromRGBO(255, 255, 255, 1),
          borderRadius: BorderRadius.all(Radius.circular(35))),
      child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(showName,
                style: GoogleFonts.montserrat(
                    fontWeight: FontWeight.w600,
                    color: const Color.fromRGBO(0, 0, 0, 1),
                    fontSize: 20.0)),
            const SizedBox(
              height: 10,
            ),
            Text(description,
                textAlign: TextAlign.start,
                style: GoogleFonts.montserrat(
                    fontWeight: FontWeight.w600,
                    color: const Color.fromRGBO(0, 0, 0, 1),
                    fontSize: 12.0)),
            const SizedBox(
              height: 10,
            ),
            Align(
              alignment: Alignment.bottomRight,
              child: Container(
                width: 91,
                height: 40,
                decoration: BoxDecoration(
                  color: const Color.fromRGBO(31, 68, 141, 1),
                  borderRadius: BorderRadius.circular(15),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.5),
                      spreadRadius: 2,
                      blurRadius: 2,
                      offset: const Offset(0, 3), // changes position of shadow
                    ),
                  ],
                ),
                child: TextButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  showName == 'Lagos to Ibadan'
                                      ? const TrainTicket(
                                          name: 'Lagos',
                                          ticketName: 'Lagos to Ibadan',
                                        )
                                      : const TrainTicket(
                                          name: 'Ibadan',
                                          ticketName: 'Ibadan to Lagos')));
                    },
                    child: Text('Buy',
                        style: GoogleFonts.montserrat(
                            fontWeight: FontWeight.w500,
                            color: const Color.fromRGBO(255, 255, 255, 1),
                            fontSize: 18.0))),
              ),
            )
          ],
        ),
      ),
    );
  }
}
