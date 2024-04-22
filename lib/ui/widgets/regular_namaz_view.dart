import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kaja_namaz/data/auth_services/auth_controller.dart';
import 'package:kaja_namaz/ui/widgets/wakto_row.dart';

import '../../data/utilities/app_colors.dart';

GetBuilder<AuthController> regularNamazView(Size size) {
  return GetBuilder<AuthController>(
    builder: (authController) {
      return Stack(
        children: [
          SingleChildScrollView(
            child: Container(
              padding: const EdgeInsets.all(30),
              decoration: BoxDecoration(
                color: AppColors.primaryColor,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  waktoRow(size, true, "Fazr"),
                  waktoRow(size, true, "Zuhar"),
                  waktoRow(size, true, "Asor"),
                  waktoRow(size, true, "Maghrib"),
                  waktoRow(size, true, "Isha"),
                  waktoRow(size, true, "Vitr"),
                ],
              ),
            ),
          ),
          Align(
            alignment: Alignment.topRight,
            child: Container(
              height: 20,
              width: 20,
              margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              child: authController.isBackedUp
                  ? const Icon(
                      Icons.check_circle,
                      color: Colors.green,
                    )
                  : InkWell(
                      onTap: () {
                        Get.defaultDialog(
                            contentPadding: const EdgeInsets.only(left: 20,right: 20,bottom: 20),middleTextStyle: const TextStyle(fontFamily: 'poppins'),titlePadding: const EdgeInsets.symmetric(vertical: 20),
                            title: "Data isn't Backed up",
                            middleText: 'Your data isn\'t backup on server',
                            textConfirm: 'Backup Data',
                            textCancel: 'Cancel',
                            confirmTextColor: Colors.green,
                            buttonColor: Colors.white,
                            cancelTextColor: Colors.black,
                            onConfirm: () {
                              authController.saveNamazDataToFirestore();
                              Get.back();
                            });
                      },
                      child: const Icon(
                        Icons.error_rounded,
                        color: Colors.red,
                      ),
                    ),
            ),
          )
        ],
      );
    },
  );
}
