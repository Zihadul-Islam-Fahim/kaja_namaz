import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kaja_namaz/data/controllers/login_controller.dart';
import 'package:kaja_namaz/data/controllers/reset_password_controller.dart';
import 'package:kaja_namaz/data/utilities/app_colors.dart';
import 'package:kaja_namaz/ui/screens/home_screen.dart';
import 'package:kaja_namaz/ui/screens/reset_password_screen.dart';
import 'package:kaja_namaz/ui/screens/singup_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _emailTEController = TextEditingController();
  final TextEditingController _passTEController = TextEditingController();
  final loginController = Get.find<LoginController>();
  final resetPassController = Get.find<ResetPasswordController>();

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.sizeOf(context).height;

    return Scaffold(
      backgroundColor: AppColors.primaryColor,
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Center(
          child: SingleChildScrollView(
            child: Form(
              key: _formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ClipRRect(borderRadius: BorderRadius.circular(20),child: Image.asset("assets/images/playstore.png",width: height*0.14,)),
                  SizedBox(
                    height: height * 0.07,
                  ),
                  const Text(
                    "Login",
                    style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'poppins',
                      color: Colors.white
                    ),
                  ),
                  SizedBox(
                    height: height * 0.04,
                  ),
                  TextFormField(
                    controller: _emailTEController,
                    validator: (String? v) {
                      if (v!.isEmpty) {
                        return 'enter email';
                      }
                    },
                    decoration: const InputDecoration(hintText: 'Email'),
                  ),
                  SizedBox(
                    height: height * 0.02,
                  ),
                  TextFormField(
                    controller: _passTEController,
                    obscureText: true,
                    validator: (String? v) {
                      if (v!.isEmpty) {
                        return 'enter password';
                      }
                    },
                    decoration: const InputDecoration(hintText: 'Password'),
                  ),
                  SizedBox(
                    height: height * 0.03,
                  ),
                  GetBuilder<LoginController>(builder: (controller) {
                    return SizedBox(
                      height: height * 0.06,
                      width: double.infinity,
                      child: Visibility(
                        visible: controller.loading == false,
                        replacement: const Center(
                          child: CircularProgressIndicator(
                            color: Colors.black,
                          ),
                        ),
                        child: ElevatedButton(
                            onPressed: () async {
                              if (_formKey.currentState!.validate()) {
                                final res = await controller.loginWithEmail(
                                    context,
                                    _emailTEController.text,
                                    _passTEController.text);
                                if (res) {
                                  Get.offAll(() => const HomeScreen());
                                }
                              }
                            },
                            child: const Text(
                              'Login',
                              style: TextStyle(
                                  fontFamily: 'poppins', fontSize: 16,color: Colors.white),
                            )),
                      ),
                    );
                  }),
                  SizedBox(
                    height: height * 0.05,
                  ),
                  GestureDetector(
                    onTap: () async {
                      await loginController.loginWithGoogle(context);
                    },
                    child: Card(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10)),
                      elevation: 1,
                      child: SizedBox(
                        height: height * 0.06,
                        width: height * 0.3,
                        child: Center(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const Text(
                                '  Login with Google     ',
                                style: TextStyle(
                                  fontFamily: 'poppins',
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                              Image.asset(
                                'assets/images/google.png',
                                width: height *0.04,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: height * 0.02,
                  ),
                  TextButton(
                    onPressed: () async {
                      Get.to(() => const ResetPasswordScreen());
                    },
                    child: const Text(
                      'Forgot Password?',
                      style: TextStyle(
                          fontFamily: 'poppins',
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                          color: Colors.grey),
                    ),
                  ),

                  TextButton(
                    onPressed: () async {
                      Get.to(const SignupScreen());
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          'Didn\'t have an account? ',
                          style: TextStyle(
                              fontFamily: 'poppins',
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                              color: Colors.grey),
                        ),
                        Text(
                          'Signup',
                          style: TextStyle(
                            fontSize: 14,
                            color: AppColors.buttonColor,
                            fontWeight: FontWeight.bold,
                            fontFamily: 'poppins',
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
