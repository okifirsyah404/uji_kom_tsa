import 'package:get/get.dart';

import '../modules/auth/sign_in/bindings/auth_sign_in_binding.dart';
import '../modules/auth/sign_in/views/auth_sign_in_view.dart';
import '../modules/auth/sign_up/bindings/auth_sign_up_binding.dart';
import '../modules/auth/sign_up/views/auth_sign_up_view.dart';
import '../modules/geo_location/bindings/geo_location_binding.dart';
import '../modules/geo_location/views/geo_location_view.dart';
import '../modules/home/bindings/home_binding.dart';
import '../modules/home/views/home_view.dart';
import '../modules/profile/bindings/profile_binding.dart';
import '../modules/profile/views/profile_view.dart';
import '../modules/setting_profile/bindings/setting_profile_binding.dart';
import '../modules/setting_profile/views/setting_profile_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.HOME;

  static final routes = [
    GetPage(
      name: _Paths.HOME,
      page: () => HomeView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: _Paths.AUTH_SIGN_IN,
      page: () => AuthSignInView(),
      binding: AuthSignInBinding(),
    ),
    GetPage(
      name: _Paths.AUTH_SIGN_UP,
      page: () => AuthSignUpView(),
      binding: AuthSignUpBinding(),
    ),
    GetPage(
      name: _Paths.GEO_LOCATION,
      page: () => const GeoLocationView(),
      binding: GeoLocationBinding(),
    ),
    GetPage(
      name: _Paths.PROFILE,
      page: () => ProfileView(),
      binding: ProfileBinding(),
    ),
    GetPage(
      name: _Paths.SETTING_PROFILE,
      page: () => SettingProfileView(),
      binding: SettingProfileBinding(),
    ),
  ];
}
