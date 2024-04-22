import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kaja_namaz/data/controllers/singup_controller.dart';
import 'package:kaja_namaz/data/utilities/app_colors.dart';
import 'package:kaja_namaz/data/utilities/utilities.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _nameTEController = TextEditingController();
  final TextEditingController _emailTEController = TextEditingController();
  final TextEditingController _passTEController = TextEditingController();
  final TextEditingController _rePassTEController = TextEditingController();

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
                  ClipRRect(borderRadius: BorderRadius.circular(20),child: Image.asset("assets/images/playstore.png",width: height*0.1,),),
                  SizedBox(height: height*0.03,),
                  const Text(
                    "Signup",
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
                    controller: _nameTEController,
                    validator: (String? v) {
                      if (v!.isEmpty) {
                        return 'enter name';
                      }
                    },
                    decoration: const InputDecoration(hintText: 'Full Name'),
                  ),
                  SizedBox(
                    height: height * 0.02,
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
                    height: height * 0.02,
                  ),
                  TextFormField(
                    controller: _rePassTEController,
                    validator: (String? v) {
                      if (v!.isEmpty) {
                        return 're-enter password';
                      }
                    },
                    decoration:
                        const InputDecoration(hintText: 'Re-enter Password'),
                  ),
                  SizedBox(
                    height: height * 0.03,
                  ),
                  GetBuilder<SignupController>(builder: (controller) {
                    return SizedBox(
                      height: height * 0.06,
                      width: double.infinity,
                      child: Visibility(
                        visible: controller.loading == false,
                        replacement: const Center(
                          child: CircularProgressIndicator(),
                        ),
                        child: ElevatedButton(
                            onPressed: () {
                              if (_formKey.currentState!.validate()) {
                                if (_emailTEController.text !=
                                    _rePassTEController.text) {
                                  controller.signUp(
                                      context,
                                      _nameTEController.text,
                                      _emailTEController.text,
                                      _passTEController.text);
                                } else {
                                  mySnackbar(
                                      context, "Password didn't match!", true);
                                }
                              }
                            },
                            child: const Text(
                              'Signup',
                              style: TextStyle(
                                  fontFamily: 'poppins', fontSize: 16,color: Colors.white),
                            )),
                      ),
                    );
                  }),
                  SizedBox(
                    height: height * 0.05,
                  ),
                  TextButton(
                    onPressed: () async {
                      Get.back();
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          'Already have an account? ',
                          style: TextStyle(
                              fontFamily: 'poppins',
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                              color: Colors.grey),
                        ),
                        Text(
                          'Login',
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
