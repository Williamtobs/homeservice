import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart';

import '../Notification/notification_screen.dart';
import '../Shared/Sidebar/side_bar.dart';

class ChatWhatsapp extends StatelessWidget {
  const ChatWhatsapp({Key? key}) : super(key: key);

  final String _url =
      "https://wa.me/+2348146859553?text=Hello, my name is________";

  urlLauncher() async {
    if (!await launch(_url)) throw 'Could not launch $_url';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: SideBar(),
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: true,
        title: Text(
          'Contact Us',
          style: GoogleFonts.montserrat(
              fontWeight: FontWeight.w600, color: Colors.black, fontSize: 17.0),
        ),
        iconTheme: const IconThemeData(color: Colors.black),
        actions: [
          IconButton(
            icon: const Icon(Icons.notifications, color: Colors.black),
            onPressed: () {
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => const NotificationScreen()));
            },
          ),
        ],
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: Text('Reach out to us on Whatsapp',
                style: GoogleFonts.montserrat(
                    fontWeight: FontWeight.w500,
                    color: const Color.fromRGBO(0, 0, 0, 1),
                    fontSize: 16.0)),
          ),
          const SizedBox(
            height: 20,
          ),
          Center(
            child: Container(
              width: MediaQuery.of(context).size.width * 0.80,
              height: 50,
              decoration: BoxDecoration(
                  color: const Color.fromRGBO(31, 68, 141, 1),
                  borderRadius: BorderRadius.circular(20)),
              child: TextButton(
                  onPressed: urlLauncher,
                  child: Text('Open Whatsapp',
                      style: GoogleFonts.montserrat(
                          fontWeight: FontWeight.w500,
                          color: Colors.white,
                          fontSize: 16.0))),
            ),
          )
        ],
      ),
    );
  }
}
