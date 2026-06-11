import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../routes/app_pages.dart';

class LoginController extends GetxController {
  // ─── State Variables ───────────────────────────────────────────────────────
  /// Stores the selected dial code from the CountryCodePicker (Defaults to India '+91')
  final selectedDialCode = '+91'.obs;

  /// Controls the loading state during API operations (Get OTP / Google Login)
  final isLoading = false.obs;

  // ─── Controllers & Form Keys ───────────────────────────────────────────────
  /// Controller to manage and retrieve phone number text input
  late TextEditingController phoneController;

  /// Global form key for input validation constraints
  final loginFormKey = GlobalKey<FormState>();

  @override
  void onInit() {
    super.onInit();
    phoneController = TextEditingController();
  }

  @override
  void onClose() {
    phoneController.dispose();
    super.onClose();
  }
  /// Validates input criteria for a 10-digit mobile number.
  String? validatePhoneNumber(String? value) {
    // Remove trailing and leading whitespaces
    final cleanValue = value?.trim() ?? '';

    // Requirement Check: Empty field validation
    if (cleanValue.isEmpty) {
      return 'Please enter your mobile phone number';
    }

    // Length Check: Ensures the input is exactly 10 digits long
    if (cleanValue.length != 10) {
      return 'Please enter a valid 10-digit phone number';
    }

    // Content Check: Regular expression checking if input consists purely of digits [0-9]
    if (!RegExp(r'^\d{10}$').hasMatch(cleanValue)) {
      return 'Phone number must only contain numeric digits';
    }

    // Returns null if the value passes all security/formatting validation constraints
    return null;
  }
  // ─── Business Logic Methods ────────────────────────────────────────────────

  /// Validates input criteria and requests an OTP code
  Future<void> getOtp() async {
    final phone = phoneController.text.trim();

    // Basic Input Validation
    if (phone.isEmpty) {
      Get.snackbar(
        'Required Field',
        'Please enter your mobile phone number to proceed.',
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.redAccent,
        colorText: Colors.white,
      );
      return;
    }

    if (phone.length < 10) {
      Get.snackbar(
        'Invalid Input',
        'Please enter a valid 10-digit phone number.',
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.redAccent,
        colorText: Colors.white,
      );
      return;
    }

    try {
      isLoading.value = true;

      // Combine full international phone data string
      final fullPhoneNumber = '${selectedDialCode.value}$phone';

      // TODO: Connect your repository or API endpoint authentication provider here
      // await _authRepository.requestPhoneOtp(fullPhoneNumber);

      await Future.delayed(const Duration(seconds: 2)); // Simulating network latency

      Get.snackbar(
        'Success',
        'OTP code sent successfully to $fullPhoneNumber',
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.green,
        colorText: Colors.white,
      );

      // Navigate to your OTP Verification Screen if needed:
      Get.toNamed(Routes.OTP, arguments: fullPhoneNumber);

    } catch (e) {
      Get.snackbar(
        'Error',
        'Failed to request verification code. Please try again.',
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.redAccent,
        colorText: Colors.white,
      );
    } finally {
      isLoading.value = false;
    }
  }

  /// Triggers single sign-on authentication through OAuth credentials
  Future<void> loginWithGoogle() async {
    try {
      isLoading.value = true;

      // TODO: Inject Google Sign In SDK login configurations here
      // final userCredential = await _authRepository.signInWithGoogle();

      await Future.delayed(const Duration(seconds: 2)); // Simulating network latency

      // Redirect on successful authentication flow completion:
      // Get.offAllNamed('/home');

    } catch (e) {
      Get.snackbar(
        'Authentication Failed',
        'Google login was canceled or encountered an internal issue.',
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.redAccent,
        colorText: Colors.white,
      );
    } finally {
      isLoading.value = false;
    }
  }
}