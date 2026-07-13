import '../../../common/constant/app_imports.dart';

class HaldighatiView extends GetView<HomeController> {
  const HaldighatiView({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(HomeController());
    final l10n = AppLocalizations.of(context)!;

    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: CustomAppBar(
        title: l10n.haldighatiDirghaTitle,
        showBackButton: true, // This is true by default in your custom widget
      ),
      // ─── 2. MAIN SCROLLABLE CONTENT ───
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Stack(
              alignment: Alignment.bottomLeft,
              children: [
                Image.asset(
                  ImageConstant.haldighatiDirgha,
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
                        Colors.black.withValues(alpha: 0.85),
                        Colors.transparent,
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Text(
                    l10n.haldighatiDirghaTitle,
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
            const SizedBox(height: 16),


            // ─── 4. AUDIO PLAYER CARD (TTS INTEGRATED) ───
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
              decoration: _cardDecoration(),
              child: Row(
                children: [
                  GestureDetector(
                    onTap: () => controller.toggleNarration(l10n.haldighatiNarrationText1),
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
                          l10n.haldighatiNarrationLabel,
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
                          controller.isPlaying.value ? '$percentage%' : l10n.audioGuideLabel,
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

            // ─── 5. ABOUT CONTENT CARD ───
            Container(
              padding: const EdgeInsets.all(16),
              decoration: _cardDecoration(),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    l10n.exploreLegacyTitle,
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.black87,
                    ),
                  ),
                  const SizedBox(height: 12),

                  _buildParagraph(l10n.exploreLegacyDesc1),

                  _buildSubHeader(l10n.highlightsMuseumTitle),
                  _buildBulletPoint(l10n.highlightMuseum1),
                  _buildBulletPoint(l10n.highlightMuseum2),
                  _buildBulletPoint(l10n.highlightMuseum3),
                  _buildBulletPoint(l10n.highlightMuseum4),
                  _buildBulletPoint(l10n.highlightMuseum5),

                  _buildSubHeader(l10n.visitorTipsTitle),
                  _buildBulletPoint(l10n.visitorTip1),
                  _buildBulletPoint(l10n.visitorTip2),
                  _buildBulletPoint(l10n.visitorTip3),

                  const SizedBox(height: 8),
                  _buildParagraph(l10n.exploreLegacyDesc2),

                  const SizedBox(height: 16),
                  const Divider(),
                  const SizedBox(height: 8),

                  Text(
                    l10n.faqTitleStandard, // Or use l10n.faqTitle depending on your existing key
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.black87,
                    ),
                  ),
                  const SizedBox(height: 12),

                  _buildFaqTile(
                      question: l10n.faqHaldighatiQ1,
                      answer: l10n.faqHaldighatiA1
                  ),
                  _buildFaqTile(
                      question: l10n.faqHaldighatiQ2,
                      answer: l10n.faqHaldighatiA2
                  ),
                  _buildFaqTile(
                      question: l10n.faqHaldighatiQ3,
                      answer: l10n.faqHaldighatiA3
                  ),
                  _buildFaqTile(
                      question: l10n.faqHaldighatiQ4,
                      answer: l10n.faqHaldighatiA4
                  ),
                  _buildFaqTile(
                      question: l10n.faqHaldighatiQ5,
                      answer: l10n.faqHaldighatiA5
                  ),
                ],
              ),
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
      textAlign: TextAlign.justify,
      style: const TextStyle(
        fontSize: 14.0,
        color: Colors.black87,
        height: 1.5,
      ),
    );
  }

  Widget _buildBulletPoint(String text) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8.0, left: 4.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            margin: const EdgeInsets.only(top: 6, right: 10),
            width: 6,
            height: 6,
            decoration: const BoxDecoration(
              color: Color(0xFFF47B20), // Primary Orange
              shape: BoxShape.circle,
            ),
          ),
          Expanded(
            child: Text(
              text,
              style: const TextStyle(
                fontSize: 14.0,
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
                color: Color(0xFFE2703A), // Darker Orange text for FAQ titles
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
}