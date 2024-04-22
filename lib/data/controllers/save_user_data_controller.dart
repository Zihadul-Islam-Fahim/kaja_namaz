import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:kaja_namaz/data/controllers/firestore_controller.dart';
import 'package:kaja_namaz/data/utilities/utilities.dart';
import 'package:kaja_namaz/ui/screens/home_screen.dart';

class SaveUserDataController extends GetxController {
  CollectionReference db = FirebaseFirestore.instance.collection('user');
  final FirebaseAuth _auth = FirebaseAuth.instance;
  FirebaseAuth firebaseAuth = FirebaseAuth.instance;
  FirestoreController firestoreController = Get.find<FirestoreController>();

  Future<void> saveUserData(String name, String email) async {
    await FirebaseFirestore.instance
        .collection("user")
        .doc(FirebaseAuth.instance.currentUser!.uid)
        .set(
      {'name': name, "email": email},
    );
  }

  Future<void> checkHasUser() async {
    List<String> dataList = [];
    bool? previousUser;

    QuerySnapshot docRef = await  FirebaseFirestore.instance.collection("user").get();

    for (var doc in docRef.docs) {

      dataList.add(doc.id);
    }
    for (int i = 0; i < dataList.length; i++) {
      if (dataList[i].toString() == _auth.currentUser!.uid.toString()) {
        previousUser = true;
        break;
      } else {
        previousUser = false;
      }
    }

    if (previousUser == true) {
      Get.offAll(() => const HomeScreen());
    } else {
      firestoreController.isNewUser = true;
      await saveUserData(
        firebaseAuth.currentUser!.displayName.toString(),
        firebaseAuth.currentUser!.email.toString(),
      );

      await FirebaseFirestore.instance
          .collection("Namaz")
          .doc(FirebaseAuth.instance.currentUser!.uid)
          .set(setInitailNamazCount("0").toJson());
      Get.offAll(() => const HomeScreen());
    }
  }
}
