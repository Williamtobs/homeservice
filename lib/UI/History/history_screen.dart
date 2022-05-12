import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../Database/orders_database.dart';
import '../../Providers/auth_providers.dart';
import '../Notification/notification_screen.dart';
import '../Shared/Sidebar/side_bar.dart';
import 'order_summary.dart';
import 'widget/history_card.dart';

class HistoryScreen extends StatelessWidget {
  HistoryScreen({Key? key}) : super(key: key);

  List<DocumentSnapshot>? _historyList;

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
      body: Consumer(builder: (context, ref, _) {
        final database = ref.read(barbingDatabaseProvider);
        final data = ref.read(fireBaseAuthProvider);
        return StreamBuilder(
            stream: database.allOrders,
            builder: (context, AsyncSnapshot snapshot) {
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
              _historyList = snapshot.data!.docs;
              return Padding(
                padding: const EdgeInsets.all(10.0),
                child: ListView.builder(
                  itemBuilder: ((context, index) {
                    final items = _historyList![index];
                    //print(_historyList![index].id);
                    if (_historyList!.isEmpty) {
                      return const Center(child: Text('No recent order'));
                    }
                    if (items['uid'] == data.currentUser!.uid) {
                      return GestureDetector(
                        onTap: () => Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => OrderSummary(
                                      id: items['service_id'],
                                    ))),
                        child: HistoryCard(
                          amount: items['amount'],
                          id: items['service_id'],
                          orderType: items['service_type'],
                          scheduledDate: items['date_time'],
                        ),
                      );
                    } else {
                      return Container();
                    }
                  }),
                  itemCount: _historyList!.length,
                ),
              );
            });
      }),
    );
  }
}
