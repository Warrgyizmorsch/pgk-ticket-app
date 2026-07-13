import '../../../common/constant/app_imports.dart';


class BhaktiDhamView extends GetView<HomeController> {
  BhaktiDhamView({super.key});

  final RxInt _currentCarouselIndex = 0.obs;

  final List<String> _carouselImages = [
    ImageConstant.bhaktiDhamIntro,
    ImageConstant.bhaktiDham,
    ImageConstant.pgkFullImage,
  ];



  List<Map<String, String>> _getTempleList(AppLocalizations l10n) {
    return [
      {
        "image": ImageConstant.ridhiSidhiVinayakMandir,
        "title": l10n.templeDetailVinayakTitle,
        "desc": l10n.templeDetailVinayakDesc
      },
      {
        "image": ImageConstant.shreeNathJiMandir,
        "title": l10n.templeDetailShreenathTitle,
        "desc": l10n.templeDetailShreenathDesc
      },
      {
        "image": ImageConstant.dwarkadhishJiMandir,
        "title": l10n.templeDetailDwarkadhishTitle,
        "desc": l10n.templeDetailDwarkadhishDesc
      },
      {
        "image": ImageConstant.charbhujaJiMandir,
        "title": l10n.templeDetailCharbhujaTitle,
        "desc": l10n.templeDetailCharbhujaDesc
      },
      {
        "image": ImageConstant.eklingNathJiMandir,
        "title": l10n.templeDetailEklingTitle,
        "desc": l10n.templeDetailEklingDesc
      },
      {
        "image": ImageConstant.sawariyaJiMandir,
        "title": l10n.templeDetailSawariyaTitle,
        "desc": l10n.templeDetailSawariyaDesc
      },
      {
        "image": ImageConstant.chamundaMataMandir,
        "title": l10n.templeDetailChamundaTitle,
        "desc": l10n.templeDetailChamundaDesc
      },
      {
        "image": ImageConstant.kesariyaJiMandir,
        "title": l10n.templeDetailKesariyaTitle,
        "desc": l10n.templeDetailKesariyaDesc
      },
      {
        "image": ImageConstant.ramDarbarMandir,
        "title": l10n.templeDetailRamDarbarTitle,
        "desc": l10n.templeDetailRamDarbarDesc
      },
    ];
  }

  @override
  Widget build(BuildContext context) {
    Get.put(HomeController());
    final l10n = AppLocalizations.of(context)!;

    final List<Map<String, String>> templeList = _getTempleList(l10n);
    final String narrationText = l10n.bhaktiDhamNarrationText;

    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: CustomAppBar(
        title:  l10n.bhaktiDhamDetails,
        showBackButton: true, // This is true by default in your custom widget
      ),


      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [

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


            GridView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: templeList.length,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 14,
                mainAxisSpacing: 16,
                mainAxisExtent: 310, // Locks card boundaries to protect row alignments
              ),
              itemBuilder: (context, index) {
                final item = templeList[index];
                return _buildExpandableTempleGridItem(
                  index: index,
                  imagePath: item["image"]!,
                  title: item["title"]!,
                  desc: item["desc"]!,
                  l10n: l10n,
                );
              },
            ),



            //
            // Wrap(
            //   spacing: 16,
            //   runSpacing: 24,
            //   crossAxisAlignment: WrapCrossAlignment.start,
            //   children: List.generate(templeList.length, (index) {
            //     final item = templeList[index];
            //     final itemWidth = (MediaQuery.of(context).size.width - 32 - 16) / 2;
            //
            //     return SizedBox(
            //       width: itemWidth,
            //       child: _buildExpandableTempleGridItem(
            //         index: index,
            //         imagePath: item["image"]!,
            //         title: item["title"]!,
            //         desc: item["desc"]!,
            //         l10n: l10n, // Passed l10n down to translate the button text
            //       ),
            //     );
            //   }),
            // ),

