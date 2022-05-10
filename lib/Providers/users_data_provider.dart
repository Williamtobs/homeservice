import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'auth_providers.dart';

final fetchUserInfo = StreamProvider<Map?>(
  (ref) {
    final userStream = ref.watch(fireBaseAuthProvider);
    var user = userStream.currentUser; //.asData?.value;
    if (user != null) {
      var docRef = FirebaseFirestore.instance
          .collection('Users')
          .doc(userStream.currentUser!.uid);
      return docRef.snapshots().map((doc) => doc.data());
    } else {
      return const Stream.empty();
    }
  },
);
