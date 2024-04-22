import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kaja_namaz/data/auth_services/auth_controller.dart';
import 'package:kaja_namaz/data/controllers/firestore_controller.dart';
import 'package:kaja_namaz/data/controllers/logout_controller.dart';
import 'package:kaja_namaz/data/utilities/app_colors.dart';
import 'package:kaja_namaz/data/utilities/utilities.dart';
import 'package:kaja_namaz/ui/widgets/set_namaz_container.dart';
import 'package:url_launcher/url_launcher.dart';

class AppDrawer extends StatefulWidget {
  const AppDrawer({
    super.key,
  });



  @override
  State<AppDrawer> createState() => _AppDrawerState();
}

class _AppDrawerState extends State<AppDrawer> {

  FirestoreController firestoreController = Get.find<FirestoreController>();

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          DrawerHeader(decoration: BoxDecoration(color: AppColors.buttonColor),
            padding: const EdgeInsets.all(0),
            child: UserAccountsDrawerHeader(decoration: BoxDecoration(color: AppColors.buttonColor),
              accountEmail: Text(
                firestoreController.userProfile.email!,
                style: const TextStyle(fontFamily: 'poppins'),
              ),
              accountName: Text(
                firestoreController.userProfile.name!,
                style: const TextStyle(
                    fontFamily: 'poppins', fontWeight: FontWeight.bold),
              ),
            ),
          ),
          ListTile(
            onTap: () {
              Get.back();
              Get.defaultDialog(title: 'Set Namaz Count',barrierDismissible: false,content: setNamazContainer());
            },
            title: const Text(
              'Set Namaz',
              style: TextStyle(fontFamily: 'poppins'),
            ),
          ),
          const Divider(),
          const Spacer(),
          const Divider(),
          Column(
            children: [
              ListTile(
                onTap: () {
                  LogoutController().logout();
                },
                trailing: const Icon(
                  Icons.logout,
                  color: Colors.red,
                ),
                title: const Text(
                  'Logout',
                  style: TextStyle(
                      color: Colors.red,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'poppins'),
                ),
              ),
              Column(
                children: [
                  Container(
                    width: double.infinity,
                    color: AppColors.buttonColor,
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child:                   const Row(
                      children: [
                        Text(
                          ' Developed By: ',
                          style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w400,
                              fontFamily: 'Poppins'),
                        ),
                        Text(
                          'Zihadul Islam Fahim ',
                          style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.bold,
                              fontFamily: 'Poppins'),
                        ),
                      ],
                    ),
                  ),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      IconButton(
                        onPressed: () async {
                          await launchUrl(
                            Uri.parse(
                                "https://www.facebook.com/FahimXihad?mibextid=ZbWKwL"),
                          );
                        },
                        icon: Icon(
                          Icons.facebook,
                          color: Colors.blue.shade900,
                          size: 44,
                        ),
                      ),
                      IconButton(
                        onPressed: () async {
                          if (!await launchUrl(Uri.parse("mailto:fahimzihad@gmail.com"))) {
                            throw Exception(
                                'Could not launch');
                          }
                        },
                        icon: Icon(
                          Icons.mail_outline,
                          color: Colors.redAccent.shade700,
                          size: 40,
                        ),
                      ),
                      IconButton(
                        onPressed: () async {
                          if (!await launchUrl(Uri.parse("tel:01601736881"))) {
                            throw Exception(
                                'Could not launch');
                          }
                        },
                        icon: const Icon(
                          Icons.call,
                          size: 40,
                          color: Colors.teal,
                        ),
                      ),
                      InkWell(
                        onTap: () async {
                          await launchUrl(
                            Uri.parse('https://wa.me/qr/6GVMNFB52YWYL1'),
                          );
                        },
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(10),
                          child: Image.asset(
                            'assets/images/whatsapp.jpg',
                            width: 40,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ],
          )
        ],
      ),
    );
  }

}
