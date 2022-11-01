import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'package:get/get.dart';
import 'package:uji_kom_tsa/app/modules/auth/controllers/auth_controller.dart';

import '../../../../routes/app_pages.dart';
import '../../../global/themes/color_theme.dart';
import '../../../global/themes/typography_theme.dart';
import '../../../global/widgets/text_field/password_text_field/password_text_field.dart';
import '../../../global/widgets/text_field/regular_text_field/regular_text_field.dart';
import '../../controllers/auth_controller.dart';
import '../controllers/auth_sign_up_controller.dart';

class AuthSignUpView extends GetView<AuthSignUpController> {
  AuthSignUpView({Key? key}) : super(key: key);

  AuthController authController = Get.find<AuthController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
            child: CustomScrollView(
          slivers: [
            SliverFillRemaining(
              hasScrollBody: false,
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
                          'SIGN UP',
                          style: TypographyTheme.titleLarge.copyWith(
                            fontWeight: FontWeight.w600,
                            color: ColorsTheme.primaryColor,
                          ),
                        ),
                        Text(
                          'Silahkan sign up untuk melanjutkan',
                        ),
                      ],
                    ),
                    Column(
                      children: [
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
                        PasswordTextField(
                            controller: controller.passwordController),
                        SizedBox(height: 8),
                        RegularTextField(
                          controller: controller.phoneNumberController,
                          label: "Telephone",
                          suffixIcon: FaIcon(FontAwesomeIcons.phone),
                          keyboardType: TextInputType.number,
                        ),
                        SizedBox(height: 16),
                        ElevatedButton(
                          onPressed: () {
                            if (controller.fullNameController.text.isEmpty) {
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                  content: const Text(
                                      'Nama Lengkap Tidak Boleh Kosong'),
                                  action: SnackBarAction(
                                    label: 'Ok',
                                    onPressed: () {
                                      // Some code to undo the change.
                                    },
                                  ),
                                ),
                              );
                            } else if (controller
                                .emailController.text.isEmpty) {
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                  content:
                                      const Text('Email Tidak Boleh Kosong'),
                                  action: SnackBarAction(
                                    label: 'Ok',
                                    onPressed: () {
                                      // Some code to undo the change.
                                    },
                                  ),
                                ),
                              );
                            } else if (controller
                                .passwordController.text.isEmpty) {
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
                            } else if (controller
                                .phoneNumberController.text.isEmpty) {
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                  content: const Text(
                                      'Nomor Hanphone Tidak Boleh Kosong'),
                                  action: SnackBarAction(
                                    label: 'Ok',
                                    onPressed: () {
                                      // Some code to undo the change.
                                    },
                                  ),
                                ),
                              );
                            } else {
                              authController.firebaseAuthSignUp(
                                email: controller.emailController.text,
                                fullName: controller.fullNameController.text,
                                password: controller.passwordController.text,
                                phone: controller.phoneNumberController.text,
                              );
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
                        //     "Daftar Dengan Google",
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
                        Text("Sudah Punya Akun? "),
                        InkWell(
                          child: Text(
                            "Login",
                            style: TypographyTheme.bodyRegular.copyWith(
                              color: ColorsTheme.primaryColor,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          onTap: () {
                            Get.toNamed(Routes.AUTH_SIGN_IN);
                          },
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            )
          ],
        )),
      ),
    );
  }
}
