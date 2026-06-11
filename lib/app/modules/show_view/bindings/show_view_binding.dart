import 'package:get/get.dart';

import '../controllers/show_view_controller.dart';

class ShowViewBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ShowViewController>(
      () => ShowViewController(),
    );
  }
}
