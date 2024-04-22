import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:kaja_namaz/data/auth_services/auth_controller.dart';

import '../../ui/screens/login_screen.dart';

class LogoutController {
  AuthController authController = Get.find<AuthController>();

  Future<void> logout() async {
    await FirebaseAuth.instance.signOut();
    await GoogleSignIn().signOut();
    await authController.afterLogout();
    Get.offAll(()=> const LoginScreen());
  }
}