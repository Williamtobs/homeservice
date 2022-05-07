import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:homeservice/UI/Shared/images.dart';
import 'package:intl/intl.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';

import '../../Constants/time.dart';
import '../ReviewService/finalize_services.dart';
import '../Shared/app_bar.dart';

class BarbingScreen extends StatefulWidget {
  final String name;
  const BarbingScreen({Key? key, required this.name}) : super(key: key);

  @override
  State<BarbingScreen> createState() => _BarbingScreenState();
}

class _BarbingScreenState extends State<BarbingScreen> {
  String? hairAmount;

  String? hairDyeAmount;

  String serviceAmount = '0';

  String service = '';

  String serviceTime = 'Once a Month';

  String serviceMonth = '1 Month';

  String selectedDate = '';
  String time = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(250, 250, 250, 1),
      appBar: PreferredSize(
          preferredSize: Size.fromHeight(AppBar().preferredSize.height),
          child: Appbar(
            notification: widget.name,
          )),
      body: Stack(
        children: [
          SingleChildScrollView(
            physics: const AlwaysScrollableScrollPhysics(),
            child: Column(
              children: [
                const SizedBox(
                  height: 20,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 10.0, right: 10.0),
                  child: Container(
                    //height: 263,
                    decoration: BoxDecoration(
                        color: const Color.fromRGBO(255, 255, 255, 1),
                        borderRadius: BorderRadius.circular(35)),
                    child: Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(widget.name,
                              style: GoogleFonts.montserrat(
                                  fontWeight: FontWeight.w600,
                                  color: const Color.fromRGBO(0, 0, 0, 1),
                                  fontSize: 24.0)),
                          const SizedBox(
                            height: 10,
                          ),
                          Row(
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text('Hair Cut',
                                      style: GoogleFonts.montserrat(
                                          fontWeight: FontWeight.w500,
                                          color:
                                              const Color.fromRGBO(0, 0, 0, 1),
                                          fontSize: 17.0)),
                                  const SizedBox(
                                    height: 5,
                                  ),
                                  Consumer(builder: (context, ref, child) {
                                    var users = FirebaseFirestore.instance
                                        .collection('services')
                                        .doc('9QJWx7ykDh5HpCFhDWC7')
                                        .snapshots();
                                    return StreamBuilder<DocumentSnapshot>(
                                        stream: users,
                                        builder: (context, snapshot) {
                                          if (!snapshot.hasData) {
                                            return Text("Loading",
                                                style: GoogleFonts.montserrat(
                                                  fontWeight: FontWeight.w500,
                                                  color: const Color.fromRGBO(
                                                      244, 18, 0, 1),
                                                  fontSize: 17.0,
                                                ));
                                          }
                                          Map<String, dynamic> data =
                                              snapshot.data!.data()
                                                  as Map<String, dynamic>;
                                          hairAmount = data['Barbing'];
                                          return Text(hairAmount!,
                                              style: GoogleFonts.montserrat(
                                                  fontWeight: FontWeight.w500,
                                                  color: const Color.fromRGBO(
                                                      244, 18, 0, 1),
                                                  fontSize: 17.0));
                                        });
                                  })
                                ],
                              ),
                              const Spacer(),
                              service != 'Hair Cut'
                                  ? Container(
                                      width: 66,
                                      height: 30,
                                      decoration: BoxDecoration(
                                          color: const Color.fromRGBO(
                                              31, 68, 141, 1),
                                          borderRadius:
                                              BorderRadius.circular(12)),
                                      child: TextButton(
                                          onPressed: () {
                                            setState(() {
                                              service = 'Hair Cut';
                                              serviceAmount = hairAmount!;
                                            });
                                          },
                                          child: Text('Select',
                                              style: GoogleFonts.montserrat(
                                                  fontWeight: FontWeight.w500,
                                                  color: const Color.fromRGBO(
                                                      255, 255, 255, 1),
                                                  fontSize: 11.0))),
                                    )
                                  : Image.asset(
                                      check,
                                      width: 38,
                                      height: 38,
                                    ),
                            ],
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          const Divider(
                              color: Color.fromRGBO(200, 200, 200, 1)),
                          const SizedBox(
                            height: 10,
                          ),
                          Row(
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text('Hair Cut and Dyeing',
                                      style: GoogleFonts.montserrat(
                                          fontWeight: FontWeight.w500,
                                          color:
                                              const Color.fromRGBO(0, 0, 0, 1),
                                          fontSize: 17.0)),
                                  const SizedBox(
                                    height: 5,
                                  ),
                                  Consumer(builder: (context, ref, child) {
                                    var users = FirebaseFirestore.instance
                                        .collection('services')
                                        .doc('9QJWx7ykDh5HpCFhDWC7')
                                        .snapshots();
                                    return StreamBuilder<DocumentSnapshot>(
                                        stream: users,
                                        builder: (context, snapshot) {
                                          if (!snapshot.hasData) {
                                            return Text("Loading",
                                                style: GoogleFonts.montserrat(
                                                  fontWeight: FontWeight.w500,
                                                  color: const Color.fromRGBO(
                                                      244, 18, 0, 1),
                                                  fontSize: 17.0,
                                                ));
                                          }
                                          Map<String, dynamic> data =
                                              snapshot.data!.data()
                                                  as Map<String, dynamic>;
                                          hairDyeAmount =
                                              data['Barbing and Dye'];
                                          return Text(hairDyeAmount!,
                                              style: GoogleFonts.montserrat(
                                                  fontWeight: FontWeight.w500,
                                                  color: const Color.fromRGBO(
                                                      244, 18, 0, 1),
                                                  fontSize: 17.0));
                                        });
                                  })
                                ],
                              ),
                              const Spacer(),
                              service != 'Hair Cut and Dyeing'
                                  ? Container(
                                      width: 66,
                                      height: 30,
                                      decoration: BoxDecoration(
                                          color: const Color.fromRGBO(
                                              31, 68, 141, 1),
                                          borderRadius:
                                              BorderRadius.circular(12)),
                                      child: TextButton(
                                          onPressed: () {
                                            setState(() {
                                              service = 'Hair Cut and Dyeing';
                                              serviceAmount = hairDyeAmount!;
                                            });
                                          },
                                          child: Text('Select',
                                              style: GoogleFonts.montserrat(
                                                  fontWeight: FontWeight.w500,
                                                  color: const Color.fromRGBO(
                                                      255, 255, 255, 1),
                                                  fontSize: 11.0))),
                                    )
                                  : Image.asset(
                                      check,
                                      width: 38,
                                      height: 38,
                                    ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 10),
                Padding(
                  padding: const EdgeInsets.only(left: 10.0),
                  child: Text('Date',
                      style: GoogleFonts.montserrat(
                          fontWeight: FontWeight.w500,
                          color: const Color.fromRGBO(0, 0, 0, 1),
                          fontSize: 18.0)),
                ),
                const SizedBox(height: 10),
                Padding(
                  padding: const EdgeInsets.only(left: 10.0, right: 10),
                  child: Container(
                    height: 250,
                    width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(25),
                      color: Colors.white,
                    ),
                    child: SfDateRangePicker(
                      enablePastDates: false,
                      minDate: DateTime.now(),
                      initialSelectedDate: DateTime.now(),
                      selectionMode: DateRangePickerSelectionMode.single,
                      onSelectionChanged: _onSelectionChanged,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 10.0),
                  child: Text('Time',
                      style: GoogleFonts.montserrat(
                          fontWeight: FontWeight.w500,
                          color: const Color.fromRGBO(0, 0, 0, 1),
                          fontSize: 18.0)),
                ),
                const SizedBox(
                  height: 10,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 10.0),
                  child: SizedBox(
                    height: 30,
                    width: MediaQuery.of(context).size.width,
                    child: Center(
                      child: ListView.builder(
                        itemCount: times.length,
                        shrinkWrap: true,
                        scrollDirection: Axis.horizontal,
                        physics: const BouncingScrollPhysics(),
                        itemBuilder: (BuildContext context, int index) {
                          return GestureDetector(
                            onTap: () {
                              selected(times[index]);
                              print(times[index]);
                            },
                            child: Container(
                              width: 80,
                              height: 30,
                              alignment: Alignment.center,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(30),
                                color: time == times[index]
                                    ? const Color.fromRGBO(31, 68, 141, 1)
                                    : Colors.white,
                              ),
                              child: Text(times[index],
                                  style: GoogleFonts.montserrat(
                                      fontWeight: FontWeight.w500,
                                      color: time == times[index]
                                          ? Colors.white
                                          : const Color.fromARGB(
                                              255, 49, 13, 13),
                                      fontSize: 12.0)),
                            ),
                          );
                        },
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 30)
              ],
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              //height: 70,
              padding:
                  const EdgeInsets.only(left: 15, right: 15, top: 8, bottom: 8),
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border.all(
                      width: 1, color: const Color.fromRGBO(0, 0, 0, 0.25)),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.5),
                      spreadRadius: 2,
                      blurRadius: 2,
                      offset: const Offset(3, 0),
                    )
                  ]),
              child: Row(
                children: [
                  Text(serviceAmount,
                      style: GoogleFonts.montserrat(
                          fontWeight: FontWeight.w600,
                          color: const Color.fromRGBO(31, 68, 141, 1),
                          fontSize: 24.0)),
                  const Spacer(),
                  Container(
                    width: 113,
                    height: 40,
                    decoration: BoxDecoration(
                      color: const Color.fromRGBO(31, 68, 141, 1),
                      borderRadius: BorderRadius.circular(25),
                    ),
                    child: TextButton(
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => FinalizeServices(
                                        services: '$service',
                                        address: 'UI, Ibadan',
                                        number: '08146859553',
                                        amount: serviceAmount,
                                        date:
                                            '${selectedDate.characters.take(10)}' +
                                                " " +
                                                time,
                                        serviceType: widget.name,
                                      )));
                        },
                        child: Text('Pay',
                            style: GoogleFonts.montserrat(
                                fontWeight: FontWeight.w500,
                                color: const Color.fromRGBO(255, 255, 255, 1),
                                fontSize: 12.0))),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }

  void _onSelectionChanged(DateRangePickerSelectionChangedArgs args) {
    setState(() {
      if (args.value is PickerDateRange) {
      } else if (args.value is DateTime) {
        DateFormat formatter = DateFormat('dd-MM-yyyy');
        selectedDate = formatter.format(args.value);
        print(selectedDate);
      } else if (args.value is List<DateTime>) {
      } else {}
    });
  }

  void selected(String time) {
    setState(() {
      this.time = time;
    });
  }
}
