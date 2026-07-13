import '../../../common/constant/app_imports.dart';
import '../../../core/utils/api/login_api/app_otp_api.dart';


class LoginController extends GetxController {
  final selectedDialCode = '+91'.obs;
  final isLoading = false.obs;

  late TextEditingController phoneController;
  final loginFormKey = GlobalKey<FormState>();

  // Initialize instances for cleaner calls
  final GoogleSignIn _googleSignIn = GoogleSignIn();
  final FirebaseAuth _auth = FirebaseAuth.instance;

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
      CustomSnackbar.showSnackbar(
        'Required Field',
        'Please enter your mobile phone number to proceed.',
        AppColors.error,
      );
      return;
    }

    if (phone.length < 10) {
      CustomSnackbar.showSnackbar(
        'Invalid Input',
        'Please enter a valid 10-digit phone number.',
        AppColors.error,
      );
      return;
    }

    try {
      isLoading.value = true;

      final fullPhoneNumber = '${selectedDialCode.value}$phone';
      final requestData = {'mobile': phone};

      final response = await AppLogin.requestPhoneOtp(data: requestData);

      if (response.success == true) {
        CustomSnackbar.showSnackbar(
          'Success',
          '${response.message} to $fullPhoneNumber',
          Colors.green,
        );

        Get.toNamed(Routes.OTP, arguments: phone);
      } else {
        CustomSnackbar.showSnackbar(
          'Failed',
          response.message ?? 'Failed to request verification code.',
          AppColors.error,
        );
      }
    } catch (e) {
      CustomSnackbar.showSnackbar(
        'Error',
        'Failed to request verification code. Please try again.',
        AppColors.error,
      );
    } finally {
      isLoading.value = false;
    }
  }

  /// -------------------------------------------------------------------
  /// UPDATED GOOGLE SIGN IN LOGIC
  /// -------------------------------------------------------------------
  Future<void> loginWithGoogle() async {
    // Prevent multiple rapid clicks
    if (isLoading.value) return;

    try {
      isLoading.value = true;
      debugPrint("========== GOOGLE SIGN IN START ==========");

      // 1. Clear previous session to open the Google account picker
      await _googleSignIn.signOut();
      debugPrint("OLD GOOGLE SESSION CLEARED");

      // 2. Open Google Account Picker
      final GoogleSignInAccount? googleUser = await _googleSignIn.signIn();

      if (googleUser == null) {
        debugPrint("USER CANCELLED LOGIN");
        isLoading.value = false;
        return;
      }

      debugPrint("SELECTED EMAIL : ${googleUser.email}");

      // 3. Authenticate with Google
      final GoogleSignInAuthentication googleAuth =
          await googleUser.authentication;
      final String idToken = googleAuth.idToken ?? "";

      if (idToken.isEmpty) {
        CustomSnackbar.showSnackbar(
          'Error',
          'Google ID Token not found',
          AppColors.error,
        );

        isLoading.value = false;
        return;
      }

      // 4. Create Firebase Credential
      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: idToken,
      );

      // 5. Sign in to Firebase
      final UserCredential userCredential = await _auth.signInWithCredential(
        credential,
      );
      final User? user = userCredential.user;

      if (user != null) {
        final bool isNewUser =
            userCredential.additionalUserInfo?.isNewUser ?? false;

        if (isNewUser) {
          // ---------------------------------------------------------
          // SCENARIO A: NEW USER
          // ---------------------------------------------------------
          // Note: If you have a specific registration route now (like AppRoutes.registerAccountScreen),
          // update Routes.HOME to that route name.
          Get.offAllNamed(
            Routes.HOME,
            arguments: {
              'id_token': idToken,
              'email': googleUser.email,
              'name': googleUser.displayName ?? "",
              'phone': user.phoneNumber ?? "", // Usually empty on Google Login
            },
          );
        } else {
          // ---------------------------------------------------------
          // SCENARIO B: EXISTING USER
          // ---------------------------------------------------------
          // Fetch FCM Token (Requires firebase_messaging package)
          final fcmToken = await FirebaseMessaging.instance.getToken();

          final requestData = {
            'id_token':
                idToken, // using idToken instead of firebaseIdToken for consistency
            'fcm_token': fcmToken,
          };

          final authResponse = await AppLogin.googleLogin(data: requestData);

          if (authResponse.success == true && authResponse.token != null) {
            // Save Session
            await StorageService.to.saveToken(authResponse.token);
            if (authResponse.user != null) {
              await StorageService.to.saveUser(authResponse.user);
            }

            debugPrint("API LOGIN SUCCESS");
            Get.offAllNamed(Routes.HOME);
          } else {
            // Optional: Logout of Firebase/Google if your API login fails
            await _auth.signOut();
            await _googleSignIn.signOut();

            CustomSnackbar.showSnackbar(
              'Login Failed',
              'Failed to authenticate with our servers.',
              AppColors.error,
            );
          }
        }
      } else {
        CustomSnackbar.showSnackbar(
          'Error',
          'Firebase user not found',
          AppColors.error,
        );
      }
    } on FirebaseAuthException catch (e) {

      CustomSnackbar.showSnackbar(
        'Authentication Failed',
        e.message ?? 'An unknown Firebase error occurred.',
          AppColors.error,
      );
    } catch (e) {
      debugPrint("GOOGLE LOGIN ERROR : $e");
      CustomSnackbar.showSnackbar(
        'Error',
        'Google Sign-In failed.',
        AppColors.error,
      );
    } finally {
      isLoading.value = false;
    }
  }

  /// -------------------------------------------------------------------
  /// LOGOUT LOGIC (Optional helper method)
  /// -------------------------------------------------------------------
  Future<void> signOutGoogle() async {
    try {
      await _googleSignIn.signOut();
      await _auth.signOut();
      debugPrint("LOGOUT SUCCESS");
    } catch (e) {
      debugPrint("LOGOUT ERROR : $e");
    }
  }
}
