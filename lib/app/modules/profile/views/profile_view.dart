import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'package:get/get.dart';
import 'package:uji_kom_tsa/app/modules/global/widgets/text_field/regular_text_field/regular_text_field.dart';

import '../../global/widgets/text_field/password_text_field/password_text_field.dart';
import '../controllers/profile_controller.dart';

class ProfileView extends GetView<ProfileController> {
  ProfileView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<DocumentSnapshot>(
      stream: controller.userSnapshot,
      builder: (_, snapshot) {
        if (snapshot.connectionState == ConnectionState.active) {
          var output = snapshot.data;

          return Scaffold(
            appBar: AppBar(
              title: const Text('Profile'),
              centerTitle: true,
              actions: [
                IconButton(
                  onPressed: () {
                    Get.toNamed("/setting-profile");
                  },
                  icon: Icon(Icons.settings),
                ),
              ],
            ),
            body: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Padding(
                    padding: EdgeInsets.all(16.0),
                    child: Center(
                      child: SizedBox(
                        height: 100,
                        width: 100,
                        child: CircleAvatar(
                          backgroundImage:
                              NetworkImage("https://picsum.photos/100"),
                        ),
                      ),
                    ),
                  ),
                  ListTile(
                    title: Text("Nama"),
                    subtitle: Text(output?["fullName"] ?? "null"),
                  ),
                  ListTile(
                    title: Text("Email"),
                    subtitle: Text(output?["email"] ?? "null"),
                  ),
                  ListTile(
                    title: Text("Nomor Hanphone"),
                    subtitle: Text(output?["userPhoneNumber"] ?? "null"),
                  ),
                ],
              ),
            ),
          );
        }
        return Scaffold(
          body: Center(
            child: CircularProgressIndicator(),
          ),
        );
      },
    );
  }
}
