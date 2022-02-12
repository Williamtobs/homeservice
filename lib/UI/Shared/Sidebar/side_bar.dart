import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../images.dart';

class SideBar extends StatelessWidget{
  const SideBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(
            children: [
              const SizedBox(height: 10),
              Row(children:  const[
                Icon(
                  Icons.arrow_back_outlined,
                ),
                Spacer(),
                Icon(
                  Icons.border_color_outlined,
                ),
              ]),
              const SizedBox(height: 20),
              Row(
                children: [
                  SizedBox(
                    width: 80,
                    height: 80,
                    child: CircleAvatar(
                      child: Image.asset(avatar),
                    ),
                  ),
                  const SizedBox(width: 10),
                  Text('John Doe', style: GoogleFonts.montserrat(
                    fontWeight: FontWeight.w700,
                    color: const Color.fromRGBO(0, 0, 0, 1),
                    fontSize: 30.0,
                  ))
                ],
              ),
              const SizedBox(height: 10),
              Row(children: [
                const Icon(
                  Icons.call_outlined,
                  color: Color.fromRGBO(134, 131, 131, 1),
                ),
                const SizedBox(width: 5),
                Text('0800 2292 222', style: GoogleFonts.montserrat(
                  fontWeight: FontWeight.w600,
                  color: const Color.fromRGBO(134, 131, 131, 1),
                  fontSize: 15.0,
                )),
              ]),
              const SizedBox(height: 10),
              Row(children: [
                const Icon(
                  Icons.email_outlined,
                  color: Color.fromRGBO(134, 131, 131, 1),
                ),
                const SizedBox(width: 5),
                Text('johndoe@gmail.com', style: GoogleFonts.montserrat(
                  fontWeight: FontWeight.w600,
                  color: const Color.fromRGBO(134, 131, 131, 1),
                  fontSize: 15.0,
                )),
              ]),
              const SizedBox(height: 10),
              const Divider(
                color: Color.fromRGBO(229, 229, 229, 1),
                  height: 2
              ),
              const SizedBox(height: 10),
              ListTile(
                leading: const Icon(
                Icons.favorite_outlined,
                color: Color.fromRGBO(31, 68, 141, 1),
              ),
                title: Text('Your favourites', style: GoogleFonts.montserrat(
                  fontWeight: FontWeight.w600,
                  color: const Color.fromRGBO(0, 0, 0, 1),
                  fontSize: 18.0,)
                ),
              ),
              const SizedBox(height: 5),
              ListTile(
                leading: const Icon(
                  Icons.credit_card_outlined,
                  color: Color.fromRGBO(31, 68, 141, 1),
                ),
                title: Text('Payments', style: GoogleFonts.montserrat(
                  fontWeight: FontWeight.w600,
                  color: const Color.fromRGBO(0, 0, 0, 1),
                  fontSize: 18.0,)
                ),
              ),
              const SizedBox(height: 5),
              ListTile(
                leading: const Icon(
                  Icons.attach_money_outlined,
                  color: Color.fromRGBO(31, 68, 141, 1),
                ),
                title: Text('Refer and Earn', style: GoogleFonts.montserrat(
                  fontWeight: FontWeight.w600,
                  color: const Color.fromRGBO(0, 0, 0, 1),
                  fontSize: 18.0,)
                ),
              ),
              const SizedBox(height: 5),
              ListTile(
                leading: const Icon(
                  Icons.contact_support,
                  color: Color.fromRGBO(31, 68, 141, 1),
                ),
                title: Text('Support', style: GoogleFonts.montserrat(
                  fontWeight: FontWeight.w600,
                  color: const Color.fromRGBO(0, 0, 0, 1),
                  fontSize: 18.0,)
                ),
              ),
              const SizedBox(height: 5),
              ListTile(
                leading: const Icon(
                  Icons.settings,
                  color: Color.fromRGBO(31, 68, 141, 1),
                ),
                title: Text('Settings', style: GoogleFonts.montserrat(
                  fontWeight: FontWeight.w600,
                  color: const Color.fromRGBO(0, 0, 0, 1),
                  fontSize: 18.0,)
                ),
              ),
              const SizedBox(height: 5),
              ListTile(
                leading: const Icon(
                  Icons.error,
                  color: Color.fromRGBO(31, 68, 141, 1),
                ),
                title: Text('About Us', style: GoogleFonts.montserrat(
                  fontWeight: FontWeight.w600,
                  color: const Color.fromRGBO(0, 0, 0, 1),
                  fontSize: 18.0,)
                ),
              ),
              const SizedBox(height: 5),
              ListTile(
                leading: const Icon(
                  Icons.logout,
                  color: Color.fromRGBO(235, 50, 35, 1),
                ),
                title: Text('Log Out', style: GoogleFonts.montserrat(
                  fontWeight: FontWeight.w600,
                  color: const Color.fromRGBO(235, 50, 35, 1),
                  fontSize: 18.0,)
                ),
              ),
              const SizedBox(height: 40),
            ]
          ),
        ),
      ),
    );
  }

}