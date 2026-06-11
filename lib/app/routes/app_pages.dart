import 'package:get/get.dart';

import '../modules/history/bindings/history_binding.dart';
import '../modules/history/views/history_view.dart';
import '../modules/home/bindings/home_binding.dart';
import '../modules/home/views/home_view.dart';
import '../modules/language/bindings/language_binding.dart';
import '../modules/language/views/language_view.dart';
import '../modules/login/bindings/login_binding.dart';
import '../modules/login/views/login_view.dart';
import '../modules/nav_bar/bindings/nav_bar_binding.dart';
import '../modules/nav_bar/views/nav_bar_view.dart';
import '../modules/otp/bindings/otp_binding.dart';
import '../modules/otp/views/otp_view.dart';
import '../modules/scanner/bindings/scanner_binding.dart';
import '../modules/scanner/views/scanner_view.dart';
import '../modules/settings/bindings/settings_binding.dart';
import '../modules/settings/views/settings_view.dart';
import '../modules/show_view/bindings/show_view_binding.dart';
import '../modules/show_view/views/show_view_view.dart';
import '../modules/signup/bindings/signup_binding.dart';
import '../modules/signup/views/signup_view.dart';
import '../modules/splash/bindings/splash_binding.dart';
import '../modules/splash/views/splash_view.dart';
import '../modules/tickets/bindings/tickets_binding.dart';
import '../modules/tickets/views/tickets_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.SPLASH;

  static final routes = [
    GetPage(
      name: _Paths.HOME,
      page: () => const HomeView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: _Paths.NAV_BAR,
      page: () => const NavBarView(),
      binding: NavBarBinding(),
    ),
    GetPage(
      name: _Paths.SIGNUP,
      page: () => const SignupView(),
      binding: SignupBinding(),
    ),
    GetPage(
      name: _Paths.LOGIN,
      page: () => const LoginView(),
      binding: LoginBinding(),
    ),
    GetPage(
      name: _Paths.SETTINGS,
      page: () => const SettingsView(),
      binding: SettingsBinding(),
    ),
    GetPage(
      name: _Paths.SPLASH,
      page: () => const SplashView(),
      binding: SplashBinding(),
    ),
    GetPage(
      name: _Paths.OTP,
      page: () => const OtpView(),
      binding: OtpBinding(),
    ),
    GetPage(
      name: _Paths.LANGUAGE,
      page: () => const LanguageView(),
      binding: LanguageBinding(),
    ),
    GetPage(
      name: _Paths.SHOW_VIEW,
      page: () => const ShowViewView(),
      binding: ShowViewBinding(),
    ),
    GetPage(
      name: _Paths.SCANNER,
      page: () => const ScannerView(),
      binding: ScannerBinding(),
    ),
    GetPage(
      name: _Paths.TICKETS,
      page: () => const TicketsView(),
      binding: TicketsBinding(),
    ),
    GetPage(
      name: _Paths.HISTORY,
      page: () => const HistoryView(),
      binding: HistoryBinding(),
    ),
  ];
}
