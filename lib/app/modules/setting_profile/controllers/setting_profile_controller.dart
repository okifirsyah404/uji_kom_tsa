import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SettingProfileController extends GetxController {
  final User? user = FirebaseAuth.instance.currentUser;
  CollectionReference users = FirebaseFirestore.instance.collection("user");

  Future<DocumentSnapshot<Object?>>? get userDocumentSnapshot =>
      users.doc(user?.uid).get();

  late TextEditingController emailController;
  late TextEditingController fullNameController;
  late TextEditingController phoneNumberController;

  Future<void> updateUser() {
    return users.doc(user?.uid).update(
      {
        "fullName": fullNameController.text,
        "userPhoneNumber": phoneNumberController.text,
      },
    ).catchError((error) => print("Failed to update user: $error"));
  }

  @override
  void onInit() {
    emailController = TextEditingController();
    fullNameController = TextEditingController();
    phoneNumberController = TextEditingController();

    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    emailController.dispose();
    fullNameController.dispose();
    phoneNumberController.dispose();

    super.onClose();
  }
}
