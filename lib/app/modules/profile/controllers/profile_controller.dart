import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProfileController extends GetxController {
  final User? user = FirebaseAuth.instance.currentUser;
  CollectionReference users = FirebaseFirestore.instance.collection('users');

  late TextEditingController emailController;
  late TextEditingController fullNameController;
  late TextEditingController phoneNumberController;

  @override
  void onInit() {
    emailController = TextEditingController();
    fullNameController = TextEditingController();
    phoneNumberController = TextEditingController();

    super.onInit();
  }

  @override
  void onReady() {
    emailController.text = user?.email ?? "Email Tidak Ada";
    fullNameController.text = user?.email ?? "Email Tidak Ada";

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
