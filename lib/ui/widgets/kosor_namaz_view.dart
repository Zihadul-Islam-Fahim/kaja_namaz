import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kaja_namaz/data/auth_services/auth_controller.dart';
import 'package:kaja_namaz/data/utilities/app_colors.dart';
import 'package:kaja_namaz/ui/widgets/wakto_row.dart';

GetBuilder<AuthController> kosorNamazView(Size size) {
  return GetBuilder<AuthController>(
    builder: (_) {
      return Container(
        padding: const EdgeInsets.all(30),
        decoration:  BoxDecoration(
          color: AppColors.primaryColor,
        ),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [

              waktoRow(size, false,"Zuhar"),
              waktoRow(size,false, "Asor"),
              waktoRow(size,false, "Isha"),

            ],
          ),
        ),
      );
    },
  );
}