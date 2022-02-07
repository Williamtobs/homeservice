import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:homeservice/Model/user.dart';



class Database{
  final CollectionReference userCollection = FirebaseFirestore.instance.collection('users');

  storeUserData({required String userName, required String phone, required String state,}) async {
    DocumentReference documentReferencer = userCollection.doc();

    var uid = documentReferencer.id;

    User user = User(
      uid: uid,
      name: userName,
      phone: phone,
      state: state,
    );

    var data = user.toJson();

    await documentReferencer.set(data).whenComplete(() {
      print("User data added");
    }).catchError((e) => print(e));
  }

  //Stream<QuerySnapshot> retrieveUsers() {}
}