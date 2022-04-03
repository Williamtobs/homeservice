import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:homeservice/Constants/home_services.dart';
import 'package:homeservice/UI/BarbingScreen/barbing_screen.dart';
import 'package:homeservice/UI/Ticketscreen/select_ticket.dart';

import '../Servicescreen/services.dart';

class Gridview extends StatelessWidget {
  const Gridview({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GridView.count(
      padding: EdgeInsets.zero,
      shrinkWrap: true,
      crossAxisCount: 3,
      childAspectRatio: (2 / 2),
      crossAxisSpacing: 15,
      mainAxisSpacing: 15,
      physics: const BouncingScrollPhysics(),
      children: homeService
          .map((data) => GestureDetector(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => data.name! == 'Tickets'
                              ? SelectTicket(
                                  name: data.name!,
                                )
                              : data.name! == 'Barbing'
                                  ? BarbingScreen(
                                      name: data.name!,
                                    )
                                  : BookService(
                                      name: data.name!,
                                    )));
                },
                child: Container(
                  //width: 90,
                  color: const Color.fromRGBO(229, 229, 229, 1),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        height: 52,
                        width: 49,
                        alignment: Alignment.center,
                        decoration: const BoxDecoration(
                          color: Color.fromRGBO(31, 68, 141, 1),
                          shape: BoxShape.circle,
                        ),
                        child: Image.asset(
                          data.icon!,
                          height: 32,
                          width: 32,
                        ),
                      ),
                      Text(data.name!,
                          style: GoogleFonts.montserrat(
                              fontWeight: FontWeight.w600,
                              color: const Color.fromRGBO(0, 0, 0, 1),
                              fontSize: 11.0))
                    ],
                  ),
                ),
              ))
          .toList(),
    );
  }
}
