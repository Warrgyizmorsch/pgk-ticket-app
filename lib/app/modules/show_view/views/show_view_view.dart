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
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: CustomAppBar(
        title: 'Museum Shows',
        showBackButton: false,
        actions: [
          IconButton(
            icon: const Icon(Icons.notifications_none_rounded, color: AppColors.white),
            onPressed: () {
              // TODO: Handle notifications
            },
          ),
        ],
      ),
      body: ListView(
        padding: const EdgeInsets.all(20.0),
        physics: const BouncingScrollPhysics(),
        children: [
          _buildPremiumShowCard(
            imageUrl: ImageConstant.lightSound,
            title: 'Water Laser Show',
            description: "Experience Panna's sacrifice and the historic Battle of Diwer brought to life through a mesmerizing water and laser spectacle.",
            tag: 'Popular', // Adds a nice badge to the image
            onTap: () => Get.to(() => const WaterShowView()),
          ),
          _buildPremiumShowCard(
            imageUrl: ImageConstant.documentation, // Update if you have a specific robotic asset
            title: 'Robotic Show',
            description: 'This show uses advanced mechanical models to narrate various historical tales in an engaging and interactive format.',
            onTap: () => Get.to(() => const RoboticShowView()),
          ),
          _buildPremiumShowCard(
            imageUrl: ImageConstant.documentation,
            title: 'Documentary Show',
            description: 'Watch the inspiring documentary of Maharana Pratap, detailing his life, struggles, and ultimate victories.',
            onTap: () => Get.to(() => const DocumentationShowView()),
          ),
          _buildPremiumShowCard(
            imageUrl: ImageConstant.lightSound,
            title: 'Light And Sound Show',
            description: 'Experience the glorious history of Mewar through an immersive outdoor light and sound narration.',
            tag: 'Evening Only',
            onTap: () => Get.to(() => const LightSoundShowView()),
          ),
          // Extra padding at the bottom so the last card doesn't hug the screen edge
          const SizedBox(height: 20),
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
                    height: 180, // Taller image for a premium feel
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
                        'View Details',
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