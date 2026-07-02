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

    if (token != null && token.isNotEmpty) {
      Get.offNamed(Routes.NAV_BAR);
    } else {
      Get.offNamed(Routes.LOGIN);
    }
  }
}