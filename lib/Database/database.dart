import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:homeservice/Model/user.dart';

class Database {
  final CollectionReference userCollection =
      FirebaseFirestore.instance.collection('Users');

  storeUserData({
    required var uid,
    required String userName,
    required String phone,
    required String state,
    required String email,
    required String code,
  }) async {
    //uid = _auth.currentUser?.uid;
    DocumentReference documentReferencer = userCollection.doc(uid);
    print(uid);
    Users user = Users(
        uid: uid,
        name: userName,
        phone: phone,
        state: state,
        email: email,
        code: code);

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
