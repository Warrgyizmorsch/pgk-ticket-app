import 'dart:io';
import 'package:pgk_ticket_app/app/modules/profile/widget/edit_profile_view.dart';
import 'package:pgk_ticket_app/app/services/storage_services.dart';
import '../../../common/constant/app_imports.dart';
import '../../otp/controllers/otp_controller.dart';
import '../../otp/widget/language_selection.dart';
import '../controllers/profile_controller.dart';
import '../widget/cancellation_policy_view.dart';
import '../widget/refund_policy_view.dart';
import '../widget/visitor_info_view.dart';

class ProfileView extends GetView<ProfileController> {
  const ProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;

    return Scaffold(
      backgroundColor: AppColors.background,

      // ─── Custom App Bar ───
      appBar: CustomAppBar(
        title: l10n.myProfile,
        showBackButton: false,
      ),

      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: 24),

            // ─── Profile Header (Avatar, Name, Email) ───
            _buildProfileHeader( ctrl: controller),

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
                        title: l10n.editProfileTitle, // Reused from earlier
                        onTap: () {
                          Get.to(const EditProfileView());
                        },
                      ),
                      _buildDivider(),
                      _buildProfileOption(
                        icon: Icons.language_outlined,
                        title: l10n.languagePreferences,
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
                        title: l10n.bluetoothConnectivity, // Reused from earlier
                        onTap: () {
                          Get.toNamed(Routes.BLUETOOTH);
                        },
                      ),
                      _buildDivider(),
                      _buildProfileOption(
                        icon: Icons.history,
                        title: l10n.paymentHistory,
                        onTap: () {
                          Get.toNamed(Routes.HISTORY);
                        },
                      ),
                    ],
                  ),
                  const SizedBox(height: 16),

                  _buildOptionGroup(
                    children: [
                      _buildProfileOption(
                        icon: Icons.receipt_long_outlined,
                        title: l10n.refundPolicy,
                        onTap: () {
                          Get.to(() => const RefundPolicyView());
                        },
                      ),
                      _buildDivider(),
                      _buildProfileOption(
                        icon: Icons.cancel_outlined,
                        title: l10n.cancellationPolicy,
                        onTap: () {
                          Get.to(() => const CancellationPolicyView());
                        },
                      ),
                      _buildDivider(),
                      _buildProfileOption(
                        icon: Icons.info_outline_rounded,
                        title: l10n.profileInstructions,
                        onTap: () {
                          Get.to(() => const VisitorInfoView());
                        },
                      )
                    ],
                  ),

                  const SizedBox(height: 16),

                  _buildOptionGroup(
                    children: [
                      _buildProfileOption(
                        icon: Icons.help_outline,
                        title: l10n.helpSupport,
                        onTap: () {
                          controller.openWebLink('https://pratapgauravkendra.org/contact/');
                        },
                      ),
                      _buildDivider(),
                      _buildProfileOption(
                        icon: Icons.privacy_tip_outlined,
                        title: l10n.privacyPolicy,
                        onTap: () {
                          controller.openWebLink('https://pratapgauravkendra.org/privacy-policy/');
                        },
                      ),
                      _buildDivider(),
                      _buildProfileOption(
                        icon: Icons.gavel_outlined,
                        title: l10n.termsConditions,
                        onTap: () {
                          controller.openWebLink('https://pratapgauravkendra.org/terms-condition/');
                        },
                      ),
                    ],
                  ),

                  const SizedBox(height: 32),

                  // ─── Logout Button ───
                  _buildLogoutButton(l10n),

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
  Widget _buildProfileHeader({required ProfileController ctrl}) {
    return  Obx(() => Container(
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
    ));
  }

  // ─── Helper: Option Group Card ───
  Widget _buildOptionGroup({required List<Widget> children}) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: const [
          BoxShadow(
            color: AppColors.lightShadow,
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
        style: AppTextStyles.subtitle,
      ),
      trailing: const Icon(
        Icons.arrow_forward_ios,
        size: 16,
        color: AppColors.lightTextDisabled,
      ),
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
      ),
    );
  }

  // ─── Helper: Logout Button ───
  Widget _buildLogoutButton(AppLocalizations l10n) {
    return SizedBox(
      width: double.infinity,
      height: 50,
      child: ElevatedButton(
        onPressed: () {
          Get.dialog(
            AlertDialog(
              backgroundColor: AppColors.white,
              title: Text(l10n.logout, style: AppTextStyles.titleLarge),
              content: Text(
                l10n.logoutPrompt,
                style: AppTextStyles.bodyMedium,
              ),
              actions: [
                TextButton(
                  onPressed: () => Get.back(),
                  child: Text(l10n.cancel, style: AppTextStyles.subtitle),
                ),
                ElevatedButton(
                  onPressed: () {
                    Get.back();
                    StorageService.to.clearAuthData();
                    Get.offAllNamed(Routes.LOGIN);
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.error,
                  ),
                  child: Text(l10n.logout, style: AppTextStyles.button),
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
          l10n.logout,
          style: AppTextStyles.button.copyWith(
            color: AppColors.error,
          ),
        ),
      ),
    );
  }
}