            const SizedBox(height: 24), // Spacer for bottom nav
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
  Widget _buildExpandableTempleGridItem({
    required int index,
    required String imagePath,
    required String title,
    required String desc,
    required AppLocalizations l10n,
  }) {
    return Card(
      margin: EdgeInsets.zero,
      elevation: 0,
      color: Colors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
        side: BorderSide(color: Colors.grey.shade100, width: 1),
      ),
      clipBehavior: Clip.antiAlias,
      child: InkWell(
        onTap: () {
          // Tapping the card opens a beautifully presented Detail Bottom Sheet
          // to read long historical narratives without breaking grid view UI
          _showTempleDetailBottomSheet(Get.context!, title, imagePath, desc);
        },
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // Lighter, unified image container with a subtle gradient mask
            AspectRatio(
              aspectRatio: 2 / 3,
              child: Stack(
                fit: StackFit.expand,
                children: [
                  Image.asset(
                    imagePath,
                    fit: BoxFit.cover,
                    errorBuilder: (context, error, stackTrace) => _placeholderImage(),
                  ),
                  Container(
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [
                          Colors.black.withValues(alpha: 0.1),
                          Colors.black.withValues(alpha: 0.0),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),

            // Card content details
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(12.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                        color: Colors.black87,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Expanded(
                      child: Text(
                        desc,
                        maxLines: 3,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                          fontSize: 11,
                          fontWeight: FontWeight.w400,
                          color: Colors.grey.shade600,
                          height: 1.4,
                        ),
                      ),
                    ),
                    const SizedBox(height: 8),

                    // Interactive action bar hint
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          l10n.readMoreBtn,
                          style: const TextStyle(
                            fontSize: 11,
                            fontWeight: FontWeight.w700,
                            color: Color(0xFFF47B20),
                          ),
                        ),
                        const Icon(
                          Icons.arrow_forward_rounded,
                          size: 14,
                          color: Color(0xFFF47B20),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
  void _showTempleDetailBottomSheet(BuildContext context, String title, String imagePath, String desc) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: const Color(0xFFFFF6F0),
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
      ),
      builder: (context) {
        return DraggableScrollableSheet(
          initialChildSize: 0.65,
          minChildSize: 0.4,
          maxChildSize: 0.9,
          expand: false,
          builder: (context, scrollController) {
            return SingleChildScrollView(
              controller: scrollController,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  // Top Grab Handle pill
                  Center(
                    child: Container(
                      margin: const EdgeInsets.symmetric(vertical: 12),
                      width: 40,
                      height: 4,
                      decoration: BoxDecoration(
                        color: Colors.grey.shade400,
                        borderRadius: BorderRadius.circular(2),
                      ),
                    ),
                  ),

                  // Hero Image Banner
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(16),
                      child: Image.asset(
                        imagePath,
                        height: 220,
                        fit: BoxFit.cover,
                        errorBuilder: (context, error, stackTrace) => _placeholderImage(),
                      ),
                    ),
                  ),

                  // Narrative Details Container
                  Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          title,
                          style: const TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Colors.black87,
                          ),
                        ),
                        const SizedBox(height: 8),
                        const Divider(color: Color(0xFFF47B20), thickness: 1.5, endIndent: 240),
                        const SizedBox(height: 12),
                        Text(
                          desc,
                          style: const TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                            color: Colors.black87,
                            height: 1.6,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            );
          },
        );
      },
    );
  }

  // // ─── FULLY FIXED EXPANDABLE HELPER ───
  // Widget _buildExpandableTempleGridItem({
  //   required int index,
  //   required String imagePath,
  //   required String title,
  //   required String desc,
  //   required AppLocalizations l10n,
  // }) {
  //   return Column(
  //     crossAxisAlignment: CrossAxisAlignment.center,
  //     mainAxisSize: MainAxisSize.min, // Hugs content perfectly
  //     children: [
  //       // Image
  //       Container(
  //         width: double.infinity,
  //         height: 160,
  //         decoration: BoxDecoration(
  //           borderRadius: BorderRadius.circular(24),
  //           boxShadow: [
  //             BoxShadow(
  //               color: Colors.black.withValues(alpha: 0.08),
  //               blurRadius: 8,
  //               offset: const Offset(0, 4),
  //             ),
  //           ],
  //         ),
  //         child: ClipRRect(
  //           borderRadius: BorderRadius.circular(24),
  //           child: Image.asset(
  //             imagePath,
  //             fit: BoxFit.cover,
  //             errorBuilder: (context, error, stackTrace) => _placeholderImage(),
  //           ),
  //         ),
  //       ),
  //       const SizedBox(height: 12),
  //
  //       // Title
  //       Text(
  //         title,
  //         textAlign: TextAlign.center,
  //         maxLines: 2,
  //         overflow: TextOverflow.ellipsis,
  //         style: const TextStyle(
  //           fontSize: 14,
  //           fontWeight: FontWeight.w800,
  //           color: Colors.black87,
  //           height: 1.2,
  //         ),
  //       ),
  //       const SizedBox(height: 6),
  //
  //       // Reactive Text & Button
  //       Obx(() {
  //         final isExpanded = _expandedStates[index] ?? false;
  //
  //         return Column(
  //           children: [
  //             // ─── FIXED TEXT TOGGLE ───
  //             if (isExpanded)
  //               Text(
  //                 desc, // Show all data
  //                 textAlign: TextAlign.center,
  //                 style: const TextStyle(
  //                   fontSize: 11,
  //                   fontWeight: FontWeight.w400,
  //                   color: Colors.black54,
  //                   height: 1.3,
  //                 ),
  //               )
  //             else
  //               Text(
  //                 desc, // Limit to 3 lines
  //                 textAlign: TextAlign.center,
  //                 maxLines: 3,
  //                 overflow: TextOverflow.ellipsis,
  //                 style: const TextStyle(
  //                   fontSize: 11,
  //                   fontWeight: FontWeight.w400,
  //                   color: Colors.black54,
  //                   height: 1.3,
  //                 ),
  //               ),
  //
  //             const SizedBox(height: 12),
  //
  //             // Button
  //             GestureDetector(
  //               onTap: () {
  //                 _expandedStates[index] = !isExpanded;
  //               },
  //               child: Container(
  //                 padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
  //                 decoration: BoxDecoration(
  //                   border: Border.all(color: Colors.grey.shade400, width: 1),
  //                   borderRadius: BorderRadius.circular(4),
  //                 ),
  //                 child: Text(
  //                   isExpanded ? l10n.showLess : l10n.readMoreBtn,
  //                   style: const TextStyle(
  //                     fontSize: 10,
  //                     fontWeight: FontWeight.w600,
  //                     color: Colors.black87,
  //                   ),
  //                 ),
  //               ),
  //             ),
  //           ],
  //         );
  //       }),
  //     ],
  //   );
  // }
}