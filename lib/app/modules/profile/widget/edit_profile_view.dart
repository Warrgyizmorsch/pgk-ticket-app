import 'dart:io';
import '../../../common/constant/app_imports.dart';
import '../controllers/profile_controller.dart';

class EditProfileView extends GetView<ProfileController> {
  const EditProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    // Initialize AppLocalizations
    final l10n = AppLocalizations.of(context)!;

    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: CustomAppBar(
        title: l10n.editProfileTitle,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24.0),
        child: Form(
          key: controller.formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // ─── Editable Avatar Section ───
              _buildAvatarEditor(),
              const SizedBox(height: 40),

              // ─── Form Fields ───
              _buildCustomField(
                label: l10n.fullNameLabel,
                hint: l10n.enterFullNameHint,
                textController: controller.nameController,
                icon: Icons.person_outline,
                isRequired: true,
                validator: (value) {
                  if (value == null || value.isEmpty) return l10n.nameEmptyError;
                  return null;
                },
              ),
              const SizedBox(height: 20),

              _buildCustomField(
                label: l10n.emailLabel,
                hint: l10n.enterEmailHint,
                textController: controller.emailController,
                icon: Icons.email_outlined,
                keyboardType: TextInputType.emailAddress,
                isRequired: true,
                validator: (value) {
                  if (value == null || !value.contains('@')) return l10n.invalidEmailError;
                  return null;
                },
              ),
              const SizedBox(height: 20),

              // Phone field explicitly set to readOnly
              _buildCustomField(
                label: l10n.phoneLabel,
                hint: l10n.enterPhoneHint,
                textController: controller.phoneController,
                icon: Icons.phone_outlined,
                keyboardType: TextInputType.phone,
                readOnly: true,
              ),
              const SizedBox(height: 40),

              // ─── Save Button ───
              SizedBox(
                width: double.infinity,
                height: 54,
                child: ElevatedButton(
                  onPressed: controller.saveProfile,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.primary,
                    elevation: 0,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16),
                    ),
                  ),
                  child: Text(
                    l10n.saveChangesBtn,
                    style: AppTextStyles.button,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // ─── Helper: Custom Field using Provided Standardized Widgets ───
  Widget _buildCustomField({
    required String label,
    required String hint,
    required TextEditingController textController,
    required IconData icon,
    TextInputType keyboardType = TextInputType.text,
    String? Function(String?)? validator,
    bool isRequired = false,
    bool readOnly = false,
  }) {
    return TextFormFieldCustom(
      title: label,
      isRequired: isRequired,
      method: TextFieldCustom(
        controller: textController,
        hintText: hint,
        textInputType: keyboardType,
        validator: validator,
        readOnly: readOnly,
        backgroundColor: AppColors.white,
        borderColor: AppColors.transparent, // Prevents double-borders if shadowed
        prefixIcon: Icon(icon, color: AppColors.textSecondary, size: 22),
      ),
    );
  }

  // ─── Helper: Avatar Editor ───
  Widget _buildAvatarEditor() {
    return Stack(
      alignment: Alignment.bottomRight,
      children: [
        // Wrapped in Obx to update when an image is picked
        Obx(() => Container(
          width: 120,
          height: 120,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: AppColors.primary.withValues(alpha: 0.1),
            border: Border.all(color: AppColors.primary, width: 2),
            boxShadow: const [
              BoxShadow(
                color: AppColors.lightShadow,
                blurRadius: 10,
                offset: Offset(0, 4),
              ),
            ],
            // Display the image if one is selected
            image: controller.profileImage.value != null
                ? DecorationImage(
              image: FileImage(File(controller.profileImage.value!.path)),
              fit: BoxFit.cover,
            )
                : null,
          ),
          // Fallback to the icon if no image is selected
          child: controller.profileImage.value == null
              ? const Icon(
            Icons.person,
            size: 60,
            color: AppColors.primary,
          )
              : null,
        )),
        // Camera Action Button
        GestureDetector(
          onTap: () {
            // Triggers the image picker from the controller
            controller.pickImage();
          },
          child: Container(
            height: 40,
            width: 40,
            decoration: BoxDecoration(
              color: AppColors.primary,
              shape: BoxShape.circle,
              border: Border.all(color: AppColors.white, width: 3),
              boxShadow: const [
                BoxShadow(
                  color: AppColors.lightShadow,
                  blurRadius: 8,
                  offset: Offset(0, 2),
                ),
              ],
            ),
            child: const Icon(Icons.camera_alt, size: 20, color: AppColors.white),
          ),
        ),
      ],
    );
  }
}