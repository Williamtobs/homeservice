import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../ReviewService/finalize_services.dart';
import '../Shared/app_bar.dart';
import 'map_screen.dart';
import 'widgets/address_tile.dart';

class AddAddressScreen extends StatelessWidget {
  final String? newAddress;
  final String? amount;
  final String? date;
  final String? serviceType;
  const AddAddressScreen(
      {Key? key, this.newAddress, this.amount, this.date, this.serviceType})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //backgroundColor: const Color.fromRGBO(250, 250, 250, 1),
      appBar: PreferredSize(
          preferredSize: Size.fromHeight(AppBar().preferredSize.height + 5),
          child: const Appbar(
            notification: 'My Address',
          )),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          children: [
            GestureDetector(
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => const MapScreen()));
              },
              child: ListTile(
                leading: const Icon(
                  Icons.add_circle,
                  color: Color.fromRGBO(31, 68, 141, 1),
                ),
                title: Text('Add new address',
                    style: GoogleFonts.montserrat(
                        fontWeight: FontWeight.w500,
                        color: const Color.fromRGBO(0, 0, 0, 1),
                        fontSize: 16.0)),
              ),
            ),
            const SizedBox(height: 10),
            GestureDetector(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => FinalizeServices(
                            services: '',
                            address: '104, Aladelola Street Ikosi Ketu, Lagos',
                            number: '08146859553',
                            date: date!,
                            amount: amount!,
                            serviceType: serviceType!)));
              },
              child: AddressTile(
                address:
                    newAddress ?? '104, Aladelola Street Ikosi Ketu, Lagos',
                num: '1',
              ),
            )
          ],
        ),
      ),
    );
  }
}
