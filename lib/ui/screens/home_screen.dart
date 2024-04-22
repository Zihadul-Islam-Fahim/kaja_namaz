import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kaja_namaz/data/auth_services/auth_controller.dart';
import 'package:kaja_namaz/data/controllers/firestore_controller.dart';
import 'package:kaja_namaz/data/utilities/app_colors.dart';
import 'package:kaja_namaz/ui/widgets/kosor_namaz_view.dart';
import 'package:kaja_namaz/ui/widgets/set_namaz_container.dart';
import 'package:kaja_namaz/ui/widgets/user_appbar.dart';

import '../widgets/app_drawer.dart';
import '../widgets/regular_namaz_view.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  TextEditingController namazYearsController = TextEditingController();
  FirestoreController firestoreController = Get.find<FirestoreController>();
  AuthController authController = Get.find<AuthController>();

  Future<void> _init() async {
    await firestoreController
        .getUserProfileData(FirebaseAuth.instance.currentUser!.uid);
    await firestoreController
        .getNamazData(FirebaseAuth.instance.currentUser!.uid);
    await authController.afterOpenApp();
  }

  @override
  void initState() {
    _init();
    Future.delayed(const Duration(milliseconds: 1700)).then(
      (value) {
        if (firestoreController.isNewUser ) {
          Get.defaultDialog(
              title: 'Set Namaz Count',
              barrierDismissible: false,
              content: setNamazContainer());
        }
      },
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.sizeOf(context);

    return GetBuilder<FirestoreController>(
      builder: (firestoreController) {
        if (firestoreController.inProgress) {
          return Scaffold(
            backgroundColor: AppColors.secondaryColor,
            body: const SafeArea(
              child: Center(
                child: CircularProgressIndicator(
                  color: Colors.white,
                ),
              ),
            ),
          );
        } else {
          return DefaultTabController(
            length: 2,
            child: Scaffold(
              backgroundColor: AppColors.secondaryColor,
              endDrawer: const AppDrawer(),
              appBar: userAppBar(firestoreController),
              body: TabBarView(
                children: [regularNamazView(size), kosorNamazView(size)],
              ),
            ),
          );
        }
      },
    );
  }
}
