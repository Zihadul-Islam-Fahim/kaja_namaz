import 'package:get/get.dart';
import 'package:kaja_namaz/data/auth_services/auth_controller.dart';
import 'package:kaja_namaz/data/controllers/firestore_controller.dart';
import 'package:kaja_namaz/data/controllers/login_controller.dart';
import 'package:kaja_namaz/data/controllers/reset_password_controller.dart';
import 'package:kaja_namaz/data/controllers/singup_controller.dart';

import 'data/controllers/wakto_controller.dart';

class ControllerBinder extends Bindings{
  @override
  void dependencies() {

    Get.put(FirestoreController());
    Get.put(AuthController());
    Get.put(WaktoController());
    Get.put(SignupController());
    Get.put(LoginController());
    Get.put(ResetPasswordController());



  }

}