import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebaselogin/views/home.dart';
import 'package:firebaselogin/views/login.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class AuthController extends GetxController {
  FirebaseAuth _auth = FirebaseAuth.instance;

  Rx<String> greet = ''.obs;

  pageProvider() {
    var logstatus = GetStorage().read("status");
    try {
      logstatus = _auth.currentUser!.uid;
      return Home();
    } catch (e) {
      return Login();
    }
  }

  greetingsProvider() {
    if (DateTime.now().hour <= 12) {
      greet.value = "Good morning🌅️";
      return greet.value;
    } else if (DateTime.now().hour > 12 && DateTime.now().hour < 16) {
      greet.value = "Good afternoon☀";
      return greet.value;
    } else {
      greet.value = "Good evening🌙";
      return greet.value;
    }
  }

  emailProvider() {
    return _auth.currentUser!.email;
  }

  login(email, password) async {
    try {
      await _auth.signInWithEmailAndPassword(email: email, password: password);
      GetStorage().write("status", _auth.currentUser!.uid);
      Get.offAll(Home());
    } on FirebaseAuthException catch (e) {
      Get.snackbar('Error', '${e.message}',
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.blue,
          colorText: Colors.white);
    }
  }

  signup(email, password) async {
    try {
      await _auth.createUserWithEmailAndPassword(
          email: email, password: password);
      Get.offAll(Login());
    } on FirebaseAuthException catch (e) {
      Get.snackbar('Error', '${e.message}',
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.blue,
          colorText: Colors.white);
    }
  }

  logout() async {
    try {
      await _auth.signOut();
      GetStorage().write("status", false);
      Get.offAll(Login());
    } on FirebaseAuthException catch (e) {
      Get.snackbar('Error', '${e.message}',
          backgroundColor: Colors.blue, colorText: Colors.white);
    }
  }

  reset(email) async {
    try {
      await _auth.sendPasswordResetEmail(email: email);
    } on FirebaseException catch (e) {
      Get.snackbar('Error', '${e.message}',
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.blue,
          colorText: Colors.white);
    }
  }
}
