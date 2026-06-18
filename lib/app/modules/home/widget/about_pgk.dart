

import '../../../common/constant/app_imports.dart';
import '../controllers/home_controller.dart';

class AboutPgkView extends GetView<HomeController> {
  const AboutPgkView({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(HomeController());
    // ─── INIT L10N ───
    final l10n = AppLocalizations.of(context)!;

    return Scaffold(
      backgroundColor: const Color(0xFFF8F5EC), // Off-white/cream background
      appBar: AppBar(
        title: Text(
          l10n.aboutPgkTitle, // LOCALIZED
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 18,
            fontFamily: FontFamily.regular,
          ),
        ),
        backgroundColor: const Color(0xFFD36526),
        foregroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => Get.back(),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.share, color: Colors.white),
            onPressed: () {},
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // ─── 1. HERO IMAGE SECTION ───
            Stack(
              alignment: Alignment.bottomLeft,
              children: [
                Image.asset(
                  ImageConstant.pgkFullImage,
                  width: double.infinity,
                  height: 260,
                  fit: BoxFit.cover,
                  alignment: Alignment.center,
                  errorBuilder: (context, error, stackTrace) => Container(
                    width: double.infinity,
                    height: 260,
                    color: Colors.grey[300],
                    child: const Icon(Icons.image, size: 50, color: Colors.grey),
                  ),
                ),
                Container(
                  width: double.infinity,
                  height: 120,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.bottomCenter,
                      end: Alignment.topCenter,
                      colors: [
                        Colors.black.withOpacity(0.85),
                        Colors.transparent,
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Text(
                    l10n.pgkHeroTitle, // LOCALIZED
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                      height: 1.2,
                    ),
                  ),
                ),
              ],
            ),

            // ─── MAIN CONTENT ───
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [

                  // ─── 2. AUDIO PLAYER CARD (TTS INTEGRATED) ───
                  Container(
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(16),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.05),
                          blurRadius: 10,
                          offset: const Offset(0, 4),
                        ),
                      ],
                    ),
                    child: Column(
                      children: [
                        Text(
                          l10n.narrationIntroTitle, // LOCALIZED
                          style: const TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                            color: Colors.black87,
                          ),
                        ),
                        const SizedBox(height: 12),
                        Row(
                          children: [
                            GestureDetector(
                              onTap: () {
                                // Combine localizations for TTS
                                controller.toggleNarration("${l10n.pgkIntroP1} ${l10n.pgkIntroP2}");
                              },
                              child: Container(
                                width: 40,
                                height: 40,
                                decoration: const BoxDecoration(
                                  color: Color(0xFF2C323A),
                                  shape: BoxShape.circle,
                                ),
                                child: Obx(
                                      () => Icon(
                                    controller.isPlaying.value ? Icons.pause : Icons.play_arrow,
                                    color: Colors.white,
                                    size: 20,
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(width: 8),
                            Expanded(
                              child: SliderTheme(
                                data: SliderTheme.of(context).copyWith(
                                  activeTrackColor: const Color(0xFF2C323A),
                                  inactiveTrackColor: Colors.grey[300],
                                  thumbColor: const Color(0xFF2C323A),
                                  trackHeight: 4.0,
                                  thumbShape: const RoundSliderThumbShape(enabledThumbRadius: 6.0),
                                  overlayShape: const RoundSliderOverlayShape(overlayRadius: 14.0),
                                ),
                                child: Obx(
                                      () => Slider(
                                    value: controller.audioProgress.value,
                                    onChanged: (value) {},
                                  ),
                                ),
                              ),
                            ),
                            Icon(Icons.volume_up_outlined, color: Colors.grey[700], size: 24),
                          ],
                        ),
                        Align(
                          alignment: Alignment.centerRight,
                          child: Padding(
                            padding: const EdgeInsets.only(right: 32.0),
                            child: Obx(() {
                              String percentage = (controller.audioProgress.value * 100).toInt().toString();
                              return Text(
                                '$percentage% ${l10n.completedText}', // LOCALIZED
                                style: TextStyle(
                                  fontSize: 12,
                                  color: Colors.grey[600],
                                  fontWeight: FontWeight.w500,
                                ),
                              );
                            }),
                          ),
                        ),
                      ],
                    ),
                  ),

                  const SizedBox(height: 24),

                  // ─── INTRODUCTION ───
                  _buildSectionHeader(l10n.whoWeAreHeader),
                  _buildParagraph(l10n.pgkIntroP1),
                  _buildParagraph(l10n.pgkIntroP2),
                  _buildParagraph(l10n.pgkIntroP3),


                ],
              ),
            ),


            // ─── DETAILED SECTIONS ───
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 4),
                  const Divider(),
                  const SizedBox(height: 16),

                  _buildMainHeader(l10n.epicTaleOfHaldighati),
                  _buildParagraph(l10n.epicTaleP1),

                  _buildSubHeader(l10n.exhibitHighlights),
                  _buildParagraph(l10n.epicTaleP2),
                  _buildBulletPoint(l10n.exhibitBullet1),
                  _buildBulletPoint(l10n.exhibitBullet2),
                  _buildBulletPoint(l10n.exhibitBullet3),
                  _buildBulletPoint(l10n.exhibitBullet4),
                  const SizedBox(height: 8),
                  _buildParagraph(l10n.epicTaleP3),

                  // ─── WHO WE ARE / A NATIONAL TRIBUTE ───
                  _buildMainHeader(l10n.nationalTributeHeader),
                  _buildParagraph(l10n.nationalTributeP1),
                  _buildParagraph(l10n.nationalTributeP2),
                  _buildParagraph(l10n.nationalTributeP3),

                  // ─── A PERFECT PLACE FOR ALL ───
                  _buildMainHeader(l10n.perfectPlaceHeader),
                  _buildParagraph(l10n.perfectPlaceP1),
                  _buildBulletPoint(l10n.perfectPlaceBullet1),
                  _buildBulletPoint(l10n.perfectPlaceBullet2),
                  _buildBulletPoint(l10n.perfectPlaceBullet3),
                  _buildBulletPoint(l10n.perfectPlaceBullet4),
                  const SizedBox(height: 8),
                  _buildParagraph(l10n.perfectPlaceP2),

                  const SizedBox(height: 24),
                  const Divider(),
                  const SizedBox(height: 16),

                  // ─── FAQs ───
                  _buildMainHeader(l10n.faqTitle), // Assuming you have faqTitle from previous views
                  const SizedBox(height: 8),

                  _buildFaqTile(question: l10n.aboutPgkFaqQ1, answer: l10n.aboutPgkFaqA1),
                  _buildFaqTile(question: l10n.aboutPgkFaqQ2, answer: l10n.aboutPgkFaqA2),
                  _buildFaqTile(question: l10n.aboutPgkFaqQ3, answer: l10n.aboutPgkFaqA3),
                  _buildFaqTile(question: l10n.aboutPgkFaqQ4, answer: l10n.aboutPgkFaqA4),
                  _buildFaqTile(question: l10n.aboutPgkFaqQ5, answer: l10n.aboutPgkFaqA5),

                  const SizedBox(height: 32),

                  // ─── FOOTER TEXT ───
                  Container(
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: const Color(0xFFD36526).withOpacity(0.1),
                      borderRadius: BorderRadius.circular(12),
                      border: Border.all(
                        color: const Color(0xFFD36526).withOpacity(0.3),
                      ),
                    ),
                    child: Column(
                      children: [
                        Text(
                          l10n.planVisitToday,
                          style: const TextStyle(
                            fontSize: 16.0,
                            fontWeight: FontWeight.bold,
                            color: Color(0xFFD36526),
                          ),
                        ),
                        const SizedBox(height: 8),
                        Text(
                          l10n.planVisitDesc,
                          style: const TextStyle(
                            fontSize: 14.0,
                            fontStyle: FontStyle.italic,
                            color: Colors.black87,
                            height: 1.5,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 32),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  // --- Helper Methods ---

  Widget _buildVideoThumbnailCard({
    required String imagePath,
    required String title,
  }) {
    return Container(
      width: 160,
      margin: const EdgeInsets.only(right: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            alignment: Alignment.center,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: Image.asset(
                  imagePath,
                  width: 160,
                  height: 90,
                  fit: BoxFit.cover,
                  errorBuilder: (context, error, stackTrace) => Container(
                    width: 160,
                    height: 90,
                    color: Colors.grey[400],
                    child: const Icon(Icons.image, color: Colors.white),
                  ),
                ),
              ),
              Positioned(
                bottom: 0,
                left: 0,
                right: 0,
                child: Container(
                  height: 40,
                  decoration: BoxDecoration(
                    borderRadius: const BorderRadius.only(
                      bottomLeft: Radius.circular(12),
                      bottomRight: Radius.circular(12),
                    ),
                    gradient: LinearGradient(
                      begin: Alignment.bottomCenter,
                      end: Alignment.topCenter,
                      colors: [
                        Colors.black.withOpacity(0.8),
                        Colors.transparent,
                      ],
                    ),
                  ),
                ),
              ),
              Container(
                width: 32,
                height: 32,
                decoration: BoxDecoration(
                  color: Colors.black.withOpacity(0.6),
                  shape: BoxShape.circle,
                  border: Border.all(color: Colors.white, width: 1.5),
                ),
                child: const Icon(
                  Icons.play_arrow,
                  color: Colors.white,
                  size: 18,
                ),
              ),
              Positioned(
                bottom: 6,
                left: 8,
                right: 8,
                child: Text(
                  title.replaceAll('\n', ' '),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 10,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 8),
          Text(
            title,
            maxLines: 2,
            style: const TextStyle(
              fontSize: 13,
              fontWeight: FontWeight.w600,
              color: Colors.black87,
              height: 1.2,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildMainHeader(String text) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12.0),
      child: Text(
        text,
        style: const TextStyle(
          fontSize: 22.0,
          fontWeight: FontWeight.bold,
          color: Color(0xFFD36526),
        ),
      ),
    );
  }

  Widget _buildSectionHeader(String text) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8.0),
      child: Text(
        text,
        style: const TextStyle(
          fontSize: 20.0,
          fontWeight: FontWeight.w800,
          color: Colors.black87,
        ),
      ),
    );
  }

  Widget _buildSubHeader(String text) {
    return Padding(
      padding: const EdgeInsets.only(top: 16.0, bottom: 8.0),
      child: Text(
        text,
        style: const TextStyle(
          fontSize: 16.0,
          fontWeight: FontWeight.w700,
          color: Colors.black87,
        ),
      ),
    );
  }

  Widget _buildParagraph(String text) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16.0),
      child: Text(
        text,
        style: const TextStyle(
          fontSize: 15.0,
          color: Colors.black87,
          height: 1.5,
        ),
      ),
    );
  }

  Widget _buildBulletPoint(String text) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8.0, left: 8.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            '• ',
            style: TextStyle(
              fontSize: 16.0,
              color: Color(0xFFD36526),
              fontWeight: FontWeight.bold,
            ),
          ),
          Expanded(
            child: Text(
              text,
              style: const TextStyle(
                fontSize: 15.0,
                color: Colors.black87,
                height: 1.5,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildFaqTile({required String question, required String answer}) {
    return Card(
      elevation: 0,
      margin: const EdgeInsets.only(bottom: 8.0),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8.0),
        side: BorderSide(color: Colors.grey.shade300),
      ),
      child: ExpansionTile(
        title: Text(
          question,
          style: const TextStyle(fontWeight: FontWeight.w600, fontSize: 14.0),
        ),
        iconColor: const Color(0xFFD36526),
        childrenPadding: const EdgeInsets.only(
          left: 16.0,
          right: 16.0,
          bottom: 16.0,
        ),
        children: [
          Text(
            answer,
            style: TextStyle(
              fontSize: 14.0,
              color: Colors.grey.shade700,
              height: 1.5,
            ),
          ),
        ],
      ),
    );
  }
}