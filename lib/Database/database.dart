import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:homeservice/Model/user.dart';

class Database {
  final CollectionReference userCollection =
      FirebaseFirestore.instance.collection('Users');

  storeUserData({
    required var uid,
    required String firstName,
    required String lastName,
    required String phone,
    required String state,
    required String email,
    required String code,
    required String houseAddress,
    required String deliveryAddress,
    required String amount,
  }) async {
    //uid = _auth.currentUser?.uid;
    DocumentReference documentReferencer = userCollection.doc(uid);
    print(uid);
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
    );

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
