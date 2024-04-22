import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:kaja_namaz/data/models/namaz_collection_model.dart';
import 'package:kaja_namaz/data/models/user_profile.dart';

class FirestoreController extends GetxController {

  NamazCollection namazCollection = NamazCollection();
  UserProfile userProfile = UserProfile();
  bool inProgress = false;
  bool isNewUser = false;


  Future<void> getUserProfileData(String id) async{
    DocumentSnapshot snapshot = await FirebaseFirestore.instance
        .collection("user")
        .doc(id)
        .get();
    userProfile  =  UserProfile.fromJson(snapshot.data());
    update();

  }

  getNamazData(String id) async {
    inProgress = true;
    update();

    DocumentSnapshot snapshot = await FirebaseFirestore.instance
        .collection("Namaz")
        .doc(id)
        .get();
       namazCollection =  NamazCollection.fromJson(snapshot.data());


  }

  setProgressFalse(){
    inProgress = false;
    update();
  }



}
