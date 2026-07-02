import '../../../common/constant/app_imports.dart';
import '../controllers/home_controller.dart';
// import 'package:flutter_gen/gen_l10n/app_localizations.dart'; // Ensure this is imported

class BhaktiDhamView extends GetView<HomeController> {
  BhaktiDhamView({super.key});

  // Reactive state variable to track the active image index in the carousel
  final RxInt _currentCarouselIndex = 0.obs;

  // List of images for the slider
  final List<String> _carouselImages = [
    ImageConstant.bhaktiDham, // Image 1
    ImageConstant.mewar,      // Image 2
    ImageConstant.bhaktiDham, // Image 3
  ];

  // ─── Individual 'isExpanded' states for each Grid Item ───
  final RxMap<int, bool> _expandedStates = <int, bool>{}.obs;

  // ─── FULL Temple Data Method ───
  // Converted to a method to access l10n strings dynamically
  List<Map<String, String>> _getTempleList(AppLocalizations l10n) {
    return [
      {
        "image": ImageConstant.bhaktiDham,
        "title": l10n.temple1Title,
        "desc": l10n.temple1Desc
      },
      {
        "image": ImageConstant.bhaktiDham,
        "title": l10n.temple2Title,
        "desc": l10n.temple2Desc
      },
      {
        "image": ImageConstant.bhaktiDham,
        "title": l10n.temple3Title,
        "desc": l10n.temple3Desc
      },
      {
        "image": ImageConstant.bhaktiDham,
        "title": l10n.temple4Title,
        "desc": l10n.temple4Desc
      },
      {
        "image": ImageConstant.bhaktiDham,
        "title": l10n.temple5Title,
        "desc": l10n.temple5Desc
      },
      {
        "image": ImageConstant.bhaktiDham,
        "title": l10n.temple6Title,
        "desc": l10n.temple6Desc
      },
    ];
  }

  @override
  Widget build(BuildContext context) {
    Get.put(HomeController());
    final l10n = AppLocalizations.of(context)!;

    // Fetch translated temple list
    final List<Map<String, String>> templeList = _getTempleList(l10n);
    final String narrationText = l10n.bhaktiDhamNarrationText;

    return Scaffold(
      backgroundColor: const Color(0xFFFFF6F0),

      // ─── 1. APP BAR ───
      appBar: AppBar(
        backgroundColor: const Color(0xFFFFF6F0),
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new_rounded, color: Colors.black87),
          onPressed: () => Get.back(),
        ),
        title: Text(
          l10n.bhaktiDhamDetails,
          style: const TextStyle(
            color: Colors.black87,
            fontWeight: FontWeight.bold,
            fontSize: 18,
          ),
        ),
        centerTitle: true,
        actions: [
          IconButton(
            icon: const Icon(Icons.ios_share_rounded, color: Colors.black87),
            onPressed: () {},
          ),
        ],
      ),

