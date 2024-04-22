import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:kaja_namaz/data/controllers/save_user_data_controller.dart';
import 'package:kaja_namaz/data/utilities/utilities.dart';

class SignupController extends GetxController {
  bool loading = false;

  void signUp(context, String name, String email, String password) async {
    loading = true;
    update();

    try {
      UserCredential userCredential = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: email, password: password);
      if(userCredential.user != null){
        mySnackbar(context, 'User created,Login now.');
        await SaveUserDataController().saveUserData(name, email);

        await FirebaseFirestore.instance
            .collection("Namaz")
            .doc(FirebaseAuth.instance.currentUser!.uid)
            .set(setInitailNamazCount("0").toJson());

        Get.back();
      }
    } on FirebaseAuthException catch (e) {
      mySnackbar(context, e.code.toString(), true);
    }
    loading = false;
    update();
  }
}
