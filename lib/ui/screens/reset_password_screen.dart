import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kaja_namaz/data/controllers/reset_password_controller.dart';
import 'package:kaja_namaz/data/utilities/app_colors.dart';

class ResetPasswordScreen extends StatefulWidget {
  const ResetPasswordScreen({super.key});

  @override
  State<ResetPasswordScreen> createState() => _ResetPasswordScreenState();
}

class _ResetPasswordScreenState extends State<ResetPasswordScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _emailTEController = TextEditingController();
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
                  SizedBox(height: height*0.04,),
                  const Text(
                    "Reset Password",
                    style: TextStyle(
                      fontSize: 32,
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
                  GetBuilder<ResetPasswordController>(builder: (controller) {
                    return SizedBox(
                      height: height * 0.06,
                      width: double.infinity,
                      child: Visibility(
                        visible: controller.loading == false,
                        replacement:  Center(
                          child: CircularProgressIndicator(
                            color: AppColors.buttonColor,
                          ),
                        ),
                        child: ElevatedButton(
                            onPressed: () {
                              if (_formKey.currentState!.validate()) {
                                controller.resetPassword(
                                  context,
                                  _emailTEController.text,
                                );
                              }
                            },
                            child: const Text(
                              'Send Link To Mail',
                              style: TextStyle(
                                  fontFamily: 'poppins', fontSize: 16,color: Colors.white),
                            ),),
                      ),
                    );
                  }),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
