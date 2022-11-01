import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:google_sign_in/google_sign_in.dart';

import '../../../routes/app_pages.dart';

class AuthController extends GetxController {
  //TODO: Implement AuthController

  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Stream<User?> get authStateChange => _firebaseAuth.authStateChanges();
  final GoogleSignIn _googleSignIn = GoogleSignIn();

  Future<void> firebaseAuthSignUp(
      {required String email,
      required String fullName,
      required String password,
      required String phone}) async {
    try {
      final credential =
          await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );

      CollectionReference userCollection = _firestore.collection("user");
      User? user = credential.user;

      await userCollection
          .doc("${user?.uid}")
          .set({
            "id": user?.uid,
            "email": user?.email,
            "fullName": fullName,
            "userPhoneNumber": phone,
          })
          .then((value) => print("User Added"))
          .catchError((error) => throw error);

      await user
          ?.updateDisplayName(fullName)
          .then((value) => Get.offAllNamed(Routes.HOME));
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        print('The password provided is too weak.');
      } else if (e.code == 'email-already-in-use') {
        print('The account already exists for that email.');
      }
    } catch (e) {
      print(e);
    }
  }

  void firebaseAuthLogin(String emailAddress, String password) async {
    try {
      final credential = await _firebaseAuth.signInWithEmailAndPassword(
          email: emailAddress, password: password);
      print(credential);
      Get.offAllNamed(Routes.HOME);
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        print('No user found for that email.');
      } else if (e.code == 'wrong-password') {
        print('Wrong password provided for that user.');
      }
    }
  }

  void firebaseAuthSignOut() async {
    // await _googleSignIn.signOut();
    await FirebaseAuth.instance.signOut();
    Get.offAllNamed(Routes.AUTH_SIGN_IN);
  }

  Future<UserCredential> signInWithGoogle() async {
    // Trigger the authentication flow
    final GoogleSignInAccount? googleUser = await _googleSignIn.signIn();

    // Obtain the auth details from the request
    final GoogleSignInAuthentication? googleAuth =
        await googleUser?.authentication;

    // Create a new credential
    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth?.accessToken,
      idToken: googleAuth?.idToken,
    );

    // Once signed in, return the UserCredential
    var userCredential = await _firebaseAuth.signInWithCredential(credential);
    Get.offAllNamed(Routes.HOME);
    return userCredential;
  }

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }
}
