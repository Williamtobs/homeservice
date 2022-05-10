import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';

import '../../Providers/services_data_provider.dart';
import '../Shared/app_bar.dart';
import '../Shared/images.dart';
import 'controller/train_ticket_controller.dart';
import 'receipt_screen.dart';

class TrainTicket extends StatefulWidget {
  final String name;
  final String ticketName;
  const TrainTicket({Key? key, required this.name, required this.ticketName})
      : super(key: key);

  @override
  State<TrainTicket> createState() => _TrainTicketState();
}

class _TrainTicketState extends State<TrainTicket> {
  String trainfees = '0';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(250, 250, 250, 1),
      appBar: PreferredSize(
          preferredSize: Size.fromHeight(AppBar().preferredSize.height),
          child: Appbar(
            notification: widget.name,
          )),
      body: Consumer(builder: (
        context,
        watch,
        child,
      ) {
        final controller = watch.watch(trainTicketNotifier);
        final data = watch.watch(trainTicketProvider);
        return data.when(
          data: (ticket) {
            controller.economyAmount = ticket!['economy_class'];
            controller.businessAmount = ticket['business_class'];
            controller.upperBusiness = ticket['upper_business_class'];
            controller.vip = ticket['vip'];
            controller.times = ticket['other_days'];
            controller.saturdayTime = ticket['saturday_time'];
            controller.fridayTime = ticket['friday_onboard_time'];
            controller.lagosStation = ticket['lagos_station'];
            controller.ibadanStation = ticket['ibadan_station'];
            return Stack(
              children: [
                SizedBox(
                  height: MediaQuery.of(context).size.height,
                  width: MediaQuery.of(context).size.width,
                  child: SingleChildScrollView(
                    physics: const AlwaysScrollableScrollPhysics(),
                    child: Column(
                      children: [
                        const SizedBox(
                          height: 5,
                        ),
                        Padding(
                          padding:
                              const EdgeInsets.only(left: 10.0, right: 10.0),
                          child: Container(
                            decoration: BoxDecoration(
                                color: const Color.fromRGBO(255, 255, 255, 1),
                                borderRadius: BorderRadius.circular(35)),
                            child: Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    children: [
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text('Economy class',
                                              style: GoogleFonts.montserrat(
                                                  fontWeight: FontWeight.w500,
                                                  color: const Color.fromRGBO(
                                                      0, 0, 0, 1),
                                                  fontSize: 14.0)),
                                          const SizedBox(
                                            height: 3,
                                          ),
                                          Text('${controller.economyAmount!}',
                                              style: GoogleFonts.montserrat(
                                                  fontWeight: FontWeight.w500,
                                                  color: const Color.fromRGBO(
                                                      244, 18, 0, 1),
                                                  fontSize: 14.0))
                                        ],
                                      ),
                                      const Spacer(),
                                      controller.ticketType != 'Economy class'
                                          ? Container(
                                              width: 66,
                                              height: 30,
                                              decoration: BoxDecoration(
                                                  color: const Color.fromRGBO(
                                                      31, 68, 141, 1),
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          12)),
                                              child: TextButton(
                                                  onPressed: () {
                                                    controller.economyChecked(
                                                        'Economy class',
                                                        "${controller.economyAmount!}");
                                                  },
                                                  child: Text('Select',
                                                      style: GoogleFonts
                                                          .montserrat(
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w500,
                                                              color: const Color
                                                                      .fromRGBO(
                                                                  255,
                                                                  255,
                                                                  255,
                                                                  1),
                                                              fontSize: 11.0))),
                                            )
                                          : Image.asset(
                                              check,
                                              width: 35,
                                              height: 35,
                                            ),
                                    ],
                                  ),
                                  const SizedBox(
                                    height: 5,
                                  ),
                                  const Divider(
                                      color: Color.fromRGBO(200, 200, 200, 1)),
                                  const SizedBox(
                                    height: 5,
                                  ),
                                  Row(
                                    children: [
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text('Business class',
                                              style: GoogleFonts.montserrat(
                                                  fontWeight: FontWeight.w500,
                                                  color: const Color.fromRGBO(
                                                      0, 0, 0, 1),
                                                  fontSize: 14.0)),
                                          const SizedBox(
                                            height: 3,
                                          ),
                                          Text('${controller.businessAmount!}',
                                              style: GoogleFonts.montserrat(
                                                  fontWeight: FontWeight.w500,
                                                  color: const Color.fromRGBO(
                                                      244, 18, 0, 1),
                                                  fontSize: 14.0))
                                        ],
                                      ),
                                      const Spacer(),
                                      controller.ticketType != 'Business class'
                                          ? Container(
                                              width: 66,
                                              height: 30,
                                              decoration: BoxDecoration(
                                                  color: const Color.fromRGBO(
                                                      31, 68, 141, 1),
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          12)),
                                              child: TextButton(
                                                  onPressed: () {
                                                    controller.economyChecked(
                                                        'Business class',
                                                        '${controller.businessAmount!}');
                                                  },
                                                  child: Text('Select',
                                                      style: GoogleFonts
                                                          .montserrat(
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w500,
                                                              color: const Color
                                                                      .fromRGBO(
                                                                  255,
                                                                  255,
                                                                  255,
                                                                  1),
                                                              fontSize: 11.0))),
                                            )
                                          : Image.asset(
                                              check,
                                              width: 35,
                                              height: 35,
                                            ),
                                    ],
                                  ),
                                  const SizedBox(
                                    height: 5,
                                  ),
                                  const Divider(
                                      color: Color.fromRGBO(200, 200, 200, 1)),
                                  const SizedBox(
                                    height: 5,
                                  ),
                                  Row(
                                    children: [
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text('Upper Business class',
                                              style: GoogleFonts.montserrat(
                                                  fontWeight: FontWeight.w500,
                                                  color: const Color.fromRGBO(
                                                      0, 0, 0, 1),
                                                  fontSize: 14.0)),
                                          const SizedBox(
                                            height: 3,
                                          ),
                                          Text('${controller.upperBusiness!}',
                                              style: GoogleFonts.montserrat(
                                                  fontWeight: FontWeight.w500,
                                                  color: const Color.fromRGBO(
                                                      244, 18, 0, 1),
                                                  fontSize: 14.0))
                                        ],
                                      ),
                                      const Spacer(),
                                      controller.ticketType !=
                                              'Upper Business class'
                                          ? Container(
                                              width: 66,
                                              height: 30,
                                              decoration: BoxDecoration(
                                                  color: const Color.fromRGBO(
                                                      31, 68, 141, 1),
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          12)),
                                              child: TextButton(
                                                  onPressed: () {
                                                    controller.economyChecked(
                                                        'Upper Business class',
                                                        '${controller.upperBusiness!}');
                                                  },
                                                  child: Text('Select',
                                                      style: GoogleFonts
                                                          .montserrat(
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w500,
                                                              color: const Color
                                                                      .fromRGBO(
                                                                  255,
                                                                  255,
                                                                  255,
                                                                  1),
                                                              fontSize: 11.0))),
                                            )
                                          : Image.asset(
                                              check,
                                              width: 35,
                                              height: 35,
                                            ),
                                    ],
                                  ),
                                  const SizedBox(
                                    height: 5,
                                  ),
                                  const Divider(
                                      color: Color.fromRGBO(200, 200, 200, 1)),
                                  const SizedBox(
                                    height: 5,
                                  ),
                                  Row(
                                    children: [
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text('VIP',
                                              style: GoogleFonts.montserrat(
                                                  fontWeight: FontWeight.w500,
                                                  color: const Color.fromRGBO(
                                                      0, 0, 0, 1),
                                                  fontSize: 14.0)),
                                          const SizedBox(
                                            height: 3,
                                          ),
                                          Text('${controller.vip!}',
                                              style: GoogleFonts.montserrat(
                                                  fontWeight: FontWeight.w500,
                                                  color: const Color.fromRGBO(
                                                      244, 18, 0, 1),
                                                  fontSize: 14.0))
                                        ],
                                      ),
                                      const Spacer(),
                                      controller.ticketType != 'VIP'
                                          ? Container(
                                              width: 66,
                                              height: 30,
                                              decoration: BoxDecoration(
                                                  color: const Color.fromRGBO(
                                                      31, 68, 141, 1),
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          12)),
                                              child: TextButton(
                                                  onPressed: () {
                                                    controller.economyChecked(
                                                        'VIP',
                                                        '${controller.vip!}');
                                                  },
                                                  child: Text('Select',
                                                      style: GoogleFonts
                                                          .montserrat(
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w500,
                                                              color: const Color
                                                                      .fromRGBO(
                                                                  255,
                                                                  255,
                                                                  255,
                                                                  1),
                                                              fontSize: 11.0))),
                                            )
                                          : Image.asset(
                                              check,
                                              width: 35,
                                              height: 35,
                                            ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Text('Select Train Station',
                            style: GoogleFonts.montserrat(
                                fontWeight: FontWeight.w600,
                                color: Colors.black,
                                fontSize: 16.0)),
                        const SizedBox(
                          height: 5,
                        ),
                        SizedBox(
                          height: 50,
                          width: MediaQuery.of(context).size.width,
                          child: Padding(
                            padding: const EdgeInsets.only(
                              left: 8.0,
                            ),
                            child: widget.name == 'Lagos'
                                ? ListView.builder(
                                    itemCount: controller.lagosStation!.length,
                                    shrinkWrap: true,
                                    scrollDirection: Axis.horizontal,
                                    physics: const BouncingScrollPhysics(),
                                    itemBuilder:
                                        (BuildContext context, int index) {
                                      return Padding(
                                        padding:
                                            const EdgeInsets.only(right: 5.0),
                                        child: GestureDetector(
                                          onTap: () {
                                            controller.selectedStation(
                                                controller
                                                    .lagosStation![index]);
                                          },
                                          child: Container(
                                            width: 250,
                                            alignment: Alignment.center,
                                            decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(15),
                                              color: controller.trainStation ==
                                                      controller
                                                          .lagosStation![index]
                                                  ? const Color.fromRGBO(
                                                      31, 68, 141, 1)
                                                  : Colors.white,
                                            ),
                                            child: Text(
                                                ticket['lagos_station'][index],
                                                textAlign: TextAlign.center,
                                                style: GoogleFonts.montserrat(
                                                    fontWeight: FontWeight.w500,
                                                    color: controller
                                                                .trainStation ==
                                                            controller
                                                                    .lagosStation![
                                                                index]
                                                        ? Colors.white
                                                        : const Color.fromRGBO(
                                                            0, 0, 0, 1),
                                                    fontSize: 12.0)),
                                          ),
                                        ),
                                      );
                                    },
                                  )
                                : ListView.builder(
                                    itemCount: controller.ibadanStation!.length,
                                    shrinkWrap: true,
                                    scrollDirection: Axis.horizontal,
                                    physics: const BouncingScrollPhysics(),
                                    itemBuilder:
                                        (BuildContext context, int index) {
                                      return GestureDetector(
                                        onTap: () {
                                          controller.selectedStation(
                                              controller.ibadanStation![index]);
                                        },
                                        child: Container(
                                          width: 250,
                                          alignment: Alignment.center,
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(15),
                                            color: controller.trainStation ==
                                                    controller
                                                        .ibadanStation![index]
                                                ? const Color.fromRGBO(
                                                    31, 68, 141, 1)
                                                : Colors.white,
                                          ),
                                          child: Text(
                                              controller.ibadanStation![index],
                                              textAlign: TextAlign.center,
                                              style: GoogleFonts.montserrat(
                                                  fontWeight: FontWeight.w500,
                                                  color: controller
                                                              .trainStation ==
                                                          controller
                                                                  .ibadanStation![
                                                              index]
                                                      ? Colors.white
                                                      : const Color.fromRGBO(
                                                          0, 0, 0, 1),
                                                  fontSize: 12.0)),
                                        ),
                                      );
                                    },
                                  ),
                          ),
                        ),
                        const SizedBox(height: 20),
                        Padding(
                          padding: const EdgeInsets.only(left: 10.0, right: 10),
                          child: Container(
                            height: 200,
                            width: MediaQuery.of(context).size.width,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(25),
                              color: Colors.white,
                            ),
                            child: SfDateRangePicker(
                              enablePastDates: false,
                              minDate:
                                  DateTime.now().add(const Duration(days: 1)),
                              selectionMode:
                                  DateRangePickerSelectionMode.single,
                              onSelectionChanged: controller.onSelectionChanged,
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Text('Time',
                            style: GoogleFonts.montserrat(
                                fontWeight: FontWeight.w600,
                                color: Colors.black,
                                fontSize: 16.0)),
                        const SizedBox(
                          height: 5,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 10.0),
                          child: SizedBox(
                            height: 30,
                            width: MediaQuery.of(context).size.width,
                            child: Center(
                              child: controller.day == 'Friday'
                                  ? ListView.builder(
                                      itemCount: controller.fridayTime!.length,
                                      shrinkWrap: true,
                                      scrollDirection: Axis.horizontal,
                                      physics: const BouncingScrollPhysics(),
                                      itemBuilder:
                                          (BuildContext context, int index) {
                                        return GestureDetector(
                                          onTap: () {
                                            controller.selectTime(
                                                controller.fridayTime![index]);
                                            print(
                                                controller.fridayTime![index]);
                                          },
                                          child: Container(
                                            width: 80,
                                            height: 30,
                                            alignment: Alignment.center,
                                            decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(30),
                                              color: controller.time ==
                                                      controller
                                                          .fridayTime![index]
                                                  ? const Color.fromRGBO(
                                                      31, 68, 141, 1)
                                                  : Colors.white,
                                            ),
                                            child: Text(
                                                controller.fridayTime![index],
                                                style: GoogleFonts.montserrat(
                                                    fontWeight: FontWeight.w500,
                                                    color: controller.time ==
                                                            controller
                                                                    .fridayTime![
                                                                index]
                                                        ? Colors.white
                                                        : const Color.fromRGBO(
                                                            0, 0, 0, 1),
                                                    fontSize: 12.0)),
                                          ),
                                        );
                                      },
                                    )
                                  : controller.day == 'Saturday'
                                      ? ListView.builder(
                                          itemCount:
                                              controller.saturdayTime!.length,
                                          shrinkWrap: true,
                                          scrollDirection: Axis.horizontal,
                                          physics:
                                              const BouncingScrollPhysics(),
                                          itemBuilder: (BuildContext context,
                                              int index) {
                                            return GestureDetector(
                                              onTap: () {
                                                controller.selectTime(controller
                                                    .saturdayTime![index]);
                                                print(controller
                                                    .saturdayTime![index]);
                                              },
                                              child: Container(
                                                width: 80,
                                                height: 30,
                                                alignment: Alignment.center,
                                                decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.circular(30),
                                                  color: controller.time ==
                                                          controller
                                                                  .saturdayTime![
                                                              index]
                                                      ? const Color.fromRGBO(
                                                          31, 68, 141, 1)
                                                      : Colors.white,
                                                ),
                                                child: Text(
                                                    controller
                                                        .saturdayTime![index],
                                                    style: GoogleFonts.montserrat(
                                                        fontWeight:
                                                            FontWeight.w500,
                                                        color: controller
                                                                    .time ==
                                                                controller
                                                                        .saturdayTime![
                                                                    index]
                                                            ? Colors.white
                                                            : const Color
                                                                    .fromRGBO(
                                                                0, 0, 0, 1),
                                                        fontSize: 12.0)),
                                              ),
                                            );
                                          },
                                        )
                                      : ListView.builder(
                                          itemCount: controller.times!.length,
                                          shrinkWrap: true,
                                          scrollDirection: Axis.horizontal,
                                          physics:
                                              const BouncingScrollPhysics(),
                                          itemBuilder: (BuildContext context,
                                              int index) {
                                            return GestureDetector(
                                              onTap: () {
                                                controller.selectTime(
                                                    controller.times![index]);
                                                print(controller.times![index]);
                                              },
                                              child: Container(
                                                width: 80,
                                                height: 30,
                                                alignment: Alignment.center,
                                                decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.circular(30),
                                                  color: controller.time ==
                                                          controller
                                                              .times![index]
                                                      ? const Color.fromRGBO(
                                                          31, 68, 141, 1)
                                                      : Colors.white,
                                                ),
                                                child: Text(
                                                    controller.times![index],
                                                    style: GoogleFonts.montserrat(
                                                        fontWeight:
                                                            FontWeight.w500,
                                                        color: controller
                                                                    .time ==
                                                                controller
                                                                        .times![
                                                                    index]
                                                            ? Colors.white
                                                            : const Color
                                                                    .fromRGBO(
                                                                0, 0, 0, 1),
                                                        fontSize: 12.0)),
                                              ),
                                            );
                                          },
                                        ),
                            ),
                          ),
                        ),
                        const SizedBox(height: 80)
                      ],
                    ),
                  ),
                ),
                Align(
                  alignment: Alignment.bottomCenter,
                  child: Container(
                    //height: 70,
                    padding: const EdgeInsets.only(
                        left: 15, right: 15, top: 8, bottom: 8),
                    width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        border: Border.all(
                            width: 1,
                            color: const Color.fromRGBO(0, 0, 0, 0.25)),
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
                        Text(controller.ticketFees,
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
                                if (controller.time.length > 2) {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              TrainBookedSummary(
                                                services: widget.ticketName,
                                                type: controller.ticketType,
                                                //type: '08146859553',
                                                station:
                                                    controller.trainStation,
                                                amount: controller.ticketFees,
                                                date:
                                                    '${controller.selectedDate.characters.take(10)}' +
                                                        " " +
                                                        controller.time,
                                                serviceType: widget.name,
                                              )));
                                } else {
                                  final snackBar = SnackBar(
                                      backgroundColor:
                                          const Color.fromRGBO(31, 68, 141, 1),
                                      content: Text(
                                          'Select time to board train',
                                          style: GoogleFonts.montserrat(
                                              fontWeight: FontWeight.w600,
                                              color: Colors.white,
                                              fontSize: 18.0)));
                                  ScaffoldMessenger.of(context)
                                      .showSnackBar(snackBar);
                                }
                              },
                              child: Text('Pay',
                                  style: GoogleFonts.montserrat(
                                      fontWeight: FontWeight.w500,
                                      color: const Color.fromRGBO(
                                          255, 255, 255, 1),
                                      fontSize: 12.0))),
                        ),
                      ],
                    ),
                  ),
                )
              ],
            );
          },
          error: (e, s) {
            if (kDebugMode) {
              print('Error');
            }
            return const Center(
                child: Text('Can not fetch data - check internet connection'));
          },
          loading: () {
            if (kDebugMode) {
              print('loading');
            }
            return const Center(child: CircularProgressIndicator());
          },
        );
      }),
    );
  }
}
