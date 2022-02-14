import 'package:flutter/cupertino.dart';
import 'package:google_fonts/google_fonts.dart';

class ServiceWidgets extends StatelessWidget{
  final String? icon;
  final String? name;
  const ServiceWidgets({Key? key, this.icon, this.name}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 93,
      height: 104,
      color: const Color.fromRGBO(255, 255, 255, 1),
      child: Column(
        mainAxisAlignment : MainAxisAlignment.center,
        children: [
          Container(
            height: 49,
            width: 49,
            alignment: Alignment.center,
            decoration: const BoxDecoration(
              color: Color.fromRGBO(31, 68, 141, 1),
              shape: BoxShape.circle,
            ),
            child: Image.asset(icon!, height: 32, width: 32,),
          ),
          Text(name!, style: GoogleFonts.montserrat(
              fontWeight: FontWeight.w600,
              color: const Color.fromRGBO(0, 0, 0, 1),
              fontSize: 11.0
          ))
        ],
      ),
    );
  }

}