import '../../../common/constant/app_imports.dart';
import '../controllers/show_view_controller.dart';

class RoboticShowView extends GetView<ShowViewController> {
  const RoboticShowView({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;

    return Scaffold(
      backgroundColor: AppColors.background,

      // ─── APP BAR ───
      appBar: AppBar(
        backgroundColor: AppColors.primary,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: AppColors.white),
          onPressed: () => Get.back(),
        ),
        title: Text(
          l10n.showDetails,
          style: const TextStyle(
            color: AppColors.white,
            fontWeight: FontWeight.w600,
            fontSize: 18,
            fontFamily: FontFamily.semiBold,
          ),
        ),
        centerTitle: true,
        actions: [
          IconButton(
            icon: const Icon(Icons.notifications_none, color: AppColors.white, size: 26),
            onPressed: () {},
          ),
        ],
      ),

      // ─── MAIN CONTENT & FIXED BUTTON ───
      body: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // 1. Video/Image Thumbnail Area
                  _buildMediaThumbnail(),
                  const SizedBox(height: 24),

                  // 2. Title
                  Text(
                    l10n.mevadSphurtiDirghaTitle,
                    style: const TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                      color: AppColors.black,
                      fontFamily: FontFamily.bold,
                    ),
                  ),
                  const SizedBox(height: 16),

                  // 3. Info Row (Duration & Timing)
                  Row(
                    children: [
                      _buildInfoChip(Icons.precision_manufacturing_outlined, l10n.roboticShowLabel),
                      const SizedBox(width: 24),
                      _buildInfoChip(Icons.access_time, l10n.durationTBA),
                    ],
                  ),

                  const SizedBox(height: 16),
                  const Divider(color: AppColors.lightDivider, thickness: 1),
                  const SizedBox(height: 16),

                  _buildSectionTitle(l10n.aboutTheShow),
                  _buildParagraph(l10n.mevadSphurtiDirghaDesc),

                  const SizedBox(height: 24),
                ],
              ),
            ),
          ),

          // 5. Fixed Bottom "Book Ticket" Button
          _buildBottomBookButton(l10n.bookTicket),
        ],
      ),
    );
  }

  // ─── WIDGET BUILDERS ───

  Widget _buildMediaThumbnail() {
    return Container(
      width: double.infinity,
      height: 200,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.1),
            blurRadius: 8,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Stack(
        alignment: Alignment.center,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child: Image.asset(
              ImageConstant.lightSound, // Ensure you have this in your ImageConstant
              width: double.infinity,
              height: double.infinity,
              fit: BoxFit.cover,
              errorBuilder: (context, error, stackTrace) {
                return Container(
                  color: Colors.grey.shade300,
                  child: const Icon(Icons.image_not_supported, color: Colors.grey, size: 50),
                );
              },
            ),
          ),
          Container(
            decoration: BoxDecoration(
              color: Colors.black.withValues(alpha: 0.2),
              borderRadius: BorderRadius.circular(12),
            ),
          ),
          GestureDetector(
            onTap: () {
              // controller.playVideo();
            },
            child: Container(
              width: 56,
              height: 56,
              decoration: BoxDecoration(
                color: Colors.white.withValues(alpha: 0.3),
                shape: BoxShape.circle,
                border: Border.all(color: Colors.white, width: 2),
              ),
              child: const Center(
                child: Icon(
                  Icons.play_arrow_rounded,
                  color: Colors.white,
                  size: 36,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildInfoChip(IconData icon, String text) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(icon, size: 16, color: AppColors.textPrimary),
        const SizedBox(width: 8),
        Text(
          text,
          style: const TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w500,
            color: AppColors.textPrimary,
            fontFamily: FontFamily.medium,
          ),
        ),
      ],
    );
  }

  Widget _buildSectionTitle(String title) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8.0, top: 8.0),
      child: Text(
        title,
        style: const TextStyle(
          fontSize: 17,
          fontWeight: FontWeight.w600,
          color: AppColors.black,
          fontFamily: FontFamily.semiBold,
        ),
      ),
    );
  }

  Widget _buildParagraph(String text) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12.0),
      child: Text(
        text,
        style: const TextStyle(
          fontSize: 14,
          color: AppColors.textSecondary,
          height: 1.5,
          fontFamily: FontFamily.regular,
        ),
      ),
    );
  }

  Widget _buildBulletPoint(String text) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8.0, left: 4.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Padding(
            padding: EdgeInsets.only(top: 6.0, right: 8.0),
            child: Icon(Icons.circle, size: 6, color: AppColors.primary),
          ),
          Expanded(
            child: Text(
              text,
              style: const TextStyle(
                fontSize: 14,
                color: AppColors.textSecondary,
                height: 1.4,
                fontFamily: FontFamily.regular,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildFaqTile({required String question, required String answer}) {
    return Theme(
      data: Theme.of(Get.context!).copyWith(dividerColor: Colors.transparent),
      child: Container(
        margin: const EdgeInsets.only(bottom: 12.0),
        decoration: BoxDecoration(
          color: AppColors.white,
          borderRadius: BorderRadius.circular(8),
          border: Border.all(color: AppColors.lightDivider),
        ),
        child: ExpansionTile(
          tilePadding: const EdgeInsets.symmetric(horizontal: 16.0),
          title: Text(
            question,
            style: const TextStyle(
              fontSize: 14.0,
              fontWeight: FontWeight.w600,
              color: AppColors.primary,
              fontFamily: FontFamily.medium,
            ),
          ),
          iconColor: AppColors.primary,
          collapsedIconColor: AppColors.textSecondary,
          childrenPadding: const EdgeInsets.only(left: 16.0, right: 16.0, bottom: 16.0),
          children: [
            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                answer,
                style: const TextStyle(
                  fontSize: 13.0,
                  color: AppColors.textPrimary,
                  height: 1.5,
                  fontFamily: FontFamily.regular,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildBottomBookButton(String buttonText) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 16.0),
      decoration: BoxDecoration(
        color: AppColors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.05),
            blurRadius: 10,
            offset: const Offset(0, -4),
          ),
        ],
      ),
      child: SafeArea(
        child: SizedBox(
          width: double.infinity,
          height: 50,
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: AppColors.primary,
              foregroundColor: AppColors.white,
              elevation: 0,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
              ),
            ),
            onPressed: () {
              Get.toNamed(Routes.BOOKING);
            },
            child: Text(
              buttonText,
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                fontFamily: FontFamily.bold,
              ),
            ),
          ),
        ),
      ),
    );
  }
}