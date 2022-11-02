import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'package:get/get.dart';
import 'package:uji_kom_tsa/app/modules/global/widgets/text_field/regular_text_field/regular_text_field.dart';
import 'package:uji_kom_tsa/app/modules/profile/controllers/profile_controller.dart';

import '../controllers/setting_profile_controller.dart';

class SettingProfileView extends GetView<SettingProfileController> {
  SettingProfileView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: controller.userDocumentSnapshot,
      builder: (context, snapshot) {
        var data = snapshot.data;

        if (snapshot.connectionState == ConnectionState.done) {
          controller.fullNameController.text = data?["fullName"];
          controller.phoneNumberController.text = data?["userPhoneNumber"];

          return Scaffold(
            appBar: AppBar(
              title: const Text('Profile'),
              centerTitle: true,
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
                  RegularTextField(
                    controller: controller.fullNameController,
                    label: "Nama Lengkap",
                    suffixIcon: FaIcon(FontAwesomeIcons.user),
                  ),
                  RegularTextField(
                    controller: controller.phoneNumberController,
                    label: "Nomor Handphone",
                    suffixIcon: FaIcon(FontAwesomeIcons.user),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      controller.updateUser();
                    },
                    child: const Text("Update Profile"),
                  )
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

    // return Scaffold(
    //   appBar: AppBar(
    //     title: const Text('Profile'),
    //     centerTitle: true,
    //   ),
    //   body: Center(
    //     child: Column(
    //       mainAxisAlignment: MainAxisAlignment.start,
    //       crossAxisAlignment: CrossAxisAlignment.start,
    //       children: [
    //         const Padding(
    //           padding: EdgeInsets.all(16.0),
    //           child: Center(
    //             child: SizedBox(
    //               height: 100,
    //               width: 100,
    //               child: CircleAvatar(
    //                 backgroundImage: NetworkImage("https://picsum.photos/100"),
    //               ),
    //             ),
    //           ),
    //         ),
    //         RegularTextField(
    //           controller: controller.fullNameController,
    //           label: "Nama Lengkap",
    //           suffixIcon: FaIcon(FontAwesomeIcons.user),
    //         ),
    //         RegularTextField(
    //           controller: controller.phoneNumberController,
    //           label: "Nomor Handphone",
    //           suffixIcon: FaIcon(FontAwesomeIcons.user),
    //         ),
    //       ],
    //     ),
    //   ),
    // );
  }
  // return Scaffold(
  //   body: Center(
  //     child: CircularProgressIndicator(),
  //   ),
  // );

}
