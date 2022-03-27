import 'package:flutter/material.dart';
import 'package:homeservice/UI/Shared/app_bar.dart';
import 'package:homeservice/UI/Ticketscreen/widgets/cards.dart';
import 'package:homeservice/UI/Ticketscreen/widgets/containers.dart';

class SelectTicket extends StatelessWidget {
  final String name;
  SelectTicket({Key? key, required this.name}) : super(key: key);

  String eventName = 'Wizid Show';
  String description =
      'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Elementum '
      'habitasse nec lectus consectetur. Pulvinar vitae vitae dapibus mi '
      'elementum lacus viverra.';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(250, 250, 250, 1),
      appBar: PreferredSize(
          preferredSize: Size.fromHeight(AppBar().preferredSize.height),
          child: Appbar(
            notification: name,
          )),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(children: [
          const SizedBox(
            height: 20,
          ),
          Container(
            width: 459,
            height: 33,
            decoration: const BoxDecoration(
                color: Color.fromRGBO(255, 243, 243, 1),
                borderRadius: BorderRadius.all(Radius.circular(30))),
            child: ListView(
                physics: const BouncingScrollPhysics(),
                scrollDirection: Axis.horizontal,
                shrinkWrap: true,
                children: List.generate(
                    options.length,
                    (index) => Containers(
                        name: options[index],
                        boxColor: const Color.fromRGBO(255, 243, 243, 1),
                        textColor: const Color.fromRGBO(0, 0, 0, 1)))),
          ),
          const SizedBox(
            height: 20,
          ),
          Cards(showName: eventName, description: description)
        ]),
      ),
    );
  }

  //Map<String, String> events = {'event_name': 'Wizkid'};
  List options = ['All', "Popular", "Event", "Train", "Sports"];
}
