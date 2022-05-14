import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../Model/orders.dart';

class StoreDatabase {
  final FirebaseFirestore _firestore =
      FirebaseFirestore.instance; // Create an instance of Firebase Firestore.
  CollectionReference? _orders;

  Stream get allOrders => _firestore.collection("Orders").snapshots();

  Future<bool> addNewServiceOrder(Barbing m, var uid, var uuid) async {
    _orders =
        _firestore.collection('Orders'); // referencing the movie collection .
    try {
      await _orders!.doc(uuid).set({
        'uid': uid,
        'service_id': m.orderId,
        'address': m.address,
        'date_time': m.dateAndTime,
        'phone': m.phoneNumber,
        'amount': m.amount,
        'service': m.service,
        'service_type': m.serviceType,
      }); // Adding a new document to our movies collection
      return true; // finally return true
    } catch (e) {
      return Future.error(e); // return error
    }
  }
}

final barbingDatabaseProvider = Provider((ref) => StoreDatabase());
