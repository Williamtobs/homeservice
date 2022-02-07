import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:homeservice/Constants/errors.dart';

class Authentication {
  FirebaseAuth _auth = FirebaseAuth.instance;

  //check if user logged in or not
  Stream<User?> get authStateChange => _auth.authStateChanges();

  Future<void> signInWithEmailAndPassword(String email, String password,
      BuildContext context) async {
    try{
      await _auth.signInWithEmailAndPassword(email: email, password: password);
    } on FirebaseAuthException catch(e){
      await showDialog(
        context: context,
        builder: (ctx) => AlertDialog(
          title: Text(Errors.show(e.code)),
          content: Text(e.toString()),
          actions: [
            TextButton(
                onPressed: () {
                  Navigator.of(ctx).pop();
                },
                child: const Text("OK"))
          ],
        ),
      );
    }
  }

  //sign up with email and Password
  Future<void> signUpWithEmailAndPassword(
      String email, String password, BuildContext context) async {
    try{
      await _auth.createUserWithEmailAndPassword(email: email, password: password);
    } on FirebaseAuthException catch (e){
      await showDialog(
          context: context,
          builder: (ctx) => AlertDialog(
              title: Text(Errors.show(e.code)),
              content: Text(e.toString()),
              actions: [
                TextButton(
                    onPressed: () {
                      Navigator.of(ctx).pop();
                    },
                    child: const Text("OK"))
              ]));
    } catch (e) {
      if (e == 'email-already-in-use') {
        print('Email already in use.');
      } else {
        print('Error: $e');
      }
    }
  }

  //  SignOut the current user
  Future<void> signOut() async {
    await _auth.signOut();
  }

}