import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:homeservice/Model/update_email.dart';
import 'package:homeservice/Model/update_phone.dart';
import 'package:homeservice/Model/user.dart';

import '../Model/update_delivery_address.dart';

class Database {
  final CollectionReference userCollection =
      FirebaseFirestore.instance.collection('Users');

  updatePhone(
      {required var uid,
      required String phone,
      required BuildContext context}) async {
    DocumentReference documentReferencer = userCollection.doc(uid);
    UpdatePhone updatePhone = UpdatePhone(phone: phone);
    var data = updatePhone.toJson();
    await documentReferencer.update(data).whenComplete(() {
      final snackBar = SnackBar(
          backgroundColor: const Color.fromRGBO(31, 68, 141, 1),
          content: Text('Successful! Phone number updated',
              style: GoogleFonts.montserrat(
                  fontWeight: FontWeight.w600,
                  color: Colors.white,
                  fontSize: 16.0)));
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
      print("User data added");
    }).catchError((e) {
      final snackBar = SnackBar(
          backgroundColor: const Color.fromRGBO(31, 68, 141, 1),
          content: Text('Process failed! Something went wrong',
              style: GoogleFonts.montserrat(
                  fontWeight: FontWeight.w600,
                  color: Colors.white,
                  fontSize: 16.0)));
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
      print(e);
      return;
    });
  }

  updateEmail({required var uid, required String email}) async {
    DocumentReference documentReferencer = userCollection.doc(uid);
    UpdateEmail updateEmail = UpdateEmail(email: email);
    var data = updateEmail.toJson();
    await documentReferencer.update(data).whenComplete(() {
      print("User data added");
    }).catchError((e) {
      print(e);
      return;
    });
  }

  updateServiceAddress(
      {required var uid,
      required List<String> addressList,
      required BuildContext context}) async {
    DocumentReference documentReferencer = userCollection.doc(uid);
    // UpdateServiceAddress updateServiceAddress =
    //     UpdateServiceAddress(address: address);
    // var data = updateServiceAddress.toJson();
    await documentReferencer.update({
      "delivery_address": FieldValue.arrayUnion(addressList)
    }).whenComplete(() {
      final snackBar = SnackBar(
          backgroundColor: const Color.fromRGBO(31, 68, 141, 1),
          content: Text('Address Successfully Added',
              style: GoogleFonts.montserrat(
                  fontWeight: FontWeight.w600,
                  color: Colors.white,
                  fontSize: 16.0)));
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
      print("User data added");
    }).catchError((e) {
      final snackBar = SnackBar(
          backgroundColor: const Color.fromRGBO(31, 68, 141, 1),
          content: Text('Process failed! Something went wrong',
              style: GoogleFonts.montserrat(
                  fontWeight: FontWeight.w600,
                  color: Colors.white,
                  fontSize: 16.0)));
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
      print(e);
      return;
    });
  }

  storeUserData({
    required var uid,
    required String firstName,
    required String lastName,
    required String phone,
    required String state,
    required String email,
    required String code,
    required String houseAddress,
    required List<String> deliveryAddress,
    required String amount,
    required String customerCode,
    required String bankName,
    required String accountNumber,
    required String accountName,
  }) async {
    //uid = _auth.currentUser?.uid;
    DocumentReference documentReferencer = userCollection.doc(uid);
    if (kDebugMode) {
      print(uid);
    }
    Users user = Users(
        uid: uid,
        firstName: firstName,
        lastName: lastName,
        phone: phone,
        state: state,
        email: email,
        code: code,
        houseAddress: houseAddress,
        deliveryAddress: deliveryAddress,
        walletAmount: amount,
        customerCode: customerCode,
        accountNumber: accountNumber,
        bankName: bankName,
        bankAcctName: accountName);

    var data = user.toJson();
    await documentReferencer.set(data).whenComplete(() {
      print("User data added");
    }).catchError((e) {
      print(e);
      return;
    });
  }

  //Stream<QuerySnapshot> retrieveUsers() {}
}
