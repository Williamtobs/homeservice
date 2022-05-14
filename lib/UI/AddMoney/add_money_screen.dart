import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../Constants/validators.dart';
import '../Profile/widgets/other_text_field.dart';

class AddMoneyScreen extends StatelessWidget {
  AddMoneyScreen({Key? key}) : super(key: key);

  final TextEditingController _amountController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back_ios_new_outlined,
            color: Colors.black,
          ),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        centerTitle: true,
        title: Text('Add Money',
            style: GoogleFonts.montserrat(
                fontWeight: FontWeight.w600,
                fontStyle: FontStyle.normal,
                color: const Color.fromRGBO(0, 0, 0, 1),
                fontSize: 18.0)),
      ),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              height: 20,
            ),
            Center(
              child: Text('Amount',
                  style: GoogleFonts.montserrat(
                      fontWeight: FontWeight.w600,
                      fontStyle: FontStyle.normal,
                      color: const Color.fromRGBO(0, 0, 0, 1),
                      fontSize: 15.0)),
            ),
            const SizedBox(
              height: 20,
            ),
            SizedBox(
                width: MediaQuery.of(context).size.width,
                height: 60,
                child: TextField(
                  controller: _amountController,
                  keyboardType: TextInputType.number,
                  textAlign: TextAlign.center,
                  decoration: const InputDecoration(
                    isDense: true,
                    filled: true,
                    fillColor: Colors.white,
                    enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(
                        color: Color.fromRGBO(0, 0, 0, 0.5),
                      ),
                    ),
                    focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(
                        color: Color.fromRGBO(0, 0, 0, 0.5),
                      ),
                    ),
                  ),
                )),
            const SizedBox(
              height: 10,
            ),
            Text('Select method to add money',
                style: GoogleFonts.montserrat(
                    fontWeight: FontWeight.w500,
                    fontStyle: FontStyle.normal,
                    color: const Color.fromRGBO(0, 0, 0, 1),
                    fontSize: 13.0)),
            const SizedBox(
              height: 10,
            ),
            SizedBox(
              height: 67,
              width: MediaQuery.of(context).size.width,
              child: Card(
                elevation: 1,
                child: ListTile(
                  leading: const Icon(
                    Icons.credit_card,
                    color: Color.fromRGBO(31, 68, 141, 1),
                  ),
                  title: Text('Credit/Debit Card',
                      style: GoogleFonts.montserrat(
                          fontWeight: FontWeight.w600,
                          fontStyle: FontStyle.normal,
                          color: const Color.fromRGBO(0, 0, 0, 1),
                          fontSize: 17.0)),
                  trailing: const Icon(
                    Icons.arrow_forward_ios,
                    color: Color.fromRGBO(31, 68, 141, 1),
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            SizedBox(
              height: 67,
              width: MediaQuery.of(context).size.width,
              child: Card(
                elevation: 1,
                child: ListTile(
                  leading: const Icon(
                    Icons.paid,
                    color: Color.fromRGBO(31, 68, 141, 1),
                  ),
                  title: Text('Pay with USSD',
                      style: GoogleFonts.montserrat(
                          fontWeight: FontWeight.w600,
                          fontStyle: FontStyle.normal,
                          color: const Color.fromRGBO(0, 0, 0, 1),
                          fontSize: 17.0)),
                  trailing: const Icon(
                    Icons.arrow_forward_ios,
                    color: Color.fromRGBO(31, 68, 141, 1),
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            SizedBox(
              height: 67,
              width: MediaQuery.of(context).size.width,
              child: Card(
                elevation: 1,
                child: ListTile(
                  leading: const Icon(
                    Icons.payments,
                    color: Color.fromRGBO(31, 68, 141, 1),
                  ),
                  title: Text('Pay with Bank Transfer',
                      style: GoogleFonts.montserrat(
                          fontWeight: FontWeight.w600,
                          fontStyle: FontStyle.normal,
                          color: const Color.fromRGBO(0, 0, 0, 1),
                          fontSize: 17.0)),
                  trailing: const Icon(
                    Icons.arrow_forward_ios,
                    color: Color.fromRGBO(31, 68, 141, 1),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
