import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'package:get/get.dart';
import 'package:uji_kom_tsa/app/modules/global/widgets/text_field/regular_text_field/regular_text_field.dart';

import '../../global/widgets/text_field/password_text_field/password_text_field.dart';
import '../controllers/profile_controller.dart';

class ProfileView extends GetView<ProfileController> {
  const ProfileView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<DocumentSnapshot>(
      stream: controller.users.doc(controller.user?.uid).snapshots(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.active) {
          // controller.phoneNumberController.text = snapshot.data.

          return Scaffold(
            appBar: AppBar(
              title: const Text('Profile'),
              centerTitle: true,
            ),
            body: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      height: 100,
                      width: 100,
                      child: CircleAvatar(
                        backgroundImage:
                            NetworkImage("https://picsum.photos/100"),
                      ),
                    ),
                    RegularTextField(
                      controller: controller.fullNameController,
                      label: "Nama Langkap",
                      suffixIcon: FaIcon(FontAwesomeIcons.user),
                    ),
                    SizedBox(height: 8),
                    RegularTextField(
                      controller: controller.emailController,
                      label: "Email",
                      suffixIcon: FaIcon(FontAwesomeIcons.envelope),
                    ),
                    SizedBox(height: 8),
                    RegularTextField(
                      controller: controller.phoneNumberController,
                      label: "Telephone",
                      suffixIcon: FaIcon(FontAwesomeIcons.phone),
                      keyboardType: TextInputType.number,
                    ),
                    SizedBox(height: 16),
                  ],
                ),
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

    // return Scaffold(
    //     appBar: AppBar(
    //       title: const Text('Profile'),
    //       centerTitle: true,
    //     ),
    //     body: Padding(
    //       padding: const EdgeInsets.all(16.0),
    //       child: Center(
    //         child: Column(
    //           mainAxisAlignment: MainAxisAlignment.start,
    //           crossAxisAlignment: CrossAxisAlignment.center,
    //           children: [
    //             Container(
    //               height: 100,
    //               width: 100,
    //               child: CircleAvatar(
    //                 backgroundImage: NetworkImage("https://picsum.photos/100"),
    //               ),
    //             ),
    //             RegularTextField(
    //               controller: controller.fullNameController,
    //               label: "Nama Langkap",
    //               suffixIcon: FaIcon(FontAwesomeIcons.user),
    //             ),
    //             SizedBox(height: 8),
    //             RegularTextField(
    //               controller: controller.emailController,
    //               label: "Email",
    //               suffixIcon: FaIcon(FontAwesomeIcons.envelope),
    //             ),
    //             SizedBox(height: 8),
    //             RegularTextField(
    //               controller: controller.phoneNumberController,
    //               label: "Telephone",
    //               suffixIcon: FaIcon(FontAwesomeIcons.phone),
    //               keyboardType: TextInputType.number,
    //             ),
    //             SizedBox(height: 16),
    //           ],
    //         ),
    //       ),
    //     ));
  }
}
