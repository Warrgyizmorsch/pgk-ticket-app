import '../../../common/constant/app_imports.dart';
import '../controllers/show_view_controller.dart';
// import 'package:flutter_gen/gen_l10n/app_localizations.dart'; // Uncomment when ready for l10n

class WaterShowView extends GetView<ShowViewController> {
  const WaterShowView({super.key});

  @override
  Widget build(BuildContext context) {
    // final l10n = AppLocalizations.of(context)!; // Uncomment when ready for l10n

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
        title: const Text(
          'Show Details', // Replace with l10n.showDetails
          style: TextStyle(
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
                  const Text(
                    'Water Laser Show', // Replace with l10n.waterLaserShow
                    style: TextStyle(
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
                      _buildInfoChip(Icons.access_time, 'Approx. 30 Minutes'),
                      const SizedBox(width: 24),
                      _buildInfoChip(Icons.calendar_today_outlined, 'Starts at 7:30 PM'),
                    ],
                  ),

                  const SizedBox(height: 16),
                  const Divider(color: AppColors.lightDivider, thickness: 1),
                  const SizedBox(height: 16),

                  // 4. Detailed Content Sections
                  _buildSectionTitle('Experience the Legend'),
                  _buildParagraph('Experience the legendary tale of Maharana Pratap brought to life through an advanced laser projection show on water screens. Witness the heroic moments of Mewar’s history, including Panna’s sacrifice and the Battle of Diwer.'),
                  _buildParagraph('Immerse yourself in the glorious past of Mewar as the Maharana Pratap story in Hindi unfolds before your eyes, blending history and technology seamlessly. The show uses cutting-edge visuals and sound to depict the courage and valor of one of India’s greatest warriors. Don’t miss this stunning tribute to the legendary king!'),

                  _buildSectionTitle('Relive Maharana Pratap’s Story'),
                  _buildParagraph('Pratap Gaurav Kendra Udaipur presents the Water Laser Show, a unique experience where history is displayed through lights, water, and sound. The program highlights the Maharana Pratap Story in Hindi, allowing visitors to connect with the life, bravery, and legacy of the great warrior. With advanced laser projections, traditional music, and powerful narration, the show combines entertainment with cultural learning, making it one of the most engaging evening attractions in Udaipur.'),

                  _buildSectionTitle('One Show That Tourists Shouldn’t Miss'),
                  _buildParagraph('The Water Laser Show is designed to take audiences on a journey through Mewar’s history. Each scene showcases important episodes from the Maharana Pratap Story in Hindi, including his struggle for freedom and his dedication to the people of Mewar.'),

                  const SizedBox(height: 8),
                  const Text(
                    'Highlights of the Show',
                    style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w600,
                      color: AppColors.black,
                      fontFamily: FontFamily.semiBold,
                    ),
                  ),
                  const SizedBox(height: 8),
                  _buildBulletPoint('Laser lights and water projections creating dynamic visuals'),
                  _buildBulletPoint('Clear narration in Hindi for cultural connection'),
                  _buildBulletPoint('Music inspired by Rajasthan’s heritage'),
                  _buildBulletPoint('A meaningful experience for visitors of all ages'),

                  const SizedBox(height: 16),
                  _buildSectionTitle('Reliving the Legacy of Maharana Pratap'),

                  const Text(
                    'The Warrior’s Journey',
                    style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w600,
                      color: AppColors.primary,
                      fontFamily: FontFamily.semiBold,
                    ),
                  ),
                  const SizedBox(height: 4),
                  _buildParagraph('The show reflects the courage of Maharana Pratap during the Mughal conflicts and his determination to protect Mewar’s independence. Episodes like the Battle of Haldighati are recreated with light and sound to engage the audience.'),

                  const Text(
                    'A Blend of Learning and Entertainment',
                    style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w600,
                      color: AppColors.primary,
                      fontFamily: FontFamily.semiBold,
                    ),
                  ),
                  const SizedBox(height: 4),
                  _buildParagraph('This performance not only entertains but also educates. By presenting the Maharana Pratap Story in Hindi, the Water Laser Show makes history accessible and easy to understand for everyone.'),

                  _buildSectionTitle('Why Choose Pratap Gaurav Kendra?'),
                  _buildBulletPoint('Dedicated to Maharana Pratap’s life and Mewar’s history'),
                  _buildBulletPoint('Use of modern technology to present traditional stories'),
                  _buildBulletPoint('Convenient location for travelers in Udaipur'),
                  _buildBulletPoint('Ideal evening activity after sightseeing'),
                  _buildBulletPoint('Suitable for students, families, and history lovers'),

                  const SizedBox(height: 16),
                  const Divider(color: AppColors.lightDivider, thickness: 1),
                  const SizedBox(height: 16),

                  _buildSectionTitle('Plan Your Visit'),
                  _buildParagraph('The Water Laser Show at Pratap Gaurav Kendra is an inspiring way to explore Rajasthan’s cultural and historical heritage. By combining modern visuals with the Maharana Pratap Story in Hindi, the show connects audiences with the legacy of one of India’s greatest warriors.\n\nBook your visit today and experience the story of Maharana Pratap through lights, music, and water in Udaipur.'),

                  const SizedBox(height: 16),
                  const Divider(color: AppColors.lightDivider, thickness: 1),
                  const SizedBox(height: 8),

                  _buildSectionTitle('Frequently Asked Questions'),
                  const SizedBox(height: 8),
                  _buildFaqTile(
                      question: 'What story does the Water Laser Show present?',
                      answer: 'It presents the Maharana Pratap Story in Hindi, highlighting his bravery and legacy.'),
                  _buildFaqTile(
                      question: 'Is the show suitable for children?',
                      answer: 'Yes, the visuals and narration are simple and engaging for children.'),
                  _buildFaqTile(
                      question: 'How long does the show last?',
                      answer: 'The show runs for about 30–40 minutes.'),
                  _buildFaqTile(
                      question: 'Can non-Hindi speakers enjoy the show?',
                      answer: 'Yes, the visuals, music, and effects ensure that the story is understandable even without Hindi knowledge.'),
                  _buildFaqTile(
                      question: 'Where is the Water Laser Show hosted?',
                      answer: 'The show is hosted at Pratap Gaurav Kendra, Udaipur.'),

                  const SizedBox(height: 24),
                ],
              ),
            ),
          ),

          // 5. Fixed Bottom "Book Ticket" Button
          _buildBottomBookButton('Book Ticket'),
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
              ImageConstant.lightSound,
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