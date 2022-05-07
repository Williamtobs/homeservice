import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:homeservice/UI/Shared/app_bar.dart';
import 'package:homeservice/UI/Ticketscreen/widgets/cards.dart';

import 'controller/select_ticket_controller.dart';
import 'train_ticket.dart';

class SelectTicket extends StatelessWidget {
  final String name;
  const SelectTicket({Key? key, required this.name}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(250, 250, 250, 1),
      appBar: PreferredSize(
          preferredSize: Size.fromHeight(AppBar().preferredSize.height),
          child: Appbar(
            notification: name,
          )),
      body: Consumer(builder: (context, watch, child) {
        final controller = watch.watch(selectTicketNotifier);
        return Column(children: [
          const SizedBox(
            height: 20,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 20.0, right: 20.0),
            child: Cards(
                showName: controller.ibadanLagos,
                description: controller.descriptionIbadan),
          ),
          const SizedBox(height: 10),
          Padding(
            padding: const EdgeInsets.only(left: 20.0, right: 20.0),
            child: Cards(
                showName: controller.lagosIbadan,
                description: controller.descriptionLagos),
          )
        ]);
      }),
    );
  }

  //Map<String, String> events = {'event_name': 'Wizkid'};
  //List options = ['All', "Popular", "Event", "Train", "Sports"];
}
