import 'package:pgk_ticket_app/app/common/constant/app_imports.dart';
import '../controllers/show_view_controller.dart';
import '../widget/documentary_show_view.dart';
import '../widget/light_sound_show_view.dart';
import '../widget/robotic_show_view.dart';
import '../widget/water_show_view.dart';

class ShowView extends GetView<ShowViewController> {
  const ShowView({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;

    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: CustomAppBar(
        title: l10n.museumShowsTitle,
        showBackButton: false,

      ),
      body: ListView(
        padding: const EdgeInsets.all(20.0),
        physics: const BouncingScrollPhysics(),
        children: [
          _buildPremiumShowCard(
            imageUrl: ImageConstant.waterShow,
            title: l10n.showsViewWaterLaserTitle,
            description: l10n.showsViewWaterLaserDesc,
            tag: l10n.showsViewPopularTag, // Adds a nice badge to the image
            onTap: () => Get.to(() => const WaterShowView()),
            l10n: l10n,
          ),
          _buildPremiumShowCard(
            imageUrl: ImageConstant.documentation, // Update if you have a specific robotic asset
            title: l10n.showsViewRoboticTitle,
            description: l10n.showsViewRoboticDesc,
            onTap: () => Get.to(() => const RoboticShowView()),
            l10n: l10n,
          ),
          _buildPremiumShowCard(
            imageUrl: ImageConstant.documentation,
            title: l10n.showsViewDocTitle,
            description: l10n.showsViewDocDesc,
            onTap: () => Get.to(() => const DocumentationShowView()),
            l10n: l10n,
          ),
          _buildPremiumShowCard(
            imageUrl: ImageConstant.lightSound,
            title: l10n.showsViewLightSoundTitle,
            description: l10n.showsViewLightSoundDesc,
            tag: l10n.showsViewEveningTag,
            onTap: () => Get.to(() => const LightSoundShowView()),
            l10n: l10n,
          ),
          const SizedBox(height: 4),
        ],
      ),
    );
  }

  // ─── Professional Premium Card Component ───
  Widget _buildPremiumShowCard({
    required String imageUrl,
    required String title,
    required String description,
    required VoidCallback onTap,
    required AppLocalizations l10n,
    String? tag,
  }) {
    return GestureDetector(
      onTap: onTap, // Makes the entire card tappable, which is much better for UX
      child: Container(
        margin: const EdgeInsets.only(bottom: 24),
        decoration: BoxDecoration(
          color: AppColors.white,
          borderRadius: BorderRadius.circular(16),
          boxShadow: const [
            BoxShadow(
              color: AppColors.lightShadow,
              blurRadius: 15,
              offset: Offset(0, 6),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // ─── Hero Image Section ───
            ClipRRect(
              borderRadius: const BorderRadius.vertical(top: Radius.circular(16)),
              child: Stack(
                children: [
                  Image.asset(
                    imageUrl,
                    height: 220, // Taller image for a premium feel
                    width: double.infinity,
                    fit: BoxFit.cover,
                    errorBuilder: (context, error, stackTrace) => Container(
                      height: 180,
                      width: double.infinity,
                      color: AppColors.lightDisabled,
                      child: const Icon(Icons.image, color: Colors.white54, size: 48),
                    ),
                  ),

                  // Optional Floating Tag/Badge (e.g., "Popular")
                  if (tag != null)
                    Positioned(
                      top: 16,
                      right: 16,
                      child: Container(
                        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                        decoration: BoxDecoration(
                          color: AppColors.tagBg.withValues(alpha: 0.95),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Text(
                          tag,
                          style: const TextStyle(
                            color: AppColors.tagText,
                            fontSize: 12,
                            fontWeight: FontWeight.bold,
                            letterSpacing: 0.5,
                          ),
                        ),
                      ),
                    ),
                ],
              ),
            ),

            // ─── Content Section ───
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: AppTextStyles.titleLarge,
                  ),
                  const SizedBox(height: 8),
                  Text(
                    description,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: AppTextStyles.bodyMedium.copyWith(
                      color: AppColors.textSecondary,
                      height: 1.4, // Better line height for reading
                    ),
                  ),
                  const SizedBox(height: 20),

                  // ─── Call to Action Row ───
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        l10n.showsViewDetailsBtn,
                        style: AppTextStyles.subtitle.copyWith(
                          color: AppColors.primary,
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.all(8),
                        decoration: BoxDecoration(
                          color: AppColors.primary.withValues(alpha: 0.1),
                          shape: BoxShape.circle,
                        ),
                        child: const Icon(
                          Icons.arrow_forward_ios,
                          size: 14,
                          color: AppColors.primary,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}