import 'package:image_picker/image_picker.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../../common/constant/app_imports.dart';
import '../../../core/models/login_model/otp_verification_response_model.dart';
import '../../../core/models/profile/profile_update_payload.dart';
import '../../../core/utils/api/profile_api/profile_details_api.dart';
import '../../../services/storage_services.dart';

class ProfileController extends GetxController {
  final formKey = GlobalKey<FormState>();

  final RxBool isLoading = true.obs;
  final RxString name = ''.obs;
  final RxString email = ''.obs;
  final RxString phone = ''.obs;

  late TextEditingController nameController;
  late TextEditingController emailController;
  late TextEditingController phoneController;

  @override
  void onInit() {
    super.onInit();
    // Initialize controllers with empty strings initially
    nameController = TextEditingController();
    emailController = TextEditingController();
    phoneController = TextEditingController();

    // Fetch real user data as soon as the controller initializes
    getProfileData();
  }
  final ImagePicker _picker = ImagePicker();

  // Observable variable to store the picked image
  Rx<XFile?> profileImage = Rx<XFile?>(null);

  Future<void> pickImage() async {
    try {
      // You can change source to ImageSource.camera if you prefer
      final XFile? image = await _picker.pickImage(source: ImageSource.gallery);

      if (image != null) {
        profileImage.value = image;
      }
    } catch (e) {
      debugPrint("IMAGE PICKER ERROR: $e");
      Get.snackbar(
        'Error',
        'Failed to pick image',
        snackPosition: SnackPosition.BOTTOM,
      );
    }
  }
  /// Fetches profile data from the API and updates the UI
  Future<void> getProfileData() async {
    try {
      isLoading.value = true; // Start loading
      final UserModel? user = StorageService.to.getUser();
      name.value = user?.name ?? '';
      email.value = user?.email ?? '';
      phone.value = user?.mobile ?? '';
      final response = await ProfileDetailsApi.getProfile();

      if (response.success) {
        nameController.text = response.data.name;
        emailController.text = response.data.email;
        phoneController.text = response.data.mobile;
      } else {
        Get.snackbar(
          'Error',
          response.message ,
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.redAccent,
          colorText: Colors.white,
        );
      }
    } catch (e) {
      Get.snackbar(
        'Error',
        'An error occurred while fetching your profile.',
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.redAccent,
        colorText: Colors.white,
      );
      debugPrint('Error fetching profile: $e');
    } finally {
      isLoading.value = false; // Stop loading regardless of success or failure
    }
  }

  Future<void> openWebLink(String urlString) async {
    final Uri url = Uri.parse(urlString);

    try {
      if (!await launchUrl(url, mode: LaunchMode.externalApplication)) {
        Get.snackbar(
            'Error',
            'Could not open the webpage.',
            snackPosition: SnackPosition.BOTTOM
        );
      }
    } catch (e) {
      Get.snackbar(
          'Error',
          'An unexpected error occurred.',
          snackPosition: SnackPosition.BOTTOM
      );
    }
  }

  Future<void> saveProfile() async {
    // Validate the form before saving
    if (formKey.currentState!.validate()) {

      // 1. Get the current user ID for the payload
      final UserModel? user = StorageService.to.getUser();
      final int userId = user?.id ?? 0;

      if (userId == 0) {
        Get.snackbar('Error', 'Unable to find User ID', snackPosition: SnackPosition.BOTTOM);
        return;
      }

      final updatedName = nameController.text.trim();
      final updatedEmail = emailController.text.trim();
      final updatedPhone = phoneController.text.trim();

      // 3. Create the payload
      final payload = UserPayload(
        userId: userId,
        name: updatedName,
        email: updatedEmail,
        mobile: updatedPhone,
      );

      debugPrint('Saving: $updatedName, $updatedEmail, $updatedPhone');

      // 4. Show loading dialog
      Get.dialog(
        const Center(child: CircularProgressIndicator()),
        barrierDismissible: false,
      );

      try {
        // 5. Execute the API Call
        final response = await ProfileDetailsApi.profileUpdate(payload: payload);

        Get.back(); // Close loading dialog

        // 6. Handle the result
        if (response.success) {
          name.value = response.data.name??'';
          email.value = response.data.email??'';
          phone.value = response.data.mobile??'';
          StorageService.to.saveUser(response.data);

          Get.back();

          Get.snackbar(
            'Success',
            response.message ,
            snackPosition: SnackPosition.BOTTOM,
            backgroundColor: Colors.green,
            colorText: Colors.white,
            margin: const EdgeInsets.all(16),
          );
        } else {
          Get.snackbar(
            'Error',
            response.message ,
            snackPosition: SnackPosition.BOTTOM,
            backgroundColor: Colors.redAccent,
            colorText: Colors.white,
            margin: const EdgeInsets.all(16),
          );
        }
      } catch (e) {
        Get.back();
        Get.snackbar(
          'Error',
          'An error occurred while saving your profile.',
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.redAccent,
          colorText: Colors.white,
          margin: const EdgeInsets.all(16),
        );
        debugPrint('Save Profile Error: $e');
      }
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