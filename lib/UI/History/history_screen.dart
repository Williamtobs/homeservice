import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:homeservice/Constants/history_list.dart';

import '../Notification/notification_screen.dart';
import '../Shared/Sidebar/side_bar.dart';
import 'order_summary.dart';
import 'widget/history_card.dart';

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
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: ListView.builder(
          itemBuilder: ((context, index) {
            var items = historyList;
            return GestureDetector(
              onTap: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => OrderSummary(
                            id: items[index].id,
                          ))),
              child: HistoryCard(
                amount: items[index].amount,
                id: items[index].id,
                orderType: items[index].orderType,
                scheduledDate: items[index].scheduledDate,
                scheduledTime: items[index].scheduledTime,
              ),
            );
          }),
          itemCount: historyList.length,
        ),
      ),
    );
  }
}
