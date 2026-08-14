// ignore_for_file: unnecessary_null_comparison

import '../../../common/constant/app_imports.dart';
import '../../../core/models/language/language_model.dart';
import '../../../core/utils/api/login_api/app_otp_api.dart';

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
  Future<void> _restoreSavedLanguage() async {
    final savedCode = StorageService.to.getLanguage();
    if (savedCode != null && savedCode.isNotEmpty) {
      final match = supportedLanguages.firstWhereOrNull(
            (lang) => lang.languageCode == savedCode,
      );
      if (match != null) {
        selectedLanguageId.value = match.id;
        Get.updateLocale(Locale(match.languageCode));
      }
    }
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
    _restoreSavedLanguage();
  }
  Future<void> verifyOtp(BuildContext context) async {
    String absoluteCode = otpControllers.map((c) => c.text).join();

    if (absoluteCode.length < 5) {
      CustomSnackbar.showSnackbar('Incomplete Code', 'Please enter the full 5-digit verification code.', const Color(0xFFEF4444));
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

        if (response.user != null) {
          await StorageService.to.saveUser(response.user);
        }

        if (!context.mounted) return;
        CustomSnackbar.showToast(context, 'Verified : ${response.message}',);

        Get.to(LanguageSelectionView());

      } else {
        CustomSnackbar.showSnackbar('Verification Failed', response.message, const Color(0xFFEF4444));
      }

    } catch (e) {
      CustomSnackbar.showSnackbar('Error', 'Network error. Please try again.', const Color(0xFFEF4444));
    } finally {
      isLoading.value = false;
    }
  }



  void selectLanguage(String languageId, String languageCode) {
    selectedLanguageId.value = languageId;
    Get.updateLocale(Locale(languageCode));
  }

  Future<void> confirmLanguageSelection() async {
    isLoading.value = true;

    try {
      final selectedLang = supportedLanguages.firstWhere(
              (lang) => lang.id == selectedLanguageId.value
      );

      await StorageService.to.saveLanguage(selectedLang.languageCode);
      Get.updateLocale(Locale(selectedLang.languageCode));
      Get.offAllNamed(Routes.NAV_BAR);

    } catch (e) {
      debugPrint("ERROR : $e");
    } finally {
      isLoading.value = false;
    }
  }
}