import 'dart:convert';
import 'dart:developer';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:kaja_namaz/data/controllers/firestore_controller.dart';
import 'package:kaja_namaz/data/models/namaz_collection_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthController extends GetxController{
  FirestoreController firestoreController = Get.find<FirestoreController>();
  NamazCollection? namazCollection;
  bool? firstOpenAfterInstall;
  bool isBackedUp = false;


  afterOpenApp() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    firstOpenAfterInstall = sharedPreferences.getBool('firstOpen') ?? true;
    firestoreController.setProgressFalse();
    firstOpenAfterInstall == false
        ? await getNamazDataFromStorage()
        : await initialSave(firestoreController.namazCollection);
  }

  initialSave(NamazCollection namazCollection) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    await sharedPreferences.setString('saveNamazes', jsonEncode(namazCollection.toJson()));
    await sharedPreferences.setBool('firstOpen', false);
    firstOpenAfterInstall =  sharedPreferences.getBool('firstOpen') ?? true;
    this.namazCollection =  NamazCollection.fromJson(jsonDecode(sharedPreferences.getString('saveNamazes') ?? '{}' )) ;
    update();
  }

  getNamazDataFromStorage()async{
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    namazCollection =  NamazCollection.fromJson(jsonDecode(sharedPreferences.getString('saveNamazes') ?? '{}' )) ;
    update();
    await saveNamazDataToFirestore();
  }

  setNamazAfterChanges()async{
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    await sharedPreferences.setString('saveNamazes', jsonEncode(namazCollection?.toJson()));
    namazCollection =  NamazCollection.fromJson(jsonDecode(sharedPreferences.getString('saveNamazes') ?? '{}' )) ;
    isBackedUp = false;
    update();

  }

  Future<void> saveNamazDataToFirestore() async {
    log(isBackedUp.toString());
    try{
      await FirebaseFirestore.instance.collection('Namaz').doc(FirebaseAuth.instance.currentUser!.uid).set( namazCollection!.toJson());
      isBackedUp = true;
      update();

    }catch(e){
      log(e.toString());
    }
  }



  afterLogout()async{
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    firstOpenAfterInstall = await  sharedPreferences.setBool('firstOpen',true);
  }

}