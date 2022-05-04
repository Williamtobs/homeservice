import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AddressTile extends StatelessWidget {
  final String num;
  final String address;
  final String? amount;
  final String? date;
  final String? serviceType;
  const AddressTile(
      {Key? key,
      required this.num,
      required this.address,
      this.amount,
      this.date,
      this.serviceType})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text('Address $num',
          style: GoogleFonts.montserrat(
              fontWeight: FontWeight.w500,
              color: const Color.fromRGBO(0, 0, 0, 1),
              fontSize: 14.0)),
      subtitle: Text(address,
          style: GoogleFonts.montserrat(
              fontWeight: FontWeight.w500,
              color: const Color.fromRGBO(0, 0, 0, 1),
              fontSize: 14.0)),
      trailing: IconButton(onPressed: () {}, icon: const Icon(Icons.more_vert)),
    );
  }
}
