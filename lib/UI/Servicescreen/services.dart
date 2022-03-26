import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:homeservice/Constants/home_services.dart';
import 'package:homeservice/UI/Servicescreen/service_widget.dart';
import 'package:homeservice/UI/Shared/app_bar.dart';

class BookService extends StatefulWidget {
  final String name;
  const BookService({Key? key, required this.name}) : super(key: key);

  @override
  State<BookService> createState() => _BookServiceState();
}

class _BookServiceState extends State<BookService> {
  int amount = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(250, 250, 250, 1),
      appBar: PreferredSize(
          preferredSize: Size.fromHeight(AppBar().preferredSize.height),
          child: Appbar(
            notification: widget.name,
          )),
      body: Column(
        children: [
          SizedBox(height: 20),
          Padding(
            padding: const EdgeInsets.only(left: 20.0),
            child: SizedBox(
              height: 120,
              width: MediaQuery.of(context).size.width,
              child: ListView(
                padding: const EdgeInsets.all(10),
                physics: const BouncingScrollPhysics(),
                scrollDirection: Axis.horizontal,
                shrinkWrap: true,
                children: List.generate(
                    homeService.length,
                    (index) => InkWell(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => BookService(
                                          name: homeService[index].name!,
                                        )));
                          },
                          child: ServiceWidgets(
                            icon: homeService[index].icon,
                            name: homeService[index].name,
                            mainColor: homeService[index].name == widget.name
                                ? const Color.fromRGBO(31, 68, 141, 1)
                                : Colors.white,
                            subColor: homeService[index].name == widget.name
                                ? Colors.white
                                : const Color.fromRGBO(31, 68, 141, 1),
                            isSelected: homeService[index].name == widget.name
                                ? true
                                : false,
                            textColor: homeService[index].name == widget.name
                                ? Colors.white
                                : const Color.fromRGBO(0, 0, 0, 1),
                          ),
                        )),
              ),
            ),
          ),
          const SizedBox(height: 20),
          Padding(
            padding: const EdgeInsets.only(left: 20.0, right: 20.0),
            child: Container(
              height: 184,
              decoration: const BoxDecoration(
                  color: Color.fromRGBO(255, 255, 255, 1),
                  borderRadius: BorderRadius.all(Radius.circular(35))),
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 10),
                    Text(widget.name,
                        style: GoogleFonts.montserrat(
                            fontWeight: FontWeight.w600,
                            color: const Color.fromRGBO(0, 0, 0, 1),
                            fontSize: 23.0)),
                    const SizedBox(
                      height: 15,
                    ),
                    Text('Clothes',
                        style: GoogleFonts.montserrat(
                            fontWeight: FontWeight.w500,
                            color: const Color.fromRGBO(0, 0, 0, 1),
                            fontSize: 17.0)),
                    const SizedBox(
                      height: 10,
                    ),
                    Row(
                      children: [
                        Text('5,000.00',
                            style: GoogleFonts.montserrat(
                                fontWeight: FontWeight.w500,
                                color: const Color.fromRGBO(244, 18, 0, 1),
                                fontSize: 17.0)),
                        const Spacer(),
                        GestureDetector(
                          onTap: () {
                            if (amount <= 0) {
                              return;
                            }
                            setState(() {
                              amount--;
                            });
                          },
                          child: Container(
                            height: 28,
                            width: 28,
                            color: const Color.fromRGBO(255, 243, 243, 1),
                            child: const Icon(Icons.remove_outlined,
                                size: 15, color: Color.fromRGBO(255, 0, 46, 1)),
                          ),
                        ),
                        const SizedBox(
                          width: 5,
                        ),
                        Text(amount.toString(),
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
                              amount++;
                            });
                          },
                          child: Container(
                            height: 28,
                            width: 28,
                            color: const Color.fromRGBO(219, 247, 212, 1),
                            child: const Icon(Icons.add_outlined,
                                size: 15, color: Color.fromRGBO(0, 151, 42, 1)),
                          ),
                        )
                      ],
                    )
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
