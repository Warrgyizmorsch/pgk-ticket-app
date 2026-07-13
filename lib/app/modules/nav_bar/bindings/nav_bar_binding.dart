import '../../../common/constant/app_imports.dart';


class NavBarBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<NavBarController>(
      () => NavBarController(),
    );
    Get.lazyPut<ScannerController>(() => ScannerController(), fenix: true);
    Get.lazyPut<TicketsController>(() => TicketsController(), fenix: true);
    Get.lazyPut<ProfileController>(() => ProfileController(), fenix: true);
  }

}
