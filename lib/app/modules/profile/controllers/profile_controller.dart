import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProfileController extends GetxController {
  final User? user = FirebaseAuth.instance.currentUser;
  CollectionReference users = FirebaseFirestore.instance.collection('user');

  Stream<DocumentSnapshot<Object?>> get userSnapshot =>
      users.doc(user?.uid).snapshots();

  void getUserData() async {
    try {
      return users.doc(user?.uid).get().then((value) => value);
    } catch (e) {
      printError(info: e.toString());
    }
  }
}
