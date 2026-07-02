import 'package:pgk_ticket_app/app/modules/profile/widget/edit_profile_view.dart';

import '../../../common/constant/app_imports.dart';
import '../../otp/controllers/otp_controller.dart';
import '../../otp/widget/language_selection.dart';
import '../controllers/profile_controller.dart';
import '../widget/cancellation_policy_view.dart';
import '../widget/refund_policy_view.dart';

class ProfileView extends GetView<ProfileController> {
  const ProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    // If you are using localization:
    // final l10n = AppLocalizations.of(context)!;

    return Scaffold(
      backgroundColor: AppColors.background,

      // ─── Custom App Bar ───
      // It automatically handles the back button since showBackButton defaults to true
      appBar: const CustomAppBar(
        title: 'My Profile', // Replace with: l10n.myProfile if localized
      ),

      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: 24),

            // ─── Profile Header (Avatar, Name, Email) ───
            _buildProfileHeader(),

            const SizedBox(height: 32),

            // ─── Profile Options List ───
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Column(
                children: [
                  _buildOptionGroup(
                    children: [
                      _buildProfileOption(
                        icon: Icons.person_outline,
                        title: 'Edit Profile',
                        onTap: () {
                          Get.to(EditProfileView());
                        },
                      ),
                      _buildDivider(),
                      _buildProfileOption(
                        icon: Icons.language_outlined,
                        title: 'Language Preferences',
                        onTap: () {
                          Get.lazyPut(() => OtpController());
                          Get.to(() => const LanguageSelectionView());
                        },
                      ),
                    ],
                  ),

                  const SizedBox(height: 16),

                  _buildOptionGroup(
                    children: [
                      _buildProfileOption(
                        icon: Icons.bluetooth_searching_outlined,
                        title: 'Bluetooth Connectivity',
                        onTap: () {
                          Get.toNamed(Routes.BLUETOOTH);
                        },
                      ),
                      _buildDivider(),
                      _buildProfileOption(
                        icon: Icons.history,
                        title: 'Payment History',
                        onTap: () {
                          Get.toNamed(Routes.HISTORY);
                        },
                      ),
                    ],
                  ), const SizedBox(height: 16),

                  _buildOptionGroup(
                    children: [
                      _buildProfileOption(
                        icon: Icons.receipt_long_outlined, // Updated to a refund/receipt icon
                        title: 'Refund Policy',
                        onTap: () {
                          Get.to(() => const RefundPolicyView());
                        },
                      ),
                      _buildDivider(),
                      _buildProfileOption(
                        icon: Icons.cancel_outlined, // Updated to a cancellation icon
                        title: 'Cancellation Policy',
                        onTap: () {
                          Get.to(() => const CancellationPolicyView());
                        },
                      ),
                    ],
                  ),

                  const SizedBox(height: 16),

                  _buildOptionGroup(
                    children: [
                      _buildProfileOption(
                        icon: Icons.help_outline,
                        title: 'Help & Support',
                        onTap: () {
                          // Replace with your actual Help URL if you have one
                          controller.openWebLink('https://pratapgauravkendra.org/contact/');
                        },
                      ),
                      _buildDivider(),
                      _buildProfileOption(
                        icon: Icons.privacy_tip_outlined,
                        title: 'Privacy Policy',
                        onTap: () {
                          // The URL you provided
                          controller.openWebLink('https://pratapgauravkendra.org/privacy-policy/');
                        },
                      ), _buildDivider(),
                      _buildProfileOption(
                        icon: Icons.gavel_outlined,
                        title: 'Terms & Conditions',
                        onTap: () {
                          // The URL you provided
                          controller.openWebLink('https://pratapgauravkendra.org/terms-condition/');
                        },
                      ),
                    ],
                  ),

                  const SizedBox(height: 32),

                  // ─── Logout Button ───
                  _buildLogoutButton(),

                  const SizedBox(height: 40),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  // ─── Helper: Profile Header ───
  Widget _buildProfileHeader() {
    return Column(
      children: [
        Stack(
          alignment: Alignment.bottomRight,
          children: [
            // Avatar Background & Icon
            Container(
              width: 100,
              height: 100,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: AppColors.primary.withValues(alpha: 0.1),
                border: Border.all(color: AppColors.primary, width: 2),
              ),
              child: const Icon(
                Icons.person,
                size: 50,
                color: AppColors.primary,
              ),
            ),
            // Edit Avatar Badge
            Container(
              height: 32,
              width: 32,
              decoration: BoxDecoration(
                color: AppColors.primary,
                shape: BoxShape.circle,
                border: Border.all(color: AppColors.white, width: 2),
              ),
              child: IconButton(
                padding: EdgeInsets.zero,
                icon: const Icon(
                  Icons.camera_alt,
                  size: 16,
                  color: AppColors.white,
                ),
                onPressed: () {
                  // TODO: Open image picker
                },
              ),
            ),
          ],
        ),
        const SizedBox(height: 16),

        // Name using AppTextStyles
        const Text(
          'Rohit Kumar', // Replace with: controller.userName.value
          style: AppTextStyles.titleLarge,
        ),
        const SizedBox(height: 4),

        // Email using AppTextStyles
        const Text(
          'rohit.kumar@example.com', // Replace with: controller.userEmail.value
          style: AppTextStyles.sectionSub,
        ),
      ],
    );
  }

  // ─── Helper: Option Group Card ───
  Widget _buildOptionGroup({required List<Widget> children}) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: const [
          BoxShadow(
            color:
                AppColors.lightShadow, // Replaced static color with your token
            blurRadius: 10,
            offset: Offset(0, 4),
          ),
        ],
      ),
      child: Column(children: children),
    );
  }

  // ─── Helper: Individual Profile Option ───
  Widget _buildProfileOption({
    required IconData icon,
    required String title,
    required VoidCallback onTap,
  }) {
    return ListTile(
      contentPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 4),
      leading: Container(
        padding: const EdgeInsets.all(8),
        decoration: BoxDecoration(
          color: AppColors.primary.withValues(alpha: 0.1),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Icon(icon, color: AppColors.primary, size: 22),
      ),
      title: Text(
        title,
        style: AppTextStyles.subtitle, // Standardized subtitle style
      ),
      trailing: const Icon(
        Icons.arrow_forward_ios,
        size: 16,
        color: AppColors.lightTextDisabled,
      ), // Standardized icon color
      onTap: onTap,
    );
  }

  // ─── Helper: Divider ───
  Widget _buildDivider() {
    return const Padding(
      padding: EdgeInsets.only(left: 60, right: 20),
      child: Divider(
        height: 1,
        thickness: 1,
        color: AppColors.lightDivider,
      ), // Standardized divider color
    );
  }

  // ─── Helper: Logout Button ───
  Widget _buildLogoutButton() {
    return SizedBox(
      width: double.infinity,
      height: 50,
      child: ElevatedButton(
        onPressed: () {
          Get.dialog(
            AlertDialog(
              backgroundColor: AppColors.white,
              title: const Text('Logout', style: AppTextStyles.titleLarge),
              content: const Text(
                'Are you sure you want to log out?',
                style: AppTextStyles.bodyMedium,
              ),
              actions: [
                TextButton(
                  onPressed: () => Get.back(),
                  child: const Text('Cancel', style: AppTextStyles.subtitle),
                ),
                ElevatedButton(
                  onPressed: () {
                    Get.back();
                    Get.offAllNamed(Routes.LOGIN);
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.error,
                  ),
                  child: Text('Logout', style: AppTextStyles.button),
                ),
              ],
            ),
          );
        },
        style: ElevatedButton.styleFrom(
          backgroundColor: AppColors.error.withValues(alpha: 0.1),
          elevation: 0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
            side: const BorderSide(color: AppColors.error),
          ),
        ),
        child: Text(
          'Logout',
          style: AppTextStyles.button.copyWith(
            color: AppColors.error, // Overrides the white text to red
          ),
        ),
      ),
    );
  }
}
