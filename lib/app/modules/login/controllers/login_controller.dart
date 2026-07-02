import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import '../../../core/utils/api/login_api/app_otp_api.dart';
import '../../../routes/app_pages.dart';
import '../../../services/storage_services.dart';

class LoginController extends GetxController {
  final selectedDialCode = '+91'.obs;

  final isLoading = false.obs;

  late TextEditingController phoneController;

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
    final cleanValue = value?.trim() ?? '';

    if (cleanValue.isEmpty) {
      return 'Please enter your mobile phone number';
    }

    if (cleanValue.length != 10) {
      return 'Please enter a valid 10-digit phone number';
    }

    if (!RegExp(r'^\d{10}$').hasMatch(cleanValue)) {
      return 'Phone number must only contain numeric digits';
    }

    return null;
  }

  Future<void> getOtp() async {
    final phone = phoneController.text.trim();

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
        snackPosition: SnackPosition.TOP,
        backgroundColor: Colors.redAccent,
        colorText: Colors.white,
      );
      return;
    }

    try {
      isLoading.value = true;

      final fullPhoneNumber = '${selectedDialCode.value}$phone';

      final requestData = {'mobile': phone};
      //
      await AppLogin.requestPhoneOtp(data: requestData);

      Get.snackbar(
        'Success',
        'OTP code sent successfully to $fullPhoneNumber',
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.green,
        colorText: Colors.white,
      );

      Get.toNamed(Routes.OTP, arguments: phone);
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



  Future<void> loginWithGoogle() async {
    try {
      isLoading.value = true;

      final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

      if (googleUser == null) {
        isLoading.value = false;
        return;
      }

      final GoogleSignInAuthentication googleAuth = await googleUser.authentication;
      final AuthCredential credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );

      final UserCredential userCredential = await FirebaseAuth.instance.signInWithCredential(credential);
      final user = userCredential.user;

      if (user == null) {
        throw Exception('Failed to retrieve user from Firebase.');
      }

      // 1. Check if the user is brand new or returning
      final bool isNewUser = userCredential.additionalUserInfo?.isNewUser ?? false;

      // 2. Get the FIREBASE ID Token
      final String? firebaseIdToken = await user.getIdToken();

      if (firebaseIdToken == null) {
        throw Exception('Failed to retrieve Firebase ID Token.');
      }

      // 3. Branch your logic based on user status
      if (isNewUser) {
        // ---------------------------------------------------------
        // SCENARIO A: NEW USER
        // ---------------------------------------------------------
        // The user just created their account right now via Google.
        // You can navigate them to an onboarding/registration screen
        // and pass the token so you can save it later.

        Get.offAllNamed(Routes.HOME, arguments: {
          'id_token': firebaseIdToken,
          'email': user.email,
          'name': user.displayName,
        });

        /* * OR, if your backend handles registration directly via an API call,
       * you would call your AppLogin.googleRegister() endpoint here instead.
       */

      } else {
        // ---------------------------------------------------------
        // SCENARIO B: EXISTING USER (Just get the token and login)
        // ---------------------------------------------------------
        final requestData = {
          'id_token': firebaseIdToken,
        };

        final authResponse = await AppLogin.googleLogin(data: requestData);

        if (authResponse.success == true && authResponse.token != null) {
          await StorageService.to.saveToken(authResponse.token);

          if (authResponse.user != null) {
            await StorageService.to.saveUser(authResponse.user);
          }

          await Future.delayed(const Duration(seconds: 2));
          Get.offAllNamed(Routes.HOME);

        } else {
          Get.snackbar(
            'Login Failed',
            'Failed to authenticate with our servers.',
            snackPosition: SnackPosition.BOTTOM,
            backgroundColor: Colors.redAccent,
            colorText: Colors.white,
          );
        }
      }

    } on FirebaseAuthException catch (e) {
      Get.snackbar(
        'Authentication Failed',
        e.message ?? 'An unknown Firebase error occurred.',
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.redAccent,
        colorText: Colors.white,
      );
    } catch (e) {
      Get.snackbar(
        'Error',
        'Google login encountered an internal issue. $e',
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.redAccent,
        colorText: Colors.white,
      );
    } finally {
      isLoading.value = false;
    }
  }
}
