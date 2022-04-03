import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:homeservice/UI/Shared/images.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';

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
            physics: const BouncingScrollPhysics(),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 20,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 20.0, right: 20.0),
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
                                      width: 42,
                                      height: 42,
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
                                      width: 42,
                                      height: 42,
                                    ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 20.0, right: 20.0),
                  child: Text('How often do you want you barb your hair?',
                      style: GoogleFonts.montserrat(
                          fontWeight: FontWeight.w600,
                          color: const Color.fromRGBO(0, 0, 0, 1),
                          fontSize: 11.0)),
                ),
                const SizedBox(
                  height: 10,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 20.0, right: 20.0),
                  child: Container(
                    width: MediaQuery.of(context).size.width,
                    height: 27,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: const Color.fromRGBO(255, 255, 255, 1)),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        InkWell(
                          onTap: () {
                            setState(() {
                              serviceTime = 'Once a Month';
                            });
                          },
                          child: Container(
                            height: 27,
                            width: 107,
                            alignment: Alignment.center,
                            padding: const EdgeInsets.all(5),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: serviceTime == 'Once a Month'
                                    ? const Color.fromRGBO(31, 68, 141, 1)
                                    : const Color.fromRGBO(255, 255, 255, 1)),
                            child: Text('Once a Month',
                                style: GoogleFonts.montserrat(
                                    fontWeight: FontWeight.w500,
                                    color: serviceTime == 'Once a Month'
                                        ? const Color.fromRGBO(255, 255, 255, 1)
                                        : const Color.fromRGBO(0, 0, 0, 1),
                                    fontSize: 8.0)),
                          ),
                        ),
                        InkWell(
                          onTap: () {
                            setState(() {
                              serviceTime = 'Twice a Month';
                            });
                          },
                          child: Container(
                            height: 27,
                            width: 107,
                            alignment: Alignment.center,
                            padding: const EdgeInsets.all(5),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: serviceTime == 'Twice a Month'
                                    ? const Color.fromRGBO(31, 68, 141, 1)
                                    : const Color.fromRGBO(255, 255, 255, 1)),
                            child: Text('Twice a Month',
                                style: GoogleFonts.montserrat(
                                    fontWeight: FontWeight.w500,
                                    color: serviceTime == 'Twice a Month'
                                        ? const Color.fromRGBO(255, 255, 255, 1)
                                        : const Color.fromRGBO(0, 0, 0, 1),
                                    fontSize: 8.0)),
                          ),
                        ),
                        InkWell(
                          onTap: () {
                            setState(() {
                              serviceTime = 'Four Times a Month';
                            });
                          },
                          child: Container(
                            height: 27,
                            width: 107,
                            padding: const EdgeInsets.all(5),
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: serviceTime == 'Four Times a Month'
                                    ? const Color.fromRGBO(31, 68, 141, 1)
                                    : const Color.fromRGBO(255, 255, 255, 1)),
                            child: Text('Four Times a Month',
                                style: GoogleFonts.montserrat(
                                    fontWeight: FontWeight.w500,
                                    color: serviceTime == 'Four Times a Month'
                                        ? const Color.fromRGBO(255, 255, 255, 1)
                                        : const Color.fromRGBO(0, 0, 0, 1),
                                    fontSize: 8.0)),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 20.0, right: 20.0),
                  child: Text('How many months do you wish to barb?',
                      style: GoogleFonts.montserrat(
                          fontWeight: FontWeight.w600,
                          color: const Color.fromRGBO(0, 0, 0, 1),
                          fontSize: 11.0)),
                ),
                const SizedBox(
                  height: 10,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 20.0, right: 20.0),
                  child: Container(
                    width: MediaQuery.of(context).size.width,
                    height: 67,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: const Color.fromRGBO(255, 255, 255, 1)),
                    child: Column(children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          InkWell(
                            onTap: () {
                              setState(() {
                                serviceMonth = '1 Month';
                              });
                            },
                            child: Container(
                              height: 27,
                              width: 101,
                              padding: const EdgeInsets.all(5),
                              alignment: Alignment.center,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  color: serviceMonth == '1 Month'
                                      ? const Color.fromRGBO(31, 68, 141, 1)
                                      : const Color.fromRGBO(255, 255, 255, 1)),
                              child: Text('1 Month',
                                  style: GoogleFonts.montserrat(
                                      fontWeight: FontWeight.w500,
                                      color: serviceMonth == '1 Month'
                                          ? const Color.fromRGBO(
                                              255, 255, 255, 1)
                                          : const Color.fromRGBO(
                                              135, 135, 135, 1),
                                      fontSize: 10.0)),
                            ),
                          ),
                          InkWell(
                            onTap: () {
                              setState(() {
                                serviceMonth = '3 months';
                              });
                            },
                            child: Container(
                              height: 27,
                              width: 101,
                              alignment: Alignment.center,
                              padding: const EdgeInsets.all(5),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  color: serviceMonth == '3 months'
                                      ? const Color.fromRGBO(31, 68, 141, 1)
                                      : const Color.fromRGBO(255, 255, 255, 1)),
                              child: Text('3 months',
                                  style: GoogleFonts.montserrat(
                                      fontWeight: FontWeight.w500,
                                      color: serviceMonth == '3 months'
                                          ? const Color.fromRGBO(
                                              255, 255, 255, 1)
                                          : const Color.fromRGBO(
                                              135, 135, 135, 1),
                                      fontSize: 10.0)),
                            ),
                          ),
                          InkWell(
                            onTap: () {
                              setState(() {
                                serviceMonth = '6 months';
                              });
                            },
                            child: Container(
                              height: 27,
                              width: 101,
                              padding: const EdgeInsets.all(5),
                              alignment: Alignment.center,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  color: serviceMonth == '6 months'
                                      ? const Color.fromRGBO(31, 68, 141, 1)
                                      : const Color.fromRGBO(255, 255, 255, 1)),
                              child: Text('6 months',
                                  style: GoogleFonts.montserrat(
                                      fontWeight: FontWeight.w500,
                                      color: serviceMonth == '6 months'
                                          ? const Color.fromRGBO(
                                              255, 255, 255, 1)
                                          : const Color.fromRGBO(
                                              135, 135, 135, 1),
                                      fontSize: 10.0)),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 5),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          InkWell(
                            onTap: () {
                              setState(() {
                                serviceMonth = '9 months';
                              });
                            },
                            child: Container(
                              height: 27,
                              width: 101,
                              alignment: Alignment.center,
                              padding: const EdgeInsets.all(5),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  color: serviceMonth == '9 months'
                                      ? const Color.fromRGBO(31, 68, 141, 1)
                                      : const Color.fromRGBO(255, 255, 255, 1)),
                              child: Text('9 months',
                                  style: GoogleFonts.montserrat(
                                      fontWeight: FontWeight.w500,
                                      color: serviceMonth == '9 months'
                                          ? const Color.fromRGBO(
                                              255, 255, 255, 1)
                                          : const Color.fromRGBO(
                                              135, 135, 135, 1),
                                      fontSize: 10.0)),
                            ),
                          ),
                          InkWell(
                            onTap: () {
                              setState(() {
                                serviceMonth = '1 Year';
                              });
                            },
                            child: Container(
                              height: 27,
                              width: 101,
                              padding: const EdgeInsets.all(5),
                              alignment: Alignment.center,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  color: serviceMonth == '1 Year'
                                      ? const Color.fromRGBO(31, 68, 141, 1)
                                      : const Color.fromRGBO(255, 255, 255, 1)),
                              child: Text('1 Year',
                                  style: GoogleFonts.montserrat(
                                      fontWeight: FontWeight.w500,
                                      color: serviceMonth == '1 Year'
                                          ? const Color.fromRGBO(
                                              255, 255, 255, 1)
                                          : const Color.fromRGBO(
                                              135, 135, 135, 1),
                                      fontSize: 10.0)),
                            ),
                          ),
                          InkWell(
                            onTap: () {
                              setState(() {
                                serviceMonth = '2 Years';
                              });
                            },
                            child: Container(
                              height: 27,
                              width: 101,
                              padding: const EdgeInsets.all(5),
                              alignment: Alignment.center,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  color: serviceMonth == '2 Years'
                                      ? const Color.fromRGBO(31, 68, 141, 1)
                                      : const Color.fromRGBO(255, 255, 255, 1)),
                              child: Text('2 Years',
                                  style: GoogleFonts.montserrat(
                                      fontWeight: FontWeight.w500,
                                      color: serviceMonth == '2 Years'
                                          ? const Color.fromRGBO(
                                              255, 255, 255, 1)
                                          : const Color.fromRGBO(
                                              135, 135, 135, 1),
                                      fontSize: 10.0)),
                            ),
                          ),
                        ],
                      )
                    ]),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 10.0, right: 10),
                  child: Container(
                    height: 250,
                    color: Colors.white,
                    width: MediaQuery.of(context).size.width,
                    child: SfDateRangePicker(
                      initialSelectedDate: DateTime.now(),
                      selectionMode: DateRangePickerSelectionMode.single,
                      onSelectionChanged: _onSelectionChanged,
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
              height: 60,
              padding: const EdgeInsets.all(15),
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
                    height: 36,
                    decoration: BoxDecoration(
                      color: const Color.fromRGBO(31, 68, 141, 1),
                      borderRadius: BorderRadius.circular(25),
                    ),
                    child: TextButton(
                        onPressed: () {},
                        child: Text('Pay',
                            style: GoogleFonts.montserrat(
                                fontWeight: FontWeight.w500,
                                color: const Color.fromRGBO(255, 255, 255, 1),
                                fontSize: 17.0))),
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
    /// The argument value will return the changed date as [DateTime] when the
    /// widget [SfDateRangeSelectionMode] set as single.
    ///
    /// The argument value will return the changed dates as [List<DateTime>]
    /// when the widget [SfDateRangeSelectionMode] set as multiple.
    ///
    /// The argument value will return the changed range as [PickerDateRange]
    /// when the widget [SfDateRangeSelectionMode] set as range.
    ///
    /// The argument value will return the changed ranges as
    /// [List<PickerDateRange] when the widget [SfDateRangeSelectionMode] set as
    /// multi range.
    setState(() {
      if (args.value is PickerDateRange) {
      } else if (args.value is DateTime) {
        selectedDate = args.value.toString();
        print(selectedDate);
      } else if (args.value is List<DateTime>) {
      } else {}
    });
  }
}
