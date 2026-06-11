import 'package:get/get.dart';

import '../../../common/constant/app_imports.dart';

class SplashController extends GetxController {
  @override
  void onReady() {
    super.onReady();
    _navigateToNextScreen();
  }

  /// Handles routing logic after initial app loading configurations are met
  Future<void> _navigateToNextScreen() async {
    // Standard professional delay hold for branding recognition visibility
    await Future.delayed(const Duration(seconds: 3));

    Get.offNamed(Routes.LOGIN);

  }
}