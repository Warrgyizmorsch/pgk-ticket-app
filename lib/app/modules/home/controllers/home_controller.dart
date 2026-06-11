import 'package:get/get.dart';

import '../../../common/constant/app_imports.dart';
import '../../../core/models/language/language_model.dart';

class HomeController extends GetxController {
  //TODO: Implement HomeController


  late ValueNotifier<LanguageModel?> selectedLanguage;

  final count = 0.obs;

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  void increment() => count.value++;
}
