import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kaja_namaz/data/auth_services/auth_controller.dart';
import 'package:kaja_namaz/data/utilities/app_colors.dart';

import '../../data/utilities/utilities.dart';

Container setNamazContainer() {
  TextEditingController namazYearsController = TextEditingController();
  AuthController authController = Get.find<AuthController>();

  return Container(
    padding: const EdgeInsets.all(20),
    decoration: BoxDecoration(
      color: AppColors.primaryColor,
      borderRadius: const BorderRadius.vertical(
        top: Radius.circular(20),
      ),
    ),
    child: Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        const Text(
          'How many years have you not prayed?',
          style: TextStyle(fontSize: 16, fontFamily: 'poppins'),
        ),
        const SizedBox(
          height: 12,
        ),
        TextFormField(
          controller: namazYearsController,
          keyboardType: TextInputType.number,
          decoration: const InputDecoration(hintText: 'Years'),
        ),
        const SizedBox(
          height: 8,
        ),
        SizedBox(
          height: Get.height * 0.05,
          width: Get.width * 0.5,
          child: ElevatedButton(
            onPressed: () async {
              await authController.initialSave(
                setInitailNamazCount(
                  ((double.parse(namazYearsController.text) * 365).toInt())
                      .toString(),
                ),
              );
              Get.back();
              authController.isBackedUp = false;
              await authController.saveNamazDataToFirestore();
              namazYearsController.clear();
            },
            child: const Text(
              'Set',
              style: TextStyle(fontFamily: 'poppins', color: Colors.white),
            ),
          ),
        ),
      ],
    ),
  );
}
