import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../Notification/notification_screen.dart';
import '../Shared/Sidebar/side_bar.dart';

class HistoryScreen extends StatelessWidget {
  const HistoryScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: true,
        title: Text(
          'History',
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
      drawer: SideBar(),
      body: Column(),
    );
  }
}
