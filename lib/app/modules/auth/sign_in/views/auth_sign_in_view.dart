import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'package:get/get.dart';
import 'package:uji_kom_tsa/app/modules/auth/controllers/auth_controller.dart';
import 'package:uji_kom_tsa/app/modules/global/themes/color_theme.dart';
import 'package:uji_kom_tsa/app/modules/global/themes/typography_theme.dart';
import 'package:uji_kom_tsa/app/modules/global/widgets/text_field/password_text_field/password_text_field.dart';
import 'package:uji_kom_tsa/app/modules/global/widgets/text_field/regular_text_field/regular_text_field.dart';

import '../../../../routes/app_pages.dart';
import '../controllers/auth_sign_in_controller.dart';

class AuthSignInView extends GetView<AuthSignInController> {
  AuthSignInView({Key? key}) : super(key: key);

  AuthController authController = Get.find<AuthController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'SIGN IN',
                      style: TypographyTheme.titleLarge.copyWith(
                        fontWeight: FontWeight.w600,
                        color: ColorsTheme.primaryColor,
                      ),
                    ),
                    Text(
                      'Silahkan sign in untuk melanjutkan',
                    ),
                  ],
                ),
                Column(
                  children: [
                    RegularTextField(
                      controller: controller.emailController,
                      label: "Email",
                      suffixIcon: FaIcon(FontAwesomeIcons.envelope),
                    ),
                    SizedBox(height: 8),
                    PasswordTextField(
                      controller: controller.passwordController,
                    ),
                    SizedBox(height: 16),
                    ElevatedButton(
                      onPressed: () {
                        if (controller.emailController.text.isEmpty) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: const Text('Email Tidak Boleh Kosong'),
                              action: SnackBarAction(
                                label: 'Ok',
                                onPressed: () {
                                  // Some code to undo the change.
                                },
                              ),
                            ),
                          );
                        } else if (controller.passwordController.text.isEmpty) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content:
                                  const Text('Password Tidak Boleh Kosong'),
                              action: SnackBarAction(
                                label: 'Ok',
                                onPressed: () {
                                  // Some code to undo the change.
                                },
                              ),
                            ),
                          );
                        } else {
                          authController.firebaseAuthLogin(
                              controller.emailController.text,
                              controller.passwordController.text);
                        }
                      },
                      child: Text("Sign In"),
                    ),
                    // const SizedBox(
                    //   height: 16,
                    // ),
                    // const Center(child: Text("Atau")),
                    // const SizedBox(
                    //   height: 16,
                    // ),
                    // ElevatedButton.icon(
                    //   onPressed: () {
                    //     authController.signInWithGoogle();
                    //   },
                    //   icon: const FaIcon(FontAwesomeIcons.google),
                    //   label: const Text(
                    //     "Masuk Dengan Google",
                    //     style: TextStyle(fontWeight: FontWeight.w700),
                    //   ),
                    //   style: ElevatedButton.styleFrom(
                    //     minimumSize: const Size.fromHeight(50),
                    //   ),
                    // ),
                    // const SizedBox(
                    //   height: 16,
                    // ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("Belum Punya Akun? "),
                    InkWell(
                      child: Text(
                        "Daftar",
                        style: TypographyTheme.bodyRegular.copyWith(
                          color: ColorsTheme.primaryColor,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      onTap: () {
                        Get.toNamed(Routes.AUTH_SIGN_UP);
                      },
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
