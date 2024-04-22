import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:kaja_namaz/data/controllers/save_user_data_controller.dart';

import '../utilities/utilities.dart';
import 'firestore_controller.dart';

class LoginController extends GetxController {
  bool loading = false;
  FirestoreController firestoreController =  Get.find<FirestoreController>();

  Future<bool> loginWithEmail(context, String email, String password) async {
    loading = true;
    update();
    try {
      UserCredential userCredential = await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password);
      if (userCredential.user != null) {
        mySnackbar(context, 'Login Success.');
        loading = false;
        update();
        log(userCredential.toString());
        return true;
      } else {
        loading = false;
        update();
        return false;
      }
    } on FirebaseAuthException catch (e) {
      mySnackbar(context, 'Email or password Incorrect!', true);
      loading = false;
      update();
      return false;
    }
  }

  loginWithGoogle(context) async {
    final GoogleSignIn googleSignIn = GoogleSignIn();
    try {
      GoogleSignInAccount? user = await googleSignIn.signIn();
      mySnackbar(context, 'Please wait....');
      if (user != null) {
        GoogleSignInAuthentication googleSignInAuthentication = await user.authentication;
        AuthCredential credential = GoogleAuthProvider.credential(
            accessToken: googleSignInAuthentication.accessToken,
            idToken: googleSignInAuthentication.idToken);

         await FirebaseAuth.instance.signInWithCredential(credential);

        await SaveUserDataController().checkHasUser();

      } else {
        mySnackbar(context, "Something went wrong,try again !!",true);
      }
    } on FirebaseAuthException catch (ex) {
      mySnackbar(context, ex.code,true);
    }
  }
}
