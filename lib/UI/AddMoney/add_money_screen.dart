import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_paystack/flutter_paystack.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:homeservice/Service/api_service.dart';

import '../../Constants/validators.dart';
import '../../Providers/auth_providers.dart';
import '../../Service/api_base_helper.dart';

class AddMoneyScreen extends ConsumerStatefulWidget {
  // final String? email;
  const AddMoneyScreen({
    Key? key,
    //required this.email,
  }) : super(key: key);

  @override
  _AddMoneyScreenState createState() => _AddMoneyScreenState();
}

class _AddMoneyScreenState extends ConsumerState<AddMoneyScreen> {
  final TextEditingController _amountController = TextEditingController();

  final FirebaseAuth auth = FirebaseAuth.instance;

  String? email;
  String? previousBalance;
  final plugin = PaystackPlugin();

  @override
  void initState() {
    _getReference();
    plugin.initialize(publicKey: ApiBase.paystackPublicKey);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final _auth = ref.watch(authenticationProvider);
    final data = ref.watch(fireBaseAuthProvider);
    final doc = FirebaseFirestore.instance
        .collection('Users')
        .doc(data.currentUser!.uid)
        .get()
        .then((value) {
      email = value.data()!['email'];
      previousBalance = value.data()!['wallet_amount'];
    });

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
              child: GestureDetector(
                onTap: () {
                  _payWithPaystackCard();
                },
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
              child: GestureDetector(
                onTap: () {
                  _payWithPaystackBank();
                },
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
              ),
            )
          ],
        ),
      ),
    );
  }

  String _getReference() {
    final thisDate = DateTime.now().millisecondsSinceEpoch;
    return 'Charged From_$thisDate';
  }

  void _showMessage(String message) {
    final snackBar = SnackBar(content: Text(message));
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

  _payWithPaystackCard() async {
    var charge = Charge()
      ..amount = int.parse(_amountController.text) * 100
      ..reference = _getReference()
      ..putCustomField('Charged From', 'Home Service')
      //..subAccount
      ..email = email!;
    CheckoutResponse response = await plugin.checkout(
      context,
      method: CheckoutMethod.card,
      charge: charge,
    );
    if (response.status == true) {
      final User user = auth.currentUser!;
      FirebaseFirestore.instance.collection('Users').doc(user.uid).update({
        'wallet_amount':
            '${int.parse(previousBalance!) + int.parse(_amountController.text)}'
      });
      _showMessage('Payment was successful!!!');
    } else {
      _showMessage('Payment Failed!!!');
    }
  }

  _payWithPaystackBank() async {
    var accessCode = await ApiService()
        .initializeTransaction(email!, _amountController.text);
    var charge = Charge()
      ..amount = int.parse(_amountController.text) * 100
      ..reference = _getReference()
      ..accessCode = accessCode
      ..email = email!;
    CheckoutResponse response = await plugin.checkout(
      context,
      method: CheckoutMethod.bank,
      charge: charge,
    );
    if (response.status == true) {
      final User user = auth.currentUser!;
      FirebaseFirestore.instance.collection('Users').doc(user.uid).update({
        'wallet_amount':
            '${int.parse(previousBalance!) + int.parse(_amountController.text)}'
      });
      _showMessage('Payment was successful!!!');
    } else {
      _showMessage('Payment Failed!!!');
    }
  }
}
