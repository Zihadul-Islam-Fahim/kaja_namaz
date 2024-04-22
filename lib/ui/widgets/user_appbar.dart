import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:kaja_namaz/data/utilities/app_colors.dart';

import '../../data/controllers/firestore_controller.dart';
import '../../data/controllers/logout_controller.dart';

AppBar userAppBar(FirestoreController firestoreController) {
  return AppBar(
iconTheme: const IconThemeData(color: Colors.white),
    backgroundColor: AppColors.secondaryColor,
    titleSpacing: 30,
    title: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          firestoreController.userProfile.name.toString(),
          style: const TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.bold,

              fontFamily: 'poppins',
              letterSpacing: 1,color: Colors.white),
        ),
        Text(
          FirebaseAuth.instance.currentUser!.email.toString(),
          style: const TextStyle(fontSize: 12, fontFamily: 'poppins',color: Colors.white),
        ),
      ],
    ),

    bottom:  const TabBar(
      indicatorColor: Colors.white,indicatorWeight: 4,indicatorSize: TabBarIndicatorSize.tab,
      tabs: [
        Tab(
          child: Text('Regular',style: TextStyle(fontFamily: 'poppins',fontWeight: FontWeight.bold,fontSize: 15,color: Colors.white),),
        ),
        Tab(
          child: Text('Kosor',style: TextStyle(fontFamily: 'poppins',fontWeight: FontWeight.bold,fontSize: 15,color: Colors.white),),
        ),
      ],
    ),
  );
}
