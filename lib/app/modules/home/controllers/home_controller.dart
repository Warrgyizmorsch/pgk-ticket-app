import 'package:get/get.dart';

import '../../../common/constant/app_imports.dart';
import '../../../core/models/language/language_model.dart';

class HomeController extends GetxController {
  //TODO: Implement HomeController
  final List<LanguageModel> supportedLanguages = [
    LanguageModel(name: 'English', code: 'en'),
    LanguageModel(name: 'हिन्दी', code: 'hi'),
  ];

  late ValueNotifier<LanguageModel?> selectedLanguage;

  @override
  void onInit() {
    super.onInit();
    // Get the current locale or default to English
    final currentLocaleCode = Get.locale?.languageCode ?? 'en';

    // Find the matching model
    final initialLang = supportedLanguages.firstWhere(
          (lang) => lang.code == currentLocaleCode,
      orElse: () => supportedLanguages.first,
    );

    // Initialize the ValueNotifier required by your CustomDropdown
    selectedLanguage = ValueNotifier<LanguageModel?>(initialLang);
  }

  void changeLanguage(LanguageModel? language) {
    if (language != null) {
      selectedLanguage.value = language;
      // This immediately updates the app's language
      Get.updateLocale(Locale(language.code));
    }
  }
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