      // ─── 2. MAIN SCROLLABLE CONTENT ───
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [

            // ─── 3. FULLY FUNCTIONAL IMAGE CAROUSEL CARD ───
            Container(
              padding: const EdgeInsets.all(12),
              decoration: _cardDecoration(),
              child: Column(
                children: [
                  SizedBox(
                    height: 180,
                    child: PageView.builder(
                      itemCount: _carouselImages.length,
                      onPageChanged: (index) {
                        _currentCarouselIndex.value = index;
                      },
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 4.0),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(12),
                            child: Image.asset(
                              _carouselImages[index],
                              fit: BoxFit.cover,
                              errorBuilder: (context, error, stackTrace) => _placeholderImage(),
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                  const SizedBox(height: 12),
                  // Dynamic Dots Indicator
                  Obx(() => Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: List.generate(
                      _carouselImages.length,
                          (index) => _buildDot(isActive: _currentCarouselIndex.value == index),
                    ),
                  )),
                ],
              ),
            ),
            const SizedBox(height: 16),


            // ─── 5. AUDIO PLAYER CARD (TTS INTEGRATED) ───
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
              decoration: _cardDecoration(),
              child: Row(
                children: [
                  GestureDetector(
                    onTap: () => controller.toggleNarration(narrationText),
                    child: Container(
                      width: 48,
                      height: 48,
                      decoration: const BoxDecoration(
                        color: Color(0xFFF47B20),
                        shape: BoxShape.circle,
                      ),
                      child: Obx(() => Icon(
                        controller.isPlaying.value ? Icons.pause_rounded : Icons.play_arrow_rounded,
                        color: Colors.white,
                        size: 28,
                      )),
                    ),
                  ),
                  const SizedBox(width: 12),

                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          height: 20,
                          child: SliderTheme(
                            data: SliderTheme.of(context).copyWith(
                              activeTrackColor: const Color(0xFFF47B20),
                              inactiveTrackColor: Colors.grey.shade300,
                              thumbColor: const Color(0xFFF47B20),
                              trackHeight: 3.0,
                              thumbShape: const RoundSliderThumbShape(enabledThumbRadius: 6.0),
                              overlayShape: SliderComponentShape.noOverlay,
                            ),
                            child: Obx(() => Slider(
                              value: controller.audioProgress.value,
                              onChanged: (value) {},
                            )),
                          ),
                        ),
                        const SizedBox(height: 6),
                        Text(
                          l10n.spiritualNarrationTitle,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: const TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.w600,
                            color: Colors.black87,
                          ),
                        ),
                      ],
                    ),
                  ),

                  const SizedBox(width: 8),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Obx(() {
                        String percentage = (controller.audioProgress.value * 100).toInt().toString();
                        return Text(
                          controller.isPlaying.value ? '$percentage%' : '2:34 / 5:15',
                          style: TextStyle(
                            fontSize: 10,
                            color: Colors.grey.shade600,
                            fontWeight: FontWeight.w500,
                          ),
                        );
                      }),
                      const SizedBox(height: 4),
                      const Icon(Icons.headphones_outlined, color: Color(0xFFB56A45), size: 22),
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(height: 16),

            // ─── 6. ABOUT CONTENT CARD ───
            Container(
              padding: const EdgeInsets.all(16),
              decoration: _cardDecoration(),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    l10n.whyPgkFamous,
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.black87,
                    ),
                  ),
                  const SizedBox(height: 12),

                  _buildParagraph(l10n.pgkFamousDesc),

                  _buildSubHeader(l10n.celebratingHeroicLegacy),
                  _buildParagraph(l10n.celebratingHeroicLegacyDesc),

                  _buildSubHeader(l10n.educationalInsights),
                  _buildParagraph(l10n.educationalInsightsDesc),

                  _buildSubHeader(l10n.scenicSereneEnv),
                  _buildParagraph(l10n.scenicSereneEnvDesc),

                  _buildSubHeader(l10n.culturalPrograms),
                  _buildParagraph(l10n.culturalProgramsDesc),

                  const SizedBox(height: 16),
                  const Divider(),
                  const SizedBox(height: 8),

                  Text(
                    l10n.faqTitleBhakti,
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.black87,
                    ),
                  ),
                  const SizedBox(height: 12),
                  _buildFaqTile(question: l10n.faqBhaktiQ1, answer: l10n.faqBhaktiA1),
                  _buildFaqTile(question: l10n.faqBhaktiQ2, answer: l10n.faqBhaktiA2),
                  _buildFaqTile(question: l10n.faqBhaktiQ3, answer: l10n.faqBhaktiA3),
                  _buildFaqTile(question: l10n.faqBhaktiQ4, answer: l10n.faqBhaktiA4),
                ],
              ),
            ),
            const SizedBox(height: 24),

            // ─── 7. TEMPLES GRID WITH PROPER READ MORE ───
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 4.0),
              child: Text(
                l10n.templesInBhaktiDham,
                style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.black87,
                ),
              ),
            ),
            const SizedBox(height: 16),

            Wrap(
              spacing: 16,
              runSpacing: 24,
              crossAxisAlignment: WrapCrossAlignment.start,
              children: List.generate(templeList.length, (index) {
                final item = templeList[index];
                final itemWidth = (MediaQuery.of(context).size.width - 32 - 16) / 2;

                return SizedBox(
                  width: itemWidth,
                  child: _buildExpandableTempleGridItem(
                    index: index,
                    imagePath: item["image"]!,
                    title: item["title"]!,
                    desc: item["desc"]!,
                    l10n: l10n, // Passed l10n down to translate the button text
                  ),
                );
              }),
            ),

            const SizedBox(height: 100), // Spacer for bottom nav
          ],
        ),
      ),
    );
  }

  // ─── UI Helper Methods ───

  BoxDecoration _cardDecoration() {
    return BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(16),
      boxShadow: [
        BoxShadow(
          color: Colors.black.withValues(alpha: 0.04),
          blurRadius: 10,
          offset: const Offset(0, 4),
        ),
      ],
    );
  }

  Widget _buildDot({required bool isActive}) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 200),
      margin: const EdgeInsets.symmetric(horizontal: 4),
      width: isActive ? 18 : 6,
      height: 6,
      decoration: BoxDecoration(
        color: isActive ? const Color(0xFFF47B20) : Colors.grey.shade300,
        borderRadius: BorderRadius.circular(3),
      ),
    );
  }

  Widget _placeholderImage() {
    return Container(
      width: double.infinity,
      color: Colors.grey.shade200,
      child: const Icon(Icons.image_outlined, color: Colors.grey, size: 40),
    );
  }

  Widget _buildSubHeader(String text) {
    return Padding(
      padding: const EdgeInsets.only(top: 16.0, bottom: 8.0),
      child: Text(
        text,
        style: const TextStyle(
          fontSize: 15.0,
          fontWeight: FontWeight.bold,
          color: Colors.black87,
        ),
      ),
    );
  }

  Widget _buildParagraph(String text) {
    return Text(
      text,
      style: const TextStyle(
        fontSize: 14.0,
        color: Colors.black87,
        height: 1.5,
      ),
    );
  }

  Widget _buildFaqTile({required String question, required String answer}) {
    return Theme(
      data: Theme.of(Get.context!).copyWith(dividerColor: Colors.transparent),
      child: Column(
        children: [
          ExpansionTile(
            tilePadding: const EdgeInsets.symmetric(horizontal: 0),
            title: Text(
              question,
              style: const TextStyle(
                fontSize: 14.0,
                fontWeight: FontWeight.w600,
                color: Color(0xFFE2703A),
              ),
            ),
            iconColor: const Color(0xFFE2703A),
            collapsedIconColor: Colors.grey.shade400,
            childrenPadding: const EdgeInsets.only(bottom: 16.0),
            children: [
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  answer,
                  style: const TextStyle(
                    fontSize: 13.0,
                    color: Colors.black87,
                    height: 1.5,
                  ),
                ),
              ),
            ],
          ),
          Divider(color: Colors.grey.shade300, height: 1),
        ],
      ),
    );
  }

  // ─── FULLY FIXED EXPANDABLE HELPER ───
  Widget _buildExpandableTempleGridItem({
    required int index,
    required String imagePath,
    required String title,
    required String desc,
    required AppLocalizations l10n,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisSize: MainAxisSize.min, // Hugs content perfectly
      children: [
        // Image
        Container(
          width: double.infinity,
          height: 160,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(24),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withValues(alpha: 0.08),
                blurRadius: 8,
                offset: const Offset(0, 4),
              ),
            ],
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(24),
            child: Image.asset(
              imagePath,
              fit: BoxFit.cover,
              errorBuilder: (context, error, stackTrace) => _placeholderImage(),
            ),
          ),
        ),
        const SizedBox(height: 12),

        // Title
        Text(
          title,
          textAlign: TextAlign.center,
          maxLines: 2,
          overflow: TextOverflow.ellipsis,
          style: const TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w800,
            color: Colors.black87,
            height: 1.2,
          ),
        ),
        const SizedBox(height: 6),

        // Reactive Text & Button
        Obx(() {
          final isExpanded = _expandedStates[index] ?? false;

          return Column(
            children: [
              // ─── FIXED TEXT TOGGLE ───
              if (isExpanded)
                Text(
                  desc, // Show all data
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    fontSize: 11,
                    fontWeight: FontWeight.w400,
                    color: Colors.black54,
                    height: 1.3,
                  ),
                )
              else
                Text(
                  desc, // Limit to 3 lines
                  textAlign: TextAlign.center,
                  maxLines: 3,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(
                    fontSize: 11,
                    fontWeight: FontWeight.w400,
                    color: Colors.black54,
                    height: 1.3,
                  ),
                ),

              const SizedBox(height: 12),

              // Button
              GestureDetector(
                onTap: () {
                  _expandedStates[index] = !isExpanded;
                },
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey.shade400, width: 1),
                    borderRadius: BorderRadius.circular(4),
                  ),
                  child: Text(
                    isExpanded ? l10n.showLess : l10n.readMoreBtn,
                    style: const TextStyle(
                      fontSize: 10,
                      fontWeight: FontWeight.w600,
                      color: Colors.black87,
                    ),
                  ),
                ),
              ),
            ],
          );
        }),
      ],
    );
  }
}