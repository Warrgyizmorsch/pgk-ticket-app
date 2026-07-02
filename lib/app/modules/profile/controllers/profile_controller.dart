import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../common/constant/app_imports.dart';

class ProfileController extends GetxController {
  //TODO: Implement ProfileController
  final formKey = GlobalKey<FormState>();

  // Text Controllers pre-filled with existing user data
  late TextEditingController nameController;
  late TextEditingController emailController;
  late TextEditingController phoneController;

  @override
  void onInit() {
    super.onInit();
    // Initialize with current user data (Replace with actual data source)
    nameController = TextEditingController(text: 'Rohit Kumar');
    emailController = TextEditingController(text: 'rohit.kumar@example.com');
    phoneController = TextEditingController(text: '+91 9876543210');
  }
  Future<void> openWebLink(String urlString) async {
    final Uri url = Uri.parse(urlString);

    try {
      // LaunchMode.externalApplication opens it in the phone's default browser (Chrome/Safari)
      if (!await launchUrl(url, mode: LaunchMode.externalApplication)) {
        Get.snackbar('Error', 'Could not open the webpage.', snackPosition: SnackPosition.BOTTOM);
      }
    } catch (e) {
      Get.snackbar('Error', 'An unexpected error occurred.', snackPosition: SnackPosition.BOTTOM);
    }
  }
  void saveProfile() {
    // Validate the form before saving
    if (formKey.currentState!.validate()) {
      // TODO: Implement your API / Storage save logic here

      // Simulate network delay
      Get.dialog(const Center(child: CircularProgressIndicator()), barrierDismissible: false);
      Future.delayed(const Duration(seconds: 1), () {
        Get.back(); // Close loading dialog
        Get.back(); // Navigate back to Profile View

        Get.snackbar(
          'Success',
          'Profile updated successfully',
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.green,
          colorText: Colors.white,
          margin: const EdgeInsets.all(16),
        );
      });
    }
  }

  @override
  void onClose() {
    // Dispose controllers to prevent memory leaks
    nameController.dispose();
    emailController.dispose();
    phoneController.dispose();
    super.onClose();
  }
}
