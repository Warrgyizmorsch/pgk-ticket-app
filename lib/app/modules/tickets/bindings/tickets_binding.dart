import 'package:get/get.dart';

import '../../payment/controllers/payment_controller.dart';
import '../controllers/tickets_controller.dart';

class TicketsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<TicketsController>(
      () => TicketsController(),
    ); Get.lazyPut<PaymentController>(
      () => PaymentController(),fenix: true
    );
  }
}
