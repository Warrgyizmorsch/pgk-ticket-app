import 'package:get/get.dart';
import '../../profile/controllers/profile_controller.dart';
import '../../scanner/controllers/scanner_controller.dart';
import '../../tickets/controllers/tickets_controller.dart';
import '../controllers/nav_bar_controller.dart';


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
