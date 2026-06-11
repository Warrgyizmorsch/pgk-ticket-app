import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../core/models/language/language_model.dart';
import '../../../routes/app_pages.dart';
import '../widget/language_selection.dart'; // Adjust path based on your directory structure

class OtpController extends GetxController {
  // ─── Existing OTP State Trackers ──────────────────────────────────────────
  final isLoading = false.obs;
  final List<TextEditingController> otpControllers = List.generate(5, (_) => TextEditingController());
  final List<FocusNode> otpFocusNodes = List.generate(5, (_) => FocusNode());

  // ─── Integrated Language State Section ─────────────────────────────────────
  /// Tracks the currently active selected language key (Defaults to English 'en')
  final selectedLanguageId = 'en'.obs;

  /// Your requested dataset array for Hindi, English, and Gujarati
  final List<LanguageModel> supportedLanguages = const [
    LanguageModel(id: 'hi', name: 'Hindi', nativeName: 'हिंदी', languageCode: 'hi'),
    LanguageModel(id: 'en', name: 'English', nativeName: 'English', languageCode: 'en'),
    LanguageModel(id: 'gu', name: 'Gujarati', nativeName: 'ગુજરાતી', languageCode: 'gu'),
  ];

  @override
  void onClose() {
    for (var controller in otpControllers) {
      controller.dispose();
    }
    for (var node in otpFocusNodes) {
      node.dispose();
    }
    super.onClose();
  }

  // ─── Existing OTP UI Methods ───────────────────────────────────────────────
  void handleOtpInput(String value, int index) {
    if (value.length == 1 && index < 4) {
      otpFocusNodes[index + 1].requestFocus();
    } else if (value.isEmpty && index > 0) {
      otpFocusNodes[index - 1].requestFocus();
    }
  }

  Future<void> verifyOtp() async {
    String absoluteCode = otpControllers.map((c) => c.text).join();

    if (absoluteCode.length < 5) {
      Get.snackbar(
        'Incomplete Code',
        'Please enter the full 5-digit verification security token code.',
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: const Color(0xFFEF4444),
        colorText: Colors.white,
      );
      return;
    }

    try {
      isLoading.value = true;

      // Simulate network API validation delay
      await Future.delayed(const Duration(seconds: 2));

      Get.snackbar(
        'Verified',
        'OTP Verification Successful!',
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: const Color(0xFF22C55E),
        colorText: Colors.white,
      );

      Get.to(LanguageSelectionView());
    } finally {
      isLoading.value = false;
    }
  }

  // ─── Integrated Language Methods ───────────────────────────────────────────
  /// Updates the active choice selection code reactive state
  void selectLanguage(String languageId, String languageCode) {
    selectedLanguageId.value = languageId;
    Get.updateLocale(Locale(languageCode));
  }

  /// Consolidates global user adjustments and transitions downstream views
  Future<void> confirmLanguageSelection() async {
    try {
      isLoading.value = true;
      final selectedLang = supportedLanguages.firstWhere((lang) => lang.id == selectedLanguageId.value);

      Get.updateLocale(Locale(selectedLang.languageCode));

      await Future.delayed(const Duration(milliseconds: 500));
      Get.toNamed(Routes.NAV_BAR);
    } finally {
      isLoading.value = false;
    }
  }
}