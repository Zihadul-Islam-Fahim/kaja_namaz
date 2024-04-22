import 'package:get/get.dart';
import 'package:kaja_namaz/data/auth_services/auth_controller.dart';
import 'package:kaja_namaz/data/controllers/firestore_controller.dart';

class WaktoController extends GetxController{
  AuthController authController = Get.find<AuthController>();
 FirestoreController firestoreController = Get.find<FirestoreController>();


  regularDecrement(String wakto)async{


    if(wakto == "Fazr"){
      if(int.parse(authController.namazCollection!.namazes!.regular!.fajr!)>0){
        authController.namazCollection!.namazes!.regular!.fajr = (int.parse(authController.namazCollection!.namazes!.regular!.fajr!) - 1).toString() ;
      }
    }else if(wakto == 'Zuhar'){
      if(int.parse(authController.namazCollection!.namazes!.regular!.zuhar!)>0){
        authController.namazCollection!.namazes!.regular!.zuhar = (int.parse(authController.namazCollection!.namazes!.regular!.zuhar!) - 1).toString() ;
      }
    }else if(wakto == 'Asor'){
      if(int.parse(authController.namazCollection!.namazes!.regular!.asar!)>0){
        authController.namazCollection!.namazes!.regular!.asar = (int.parse(authController.namazCollection!.namazes!.regular!.asar!) - 1).toString() ;
      }
    }else if(wakto == 'Maghrib'){
      if(int.parse(authController.namazCollection!.namazes!.regular!.maghrib!)>0){
        authController.namazCollection!.namazes!.regular!.maghrib = (int.parse(authController.namazCollection!.namazes!.regular!.maghrib!) - 1).toString() ;
      }
    }else if(wakto == 'Isha'){
      if(int.parse(authController.namazCollection!.namazes!.regular!.isha!)>0){
        authController.namazCollection!.namazes!.regular!.isha = (int.parse(authController.namazCollection!.namazes!.regular!.isha!) - 1).toString() ;
      }
    }else if(wakto == 'Vitr'){
      if(int.parse(authController.namazCollection!.namazes!.regular!.vitr!)>0){
        authController.namazCollection!.namazes!.regular!.vitr = (int.parse(authController.namazCollection!.namazes!.regular!.vitr!) - 1).toString() ;
      }
    }

    update();
    authController.setNamazAfterChanges();

  }


  kosorIncrement(String wakto)async{

    if(wakto == 'Zuhar'){

      authController.namazCollection!.namazes!.kosor!.zuhar = (int.parse(authController.namazCollection!.namazes!.kosor!.zuhar!) + 1).toString() ;
    }else if(wakto == 'Asor'){
      authController.namazCollection!.namazes!.kosor!.asar = (int.parse(authController.namazCollection!.namazes!.kosor!.asar!) + 1).toString() ;
    }else if(wakto == 'Isha'){
      authController.namazCollection!.namazes!.kosor!.isha = (int.parse(authController.namazCollection!.namazes!.kosor!.isha!) + 1).toString() ;
    }

    update();
    authController.setNamazAfterChanges();


  }



  regularIncrement(String wakto)async{

    if(wakto == "Fazr"){
      authController.namazCollection!.namazes!.regular!.fajr = (int.parse(authController.namazCollection!.namazes!.regular!.fajr!) + 1).toString() ;
    }else if(wakto == 'Zuhar'){
      authController.namazCollection!.namazes!.regular!.zuhar = (int.parse(authController.namazCollection!.namazes!.regular!.zuhar!) + 1).toString() ;
    }else if(wakto == 'Asor'){
      authController.namazCollection!.namazes!.regular!.asar = (int.parse(authController.namazCollection!.namazes!.regular!.asar!) + 1).toString() ;
    }else if(wakto == 'Maghrib'){
      authController.namazCollection!.namazes!.regular!.maghrib = (int.parse(authController.namazCollection!.namazes!.regular!.maghrib!) + 1).toString() ;
    }else if(wakto == 'Isha'){
      authController.namazCollection!.namazes!.regular!.isha = (int.parse(authController.namazCollection!.namazes!.regular!.isha!) + 1).toString() ;
    }else if(wakto == 'Vitr'){
      authController.namazCollection!.namazes!.regular!.vitr = (int.parse(authController.namazCollection!.namazes!.regular!.vitr!) + 1).toString() ;
    }
    update();
    authController.setNamazAfterChanges();
  }


  kosorDecrement(String wakto)async{

    if(wakto == 'Zuhar'){
      if(int.parse(authController.namazCollection!.namazes!.kosor!.zuhar!) >0){
        authController.namazCollection!.namazes!.kosor!.zuhar = (int.parse(authController.namazCollection!.namazes!.kosor!.zuhar!) - 1).toString() ;
      }

    }else if(wakto == 'Asor'){
      if(int.parse(authController.namazCollection!.namazes!.kosor!.asar!)>0){
        authController.namazCollection!.namazes!.kosor!.asar = (int.parse(authController.namazCollection!.namazes!.kosor!.asar!) - 1).toString() ;
      }
    }else if(wakto == 'Isha'){
      if(int.parse(authController.namazCollection!.namazes!.kosor!.isha!)>0){
        authController.namazCollection!.namazes!.kosor!.isha = (int.parse(authController.namazCollection!.namazes!.kosor!.isha!) - 1).toString() ;
      }
    }

    update();
    authController.setNamazAfterChanges();

  }



  String? regularWaktoValue(wakto){

    if(wakto == "Fazr"){
      return authController.namazCollection?.namazes!.regular!.fajr ?? '0';
    }else if(wakto == 'Zuhar'){
      return authController.namazCollection?.namazes!.regular!.zuhar ?? '0';
    }else if(wakto == 'Asor'){
      return authController.namazCollection?.namazes!.regular!.asar ?? '0';
    }else if(wakto == 'Maghrib'){
      return authController.namazCollection?.namazes!.regular!.maghrib ?? '0';
    }else if(wakto == 'Isha'){
      return authController.namazCollection?.namazes!.regular!.isha ?? '0';
    }else {
      return authController.namazCollection?.namazes!.regular!.vitr ?? '0';
    }

  }



  String? kosorWaktoValue(wakto){

     if(wakto == 'Zuhar'){
      return authController.namazCollection?.namazes!.kosor!.zuhar ?? '0';
    }else if(wakto == 'Asor'){
      return authController.namazCollection?.namazes!.kosor!.asar ?? '0';
    }else if(wakto == 'Isha'){
      return authController.namazCollection?.namazes!.kosor!.isha ?? '0';
    }else {
      return authController.namazCollection?.namazes!.regular!.vitr ?? '0';
    }

  }

}