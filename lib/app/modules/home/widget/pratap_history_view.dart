import '../../../common/constant/app_imports.dart';
import '../controllers/home_controller.dart';

class PratapHistoryView extends GetView<HomeController> {
  const PratapHistoryView({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(HomeController());
    final l10n = AppLocalizations.of(context)!;

    return Scaffold(
      backgroundColor: const Color(
        0xFFF8F5EC,
      ), // Off-white/cream background from mockup
      appBar: AppBar(
        title: Text(
          l10n.historyOfPratap,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 16,
            fontFamily: FontFamily.regular,
          ),
        ),
        backgroundColor: const Color(0xFFD36526),
        foregroundColor: Colors.white,
        elevation: 0,
        actions: [
          IconButton(
            icon: const Icon(Icons.share, color: Colors.white),
            onPressed: () {
              // Share action
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // ─── 1. HERO IMAGE SECTION (From Mockup) ───
            Stack(
              alignment: Alignment.bottomLeft,
              children: [
                Image.asset(
                  ImageConstant.mewar, // Hero Image
                  width: double.infinity,
                  height: 260,
                  fit: BoxFit.cover,
                  alignment: Alignment.topCenter,
                  errorBuilder: (context, error, stackTrace) => Container(
                    width: double.infinity,
                    height: 260,
                    color: Colors.grey[300],
                    child: const Icon(
                      Icons.image,
                      size: 50,
                      color: Colors.grey,
                    ),
                  ),
                ),
                // Dark gradient for text readability
                Container(
                  width: double.infinity,
                  height: 120,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.bottomCenter,
                      end: Alignment.topCenter,
                      colors: [
                        Colors.black.withValues(alpha:0.8),
                        Colors.transparent,
                      ],
                    ),
                  ),
                ),
                // Hero Title
                const Padding(
                  padding: EdgeInsets.all(16.0),
                  child: Text(
                    'Maharana Pratap: The Lion of\nMewar',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                      height: 1.2,
                    ),
                  ),
                ),
              ],
            ),

            // ─── ORIGINAL CONTENT STARTS HERE ───
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // ─── 2. AUDIO PLAYER CARD (From Mockup) ───
                  // Place this inside your build method where the audio card is located
                  Container(
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(16),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withValues(alpha:0.05),
                          blurRadius: 10,
                          offset: const Offset(0, 4),
                        ),
                      ],
                    ),
                    child: Column(
                      children: [
                        const Text(
                          'Narration: The Battle of Haldighati',
                          style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                            color: Colors.black87,
                          ),
                        ),
                        const SizedBox(height: 12),
                        Row(
                          children: [
                            // ─── Dynamic Play/Pause Button ───
                            GestureDetector(
                              onTap: () {
                                // Pass the localized text you want to read aloud here
                                controller.toggleNarration(
                                  "${l10n.historyIntroP1} ${l10n.historyIntroP2} ${l10n.historyIntroP3}${l10n.historyIntroP4}${l10n.historyIntroP5}",
                                );
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
                                    controller.isPlaying.value
                                        ? Icons.pause
                                        : Icons.play_arrow,
                                    color: Colors.white,
                                    size: 20,
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(width: 8),

                            // ─── Dynamic Progress Slider ───
                            Expanded(
                              child: SliderTheme(
                                data: SliderTheme.of(context).copyWith(
                                  activeTrackColor: const Color(0xFF2C323A),
                                  inactiveTrackColor: Colors.grey[300],
                                  thumbColor: const Color(0xFF2C323A),
                                  trackHeight: 4.0,
                                  thumbShape: const RoundSliderThumbShape(
                                    enabledThumbRadius: 6.0,
                                  ),
                                  overlayShape: const RoundSliderOverlayShape(
                                    overlayRadius: 14.0,
                                  ),
                                ),
                                child: Obx(
                                      () => Slider(
                                    value: controller.audioProgress.value,
                                    onChanged: (value) {
                                      // Note: flutter_tts does not support manual seeking out of the box.
                                      // This slider is purely visual to show reading progress.
                                    },
                                  ),
                                ),
                              ),
                            ),
                            Icon(
                              Icons.volume_up_outlined,
                              color: Colors.grey[700],
                              size: 24,
                            ),
                          ],
                        ),

                        // ─── Progress Percentage ───
                        Align(
                          alignment: Alignment.centerRight,
                          child: Padding(
                            padding: const EdgeInsets.only(right: 32.0),
                            child: Obx(() {
                              // Converts the 0.0 - 1.0 progress into a clean percentage (e.g., "45%")
                              String percentage =
                              (controller.audioProgress.value * 100)
                                  .toInt()
                                  .toString();
                              return Text(
                                '$percentage% Completed',
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
                  _buildSectionHeader(
                    l10n.legacyTitle,
                  ), // "Early Life & Legacy" equivalent
                  _buildParagraph(l10n.historyIntroP1),
                  _buildParagraph(l10n.historyIntroP2),

                  const SizedBox(height: 8),



                  // Continuing Original Content
                  _buildParagraph(l10n.historyIntroP3),
                  _buildParagraph(l10n.historyIntroP4),
                  _buildParagraph(l10n.historyIntroP5),

                  const SizedBox(height: 24),

                  // ─── 3. KEY EVENTS SLIDER (From Mockup) ───
                  const Text(
                    'Key Events',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.black87,
                    ),
                  ),
                  const SizedBox(height: 16),
                ],
              ),
            ),

            // Horizontal ListView placed outside horizontal padding for edge-to-edge scrolling
            SizedBox(
              height: 140,
              child: ListView(
                scrollDirection: Axis.horizontal,
                physics: const BouncingScrollPhysics(),
                padding: const EdgeInsets.symmetric(horizontal: 16),
                children: [
                  _buildVideoThumbnailCard(
                    imagePath:
                        ImageConstant.bhaktiDham, // Replace with proper image
                    title: 'Haldighati Battle\nRecreation',
                  ),
                  _buildVideoThumbnailCard(
                    imagePath: ImageConstant.mewar,
                    title: "Chetak's Sacrifice",
                  ),
                  _buildVideoThumbnailCard(
                    imagePath: ImageConstant.pgkFullImage,
                    title: "Pratap's Coronation",
                  ),
                ],
              ),
            ),

            // ─── RESUMING THE REST OF ORIGINAL CONTENT ───
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 8),
                  const Divider(),
                  const SizedBox(height: 16),

                  // Challenges Section
                  _buildMainHeader(l10n.challengesTitle),

                  _buildSubHeader(l10n.nobleLineageTitle),
                  _buildParagraph(l10n.nobleLineageDesc),

                  _buildSubHeader(l10n.refusalMughalTitle),
                  _buildParagraph(l10n.refusalMughalDesc),

                  _buildSubHeader(l10n.haldighatiTitle),
                  _buildParagraph(l10n.haldighatiDesc),

                  _buildSubHeader(l10n.guerrillaTitle),
                  _buildParagraph(l10n.guerrillaDesc),

                  const SizedBox(height: 24),
                  const Divider(),
                  const SizedBox(height: 16),

                  // FAQs Section
                  _buildMainHeader(l10n.faqTitle),
                  const SizedBox(height: 8),

                  _buildFaqTile(question: l10n.faqQ1, answer: l10n.faqA1),
                  _buildFaqTile(question: l10n.faqQ2, answer: l10n.faqA2),
                  _buildFaqTile(question: l10n.faqQ3, answer: l10n.faqA3),
                  _buildFaqTile(question: l10n.faqQ4, answer: l10n.faqA4),
                  _buildFaqTile(question: l10n.faqQ5, answer: l10n.faqA5),

                  const SizedBox(height: 32),

                  // Footer Text
                  Container(
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: const Color(0xFFD36526).withValues(alpha:0.1),
                      borderRadius: BorderRadius.circular(12),
                      border: Border.all(
                        color: const Color(0xFFD36526).withValues(alpha:0.3),
                      ),
                    ),
                    child: Text(
                      l10n.historyFooter,
                      style: const TextStyle(
                        fontSize: 14.0,
                        fontStyle: FontStyle.italic,
                        color: Colors.black87,
                        height: 1.5,
                      ),
                      textAlign: TextAlign.center,
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

  // --- Helper Methods (Original & New) ---

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
                        Colors.black.withValues(alpha:0.8),
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
                  color: Colors.black.withValues(alpha:0.6),
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
