import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kaja_namaz/data/utilities/utilities.dart';

class ResetPasswordController extends GetxController {
  bool loading = false;

  resetPassword(context, String email) async {
    loading = true;
    update();
    try {
      await FirebaseAuth.instance.sendPasswordResetEmail(email: email);
      Get.snackbar('Link sent', 'Password Reset link sent to your mail',backgroundColor: Colors.green);
    } on FirebaseAuthException catch (e) {
      mySnackbar(context, e.code, true);
    }
    loading = false;
    update();
  }
}
