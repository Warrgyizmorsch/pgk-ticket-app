

import '../../../common/constant/app_imports.dart';
import '../controllers/home_controller.dart';

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

  // ─── FULL Temple Data ───
  final List<Map<String, String>> _templeList = [
    {
      "image": ImageConstant.bhaktiDham,
      "title": "Shri Riddhi Siddhi Vinayak Temple",
      "desc": "The first revered temple in Bhaktidham is dedicated to Lord Ganesha, the remover of obstacles. This beautifully crafted shrine marks the auspicious beginning of the spiritual journey within the complex. Visitors always start their prayers here to ensure a blessed and peaceful visit."
    },
    {
      "image": ImageConstant.bhaktiDham,
      "title": "ShreeNath Ji Mandir",
      "desc": "Located approximately 41 kilometers from Udaipur in the village of Nathdwara, this replica pays homage to the primary deity of the Pushtimarg sect. The idol reflects intricate art, devotion, and the deep-rooted faith of the Vallabh Sampradaya followers across India."
    },
    {
      "image": ImageConstant.bhaktiDham,
      "title": "Shree Dwarkadhish Ji Mandir",
      "desc": "The third seat of Shri Dwarkadheesh Ji, closely associated with the Vallabh tradition. This gorgeous temple recreation captures the spiritual essence of the famous shrine located in Kankroli, near Rajsamand Lake, allowing devotees to experience its divine presence."
    },
    {
      "image": ImageConstant.bhaktiDham,
      "title": "Shree Charbhuja Ji Mandir",
      "desc": "Temples of Lord Charbhujanath are established in almost every village in Mewar. This particular shrine honors the four-armed deity, who is deeply revered by the local Rajput community for bringing protection, prosperity, and peace to their families and land."
    },
    {
      "image": ImageConstant.bhaktiDham,
      "title": "Shree Ekling Nath Ji Mandir",
      "desc": "Shri Ekaling Ji is the principal deity of the Mewad region and the ruling deity of the Maharana themselves. This monumental replica brings the magnificent architectural grandeur of the original ancient Kailashpuri temple directly to the visitors of Bhakti Dham."
    },
    {
      "image": ImageConstant.bhaktiDham,
      "title": "Shree Sawariya Ji Mandir",
      "desc": "Shri Sanwaliya ji, a highly revered ancient manifestation of Lord Krishna, has been worshipped by merchants and traders for centuries. This vibrant shrine beautifully reflects the immense faith, wealth, and cultural richness of the Mewar trading community."
    },
  ];

  @override
  Widget build(BuildContext context) {
    Get.put(HomeController());

    const String narrationText = "Udaipur, the city of lakes and royal heritage, is home to many historical sites, but Pratap Gaurav Kendra stands out as a tribute to one of Rajasthan’s greatest warriors. Dedicated to Maharana Pratap, this center offers a unique and immersive experience.";

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
        title: const Text(
          'Bhakti Dham Details',
          style: TextStyle(
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

            // ─── 4. TITLE CARD ───
            Container(
              padding: const EdgeInsets.all(16),
              decoration: _cardDecoration(),
              child: const Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Bhakti Dham',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.black87,
                    ),
                  ),
                  SizedBox(height: 4),
                  Text(
                    'A Spiritual Center of Mewar',
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.black54,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
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
                        const Text(
                          'Spiritual Narration: The Significance of Bhakti Dham',
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
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
                  const Text(
                    'Why Pratap Gaurav Kendra is Famous',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.black87,
                    ),
                  ),
                  const SizedBox(height: 12),

                  _buildParagraph('Udaipur, the city of lakes and royal heritage, is home to many historical sites, but Pratap Gaurav Kendra stands out as a tribute to one of Rajasthan’s greatest warriors. Dedicated to Maharana Pratap, this center offers a unique and immersive experience that draws history enthusiasts, tourists, students, and locals alike. It beautifully complements the Maharana Pratap Smarak, enriching visitors’ understanding of this legendary Rajput hero.'),

                  _buildSubHeader('Celebrating Maharana Pratap’s Heroic Legacy'),
                  _buildParagraph('At Pratap Gaurav Kendra, visitors encounter a heartfelt homage to Maharana Pratap’s courage and sacrifice. The exhibits, statues, and detailed battle recreations vividly bring his story to life. This site provides an engaging narrative that enhances the significance of the nearby Maharana Pratap Smarak, making both places essential stops on any historical tour of Udaipur.'),

                  _buildSubHeader('Educational Insights for All Ages'),
                  _buildParagraph('Perfect for students, researchers, and history buffs, Pratap Gaurav Kendra offers:\n• In-depth information on Maharana Pratap’s life and times.\n• Multimedia displays and guided tours that explain Rajput history.\n• An educational environment that complements visits to the Maharana Pratap Smarak.\nThese features make it a favored destination for academic groups and cultural tourists. Make your visit memorable by watching the stunning Water Laser Show.'),

                  _buildSubHeader('Scenic and Serene Environment'),
                  _buildParagraph('Set in a peaceful location, the Kendra provides a reflective atmosphere for visitors. Just like the Maharana Pratap Smarak, it offers beautiful surroundings that allow guests to connect emotionally with the warrior’s legacy while enjoying scenic views and calmness.'),

                  _buildSubHeader('Cultural Programs and Community Involvement'),
                  _buildParagraph('Pratap Gaurav Kendra also serves as a cultural hub, hosting events that celebrate Rajput traditions and Maharana Pratap’s enduring spirit. These community-driven activities attract locals and tourists, helping preserve and promote Rajasthan’s rich cultural heritage.'),

                  const SizedBox(height: 16),
                  const Divider(),
                  const SizedBox(height: 8),

                  const Text(
                    'Frequently Asked Questions',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.black87,
                    ),
                  ),
                  const SizedBox(height: 12),
                  _buildFaqTile(question: 'Q1: When should I visit Pratap Gaurav Kendra for the best experience?',answer: 'The ideal time is between October and March, especially during early mornings or late afternoons when the weather is pleasant.'),
                  _buildFaqTile(question: 'Q2: Is there an entry fee for the Kendra?', answer:'Yes, a small entry fee applies, which is affordable for most visitors.'),
                  _buildFaqTile(question: 'Q3: Are guided tours available?',answer: 'Yes, guided tours and audio guides are provided to enrich your visit.'),
                  _buildFaqTile(question: 'Q4: Is the Kendra suitable for families and children?', answer:'Definitely! The site is family-friendly, with safe walking areas and educational displays.'),
                ],
              ),
            ),
            const SizedBox(height: 24),

            // ─── 7. TEMPLES GRID WITH PROPER READ MORE ───
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 4.0),
              child: Text(
                'Temples in Bhakti Dham',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.black87,
                ),
              ),
            ),
            const SizedBox(height: 16),

            // REMOVED THE OUTER Obx FROM HERE!
            Wrap(
              spacing: 16,
              runSpacing: 24,
              crossAxisAlignment: WrapCrossAlignment.start,
              children: List.generate(_templeList.length, (index) {
                final item = _templeList[index];
                final itemWidth = (MediaQuery.of(context).size.width - 32 - 16) / 2;

                return SizedBox(
                  width: itemWidth,
                  child: _buildExpandableTempleGridItem(
                    index: index,
                    imagePath: item["image"]!,
                    title: item["title"]!,
                    desc: item["desc"]!,
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
          color: Colors.black.withOpacity(0.04),
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
                color: Colors.black.withOpacity(0.08),
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
                    isExpanded ? 'Show less' : 'Read more',
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