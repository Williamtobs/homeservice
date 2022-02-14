import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:homeservice/UI/Shared/app_bar.dart';

class NotificationScreen extends StatelessWidget {
  const NotificationScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(254, 254, 254, 1),
      appBar: PreferredSize(
          preferredSize: Size.fromHeight(AppBar().preferredSize.height),
          child: const Appbar(notification: 'Notification',)),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          children: [
            Container(
              width: MediaQuery
                  .of(context)
                  .size
                  .width,
              decoration: BoxDecoration(
                color: const Color.fromRGBO(249, 249, 249, 1),
                borderRadius: BorderRadius.circular(15.0),
              ),
              child: ListTile(
                leading: Container(
                  height: 45,
                  width: 45,
                  decoration: const BoxDecoration(
                      color: Color.fromRGBO(31, 68, 141, 1),
                      shape: BoxShape.circle
                  ),
                  child: const Icon(
                    Icons.credit_card_outlined,
                    color: Colors.white,
                  ),
                ),
                title: Text('Payment', style: GoogleFonts.montserrat(
                    fontWeight: FontWeight.w600,
                    color: const Color.fromRGBO(0, 0, 0, 1),
                    fontSize: 22.0
                )),
                subtitle: Text('Thank you! Your Transaction is compl....',
                    style: GoogleFonts.montserrat(
                        fontWeight: FontWeight.w600,
                        color: const Color.fromRGBO(78, 78, 78, 1),
                        fontSize: 13.0
                    )),
              ),
            ),
            const SizedBox(height: 10),
            Container(
              width: MediaQuery
                  .of(context)
                  .size
                  .width,
              decoration: BoxDecoration(
                color: const Color.fromRGBO(249, 249, 249, 1),
                borderRadius: BorderRadius.circular(15.0),
              ),
              child: ListTile(
                leading: Container(
                  height: 45,
                  width: 45,
                  decoration: const BoxDecoration(
                      color: Color.fromRGBO(31, 68, 141, 1),
                      shape: BoxShape.circle
                  ),
                  child: const Icon(
                    Icons.confirmation_number_outlined,
                    color: Colors.white,
                  ),
                ),
                title: Text(' ', style: GoogleFonts.montserrat(
                    fontWeight: FontWeight.w600,
                    color: const Color.fromRGBO(0, 0, 0, 1),
                    fontSize: 22.0
                )),
                subtitle: Text('Invite your friends - Get 10% discount.... ',
                    style: GoogleFonts.montserrat(
                        fontWeight: FontWeight.w600,
                        color: const Color.fromRGBO(78, 78, 78, 1),
                        fontSize: 13.0
                    )),
              ),
            ),
            const SizedBox(height: 10),
            Container(
              width: MediaQuery
                  .of(context)
                  .size
                  .width,
              decoration: BoxDecoration(
                color: const Color.fromRGBO(249, 249, 249, 1),
                borderRadius: BorderRadius.circular(15.0),
              ),
              child: ListTile(
                leading: Container(
                  height: 45,
                  width: 45,
                  decoration: const BoxDecoration(
                      color: Color.fromRGBO(31, 68, 141, 1),
                      shape: BoxShape.circle
                  ),
                  child: const Icon(
                    Icons.done_all_outlined,
                    color: Colors.white,
                  ),
                ),
                title: Text('Booking Successful', style: GoogleFonts.montserrat(
                    fontWeight: FontWeight.w600,
                    color: const Color.fromRGBO(0, 0, 0, 1),
                    fontSize: 22.0
                )),
                subtitle: Text('Thank you! Your Transaction is compl....',
                    style: GoogleFonts.montserrat(
                        fontWeight: FontWeight.w600,
                        color: const Color.fromRGBO(78, 78, 78, 1),
                        fontSize: 13.0
                    )),
              ),
            ),
          ],
        ),
      ),
    );
  }

}