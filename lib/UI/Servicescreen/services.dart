import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:homeservice/UI/Shared/app_bar.dart';
import 'package:intl/intl.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';

import '../../Constants/time.dart';
import '../ReviewService/finalize_services.dart';

class BookService extends StatefulWidget {
  final String name;
  const BookService({Key? key, required this.name}) : super(key: key);

  @override
  State<BookService> createState() => _BookServiceState();
}

class _BookServiceState extends State<BookService> {
  int basketNum = 0;
  int otherNum = 0;

  int price = 0;
  String time = '';
  String selectedDate = '';

  void basketPriceChange(String val) {
    if (val == 'add') {
      setState(() {
        price += 10000;
      });
    } else {
      setState(() {
        price -= 10000;
      });
    }
  }

  void otherPriceChange(String val) {
    if (val == 'add') {
      setState(() {
        price += 1000;
      });
    } else {
      setState(() {
        price -= 1000;
      });
    }
  }

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
                Padding(
                  padding:
                      const EdgeInsets.only(left: 10.0, right: 10.0, top: 10.0),
                  child: Container(
                    //height: 120,
                    padding: const EdgeInsets.all(20),
                    width: MediaQuery.of(context).size.width,
                    decoration: const BoxDecoration(
                        color: Color.fromRGBO(255, 255, 255, 1),
                        borderRadius: BorderRadius.all(Radius.circular(30))),
                    child: Row(children: [
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Cloth Basket - 10,000',
                              style: GoogleFonts.montserrat(
                                  fontWeight: FontWeight.w500,
                                  color: const Color.fromRGBO(31, 68, 141, 1),
                                  fontSize: 16.0)),
                          const SizedBox(
                            height: 5,
                          ),
                          SizedBox(
                              width: MediaQuery.of(context).size.width * 0.60,
                              child: RichText(
                                text: TextSpan(
                                    text:
                                        '(Cloth must not be more than 30 pieces per bag. Wash, '
                                        'starch and Iron.)\n',
                                    style: GoogleFonts.montserrat(
                                        fontWeight: FontWeight.w400,
                                        color: const Color.fromRGBO(0, 0, 0, 1),
                                        fontSize: 12.0),
                                    children: [
                                      TextSpan(
                                          text:
                                              'Clothing includes shirt, blouse, '
                                              'trouser, skirt, underwear and all light weight materials only',
                                          style: GoogleFonts.montserrat(
                                              fontWeight: FontWeight.w500,
                                              color: const Color.fromRGBO(
                                                  0, 0, 0, 1),
                                              fontSize: 12.0))
                                    ]),
                              ))
                        ],
                      ),
                      const Spacer(),
                      GestureDetector(
                        onTap: () {
                          if (basketNum <= 0) {
                            return;
                          }
                          setState(() {
                            basketNum--;
                            basketPriceChange('decrease');
                          });
                        },
                        child: Container(
                          height: 20,
                          width: 20,
                          color: const Color.fromRGBO(255, 243, 243, 1),
                          child: const Icon(Icons.remove_outlined,
                              size: 15, color: Color.fromRGBO(255, 0, 46, 1)),
                        ),
                      ),
                      const SizedBox(
                        width: 5,
                      ),
                      Text(basketNum.toString(),
                          style: GoogleFonts.montserrat(
                              fontWeight: FontWeight.w700,
                              color: const Color.fromRGBO(0, 0, 0, 1),
                              fontSize: 21.0)),
                      const SizedBox(
                        width: 5,
                      ),
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            basketNum++;
                            basketPriceChange('add');
                          });
                        },
                        child: Container(
                          height: 20,
                          width: 20,
                          color: const Color.fromRGBO(219, 247, 212, 1),
                          child: const Icon(Icons.add_outlined,
                              size: 15, color: Color.fromRGBO(0, 151, 42, 1)),
                        ),
                      )
                    ]),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(
                    left: 10.0,
                    right: 10.0,
                  ),
                  child: Container(
                    //height: 120,
                    padding: const EdgeInsets.all(20),
                    width: MediaQuery.of(context).size.width,
                    decoration: const BoxDecoration(
                        color: Color.fromRGBO(255, 255, 255, 1),
                        borderRadius: BorderRadius.all(Radius.circular(30))),
                    child: Row(children: [
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Other - 1,000',
                              style: GoogleFonts.montserrat(
                                  fontWeight: FontWeight.w500,
                                  color: const Color.fromRGBO(31, 68, 141, 1),
                                  fontSize: 16.0)),
                          const SizedBox(
                            height: 5,
                          ),
                          SizedBox(
                              width: MediaQuery.of(context).size.width * 0.60,
                              child: RichText(
                                text: TextSpan(
                                    text:
                                        '(Each of this or any other heavy weight material costs 1,000 naira each.)\n',
                                    style: GoogleFonts.montserrat(
                                        fontWeight: FontWeight.w400,
                                        color: const Color.fromRGBO(0, 0, 0, 1),
                                        fontSize: 12.0),
                                    children: [
                                      TextSpan(
                                          text:
                                              'Agbada, Suit, Towel, Duvet or Bedsheets',
                                          style: GoogleFonts.montserrat(
                                              fontWeight: FontWeight.w500,
                                              color: const Color.fromRGBO(
                                                  0, 0, 0, 1),
                                              fontSize: 12.0))
                                    ]),
                              ))
                        ],
                      ),
                      const Spacer(),
                      GestureDetector(
                        onTap: () {
                          if (otherNum <= 0) {
                            return;
                          }
                          setState(() {
                            otherNum--;
                            otherPriceChange('decrease');
                          });
                        },
                        child: Container(
                          height: 20,
                          width: 20,
                          color: const Color.fromRGBO(255, 243, 243, 1),
                          child: const Icon(Icons.remove_outlined,
                              size: 15, color: Color.fromRGBO(255, 0, 46, 1)),
                        ),
                      ),
                      const SizedBox(
                        width: 5,
                      ),
                      Text(otherNum.toString(),
                          style: GoogleFonts.montserrat(
                              fontWeight: FontWeight.w700,
                              color: const Color.fromRGBO(0, 0, 0, 1),
                              fontSize: 21.0)),
                      const SizedBox(
                        width: 5,
                      ),
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            otherNum++;
                            otherPriceChange('add');
                          });
                        },
                        child: Container(
                          height: 20,
                          width: 20,
                          color: const Color.fromRGBO(219, 247, 212, 1),
                          child: const Icon(Icons.add_outlined,
                              size: 15, color: Color.fromRGBO(0, 151, 42, 1)),
                        ),
                      )
                    ]),
                  ),
                ),
                const SizedBox(height: 10),
                Padding(
                  padding: const EdgeInsets.only(left: 10.0),
                  child: Text('Pick-up Date',
                      style: GoogleFonts.montserrat(
                          fontWeight: FontWeight.w500,
                          color: const Color.fromRGBO(0, 0, 0, 1),
                          fontSize: 16.0)),
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
                      //initialSelectedDate: DateTime.now(),
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
                  child: Text('Pick-up Time',
                      style: GoogleFonts.montserrat(
                          fontWeight: FontWeight.w500,
                          color: const Color.fromRGBO(0, 0, 0, 1),
                          fontSize: 16.0)),
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
                                          : const Color.fromRGBO(0, 0, 0, 1),
                                      fontSize: 12.0)),
                            ),
                          );
                        },
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 60)
              ],
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              //height: 55,
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
                  Text('$price',
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
                                        services:
                                            '$basketNum Cloth(es) Basket\n $otherNum Others',
                                        address: 'UI, Ibadan',
                                        number: '08146859553',
                                        amount: '$price',
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
