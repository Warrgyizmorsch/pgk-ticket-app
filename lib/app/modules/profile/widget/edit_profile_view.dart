import '../../../common/constant/app_imports.dart';
import '../controllers/profile_controller.dart';

class EditProfileView extends GetView<ProfileController> {
  const EditProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background, // Uses your creamy background
      appBar: const CustomAppBar(
        title: 'Edit Profile',
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
              _buildTextField(
                label: 'FULL NAME',
                hint: 'Enter your full name',
                textController: controller.nameController,
                icon: Icons.person_outline,
                validator: (value) {
                  if (value == null || value.isEmpty) return 'Name cannot be empty';
                  return null;
                },
              ),
              const SizedBox(height: 20),

              _buildTextField(
                label: 'EMAIL ADDRESS',
                hint: 'Enter your email',
                textController: controller.emailController,
                icon: Icons.email_outlined,
                keyboardType: TextInputType.emailAddress,
                validator: (value) {
                  if (value == null || !value.contains('@')) return 'Enter a valid email';
                  return null;
                },
              ),
              const SizedBox(height: 20),

              _buildTextField(
                label: 'PHONE NUMBER',
                hint: 'Enter your phone number',
                textController: controller.phoneController,
                icon: Icons.phone_outlined,
                keyboardType: TextInputType.phone,
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
                  child: const Text(
                    'Save Changes',
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

  // ─── Helper: Avatar Editor ───
  Widget _buildAvatarEditor() {
    return Stack(
      alignment: Alignment.bottomRight,
      children: [
        Container(
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
          ),
          child: const Icon(
            Icons.person,
            size: 60,
            color: AppColors.primary,
          ),
        ),
        // Camera Action Button
        GestureDetector(
          onTap: () {
            // TODO: Trigger Image Picker
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

  // ─── Helper: Custom Styled Text Field ───
  Widget _buildTextField({
    required String label,
    required String hint,
    required TextEditingController textController,
    required IconData icon,
    TextInputType keyboardType = TextInputType.text,
    String? Function(String?)? validator,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Using your custom field label style
        Text(label, style: AppTextStyles.fieldLabel),
        const SizedBox(height: 8),

        // Input Field wrapped in a container for the custom shadow & border
        Container(
          decoration: BoxDecoration(
            color: AppColors.white,
            borderRadius: BorderRadius.circular(12),
            boxShadow: const [
              BoxShadow(
                color: AppColors.lightShadow,
                blurRadius: 8,
                offset: Offset(0, 2),
              ),
            ],
          ),
          child: TextFormField(
            controller: textController,
            keyboardType: keyboardType,
            validator: validator,
            style: AppTextStyles.inputText, // User input styling
            decoration: InputDecoration(
              hintText: hint,
              hintStyle: AppTextStyles.hintText, // Hint text styling
              prefixIcon: Icon(icon, color: AppColors.textSecondary, size: 22),

              // Clean borders integrating with your colors
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: BorderSide.none,
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: const BorderSide(color: AppColors.lightDivider, width: 1),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: const BorderSide(color: AppColors.primary, width: 1.5),
              ),
              errorBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: const BorderSide(color: AppColors.error, width: 1),
              ),
              filled: true,
              fillColor: AppColors.white,
              contentPadding: const EdgeInsets.symmetric(vertical: 16),
            ),
          ),
        ),
      ],
    );
  }
}