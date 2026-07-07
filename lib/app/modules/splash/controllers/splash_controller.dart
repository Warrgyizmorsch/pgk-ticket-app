import 'package:pgk_ticket_app/app/core/models/login_model/otp_verification_response_model.dart';

import '../../../common/constant/app_imports.dart';
import '../../../services/storage_services.dart';


class SplashController extends GetxController {
  @override
  void onReady() {
    super.onReady();
    _navigateToNextScreen();
  }

  Future<void> _navigateToNextScreen() async {
    await Future.delayed(const Duration(seconds: 3));

    final String? token = StorageService.to.getToken();
    final UserModel? user = StorageService.to.getUser();
    debugPrint('Token: $token');
    debugPrint('USER ID: ${user?.id??0}');
    final String? savedLanguage = StorageService.to.getLanguage();
 if (savedLanguage != null) {
   Get.updateLocale(Locale(savedLanguage));
 }
    if (token != null && token.isNotEmpty) {
      Get.offNamed(Routes.NAV_BAR);
    } else {
      Get.offNamed(Routes.LOGIN);
    }
  }
}