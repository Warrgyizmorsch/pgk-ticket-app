import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../core/models/language/language_model.dart';
import '../../../core/utils/api/login_api/app_otp_api.dart';
import '../../../routes/app_pages.dart';
import '../../../services/storage_services.dart';
import '../widget/language_selection.dart'; // Adjust path based on your directory structure

class OtpController extends GetxController {
  final isLoading = false.obs;
  final List<TextEditingController> otpControllers = List.generate(5, (_) => TextEditingController());
  final List<FocusNode> otpFocusNodes = List.generate(5, (_) => FocusNode());
  String mobileNumber = '';
  final selectedLanguageId = 'en'.obs;

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

  void handleOtpInput(String value, int index) {
    if (value.length == 1 && index < 4) {
      otpFocusNodes[index + 1].requestFocus();
    } else if (value.isEmpty && index > 0) {
      otpFocusNodes[index - 1].requestFocus();
    }
  }
  @override
  void onInit() {
    super.onInit();
    if (Get.arguments != null) {
      mobileNumber = Get.arguments as String;
    }
  }
  Future<void> verifyOtp() async {
    String absoluteCode = otpControllers.map((c) => c.text).join();

    if (absoluteCode.length < 5) {
      _showSnackbar('Incomplete Code', 'Please enter the full 5-digit verification code.', const Color(0xFFEF4444));
      return;
    }

    try {
      isLoading.value = true;

      final requestData = {
        "mobile": mobileNumber,
        "otp": absoluteCode,
      };

      final response = await AppLogin.verifyOtp(data: requestData);

      if (response.success && response.token != null) {

        await StorageService.to.saveToken(response.token!);

        // Save the user data if it exists
        if (response.user != null) {
          await StorageService.to.saveUser(response.user);
        }

        _showSnackbar('Verified', response.message, const Color(0xFF22C55E));

        // Clear navigation stack and go to Language Selection
        Get.to(LanguageSelectionView());

      } else {
        // The API returned success: false, show the backend's error message
        _showSnackbar('Verification Failed', response.message, const Color(0xFFEF4444));
      }

    } catch (e) {
      // Handle network drops or 500 server errors
      _showSnackbar('Error', 'Network error. Please try again.', const Color(0xFFEF4444));
    } finally {
      isLoading.value = false;
    }
  }

// Re-using the helper method from earlier
  void _showSnackbar(String title, String message, Color bgColor) {
    Get.snackbar(
      title,
      message,
      snackPosition: SnackPosition.BOTTOM,
      backgroundColor: bgColor,
      colorText: Colors.white,
      margin: const EdgeInsets.all(10),
    );
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