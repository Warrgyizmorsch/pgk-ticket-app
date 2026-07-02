import '../../../common/constant/app_imports.dart';
import '../controllers/home_controller.dart';

class HaldighatiView extends GetView<HomeController> {
  HaldighatiView({super.key});

  // Reactive state variable to track the active image index in the carousel
  final RxInt _currentCarouselIndex = 0.obs;

  // List of images for the slider (Update with your specific Haldighati ImageConstants)
  final List<String> _carouselImages = [
    ImageConstant.mewar,
    ImageConstant.bhaktiDham,
    ImageConstant.mewar,
  ];

  @override
  Widget build(BuildContext context) {
    Get.put(HomeController());
    // final l10n = AppLocalizations.of(context)!; // Uncomment when you add strings to l10n

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
          'Haldighati Vijay Yudh Dirgha',
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
                        Colors.black.withValues(alpha:0.85),
                        Colors.transparent,
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Text(
                    "Rajasthan Dirgha",
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                      height: 1.2,
                    ),
                  ),
                ),
              ],
            ),   Stack(
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
                        Colors.black.withValues(alpha:0.85),
                        Colors.transparent,
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Text(
                    "Haldighati Vijay Yudh Dirgha",
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
                    onTap: () => controller.toggleNarration('The Haldighati Vijay Yuddh Dirgha presents a powerful visual narration of the historic Battle of Haldighati...'),
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
                          'Battle of Haldighati Narration',
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
                          controller.isPlaying.value ? '$percentage%' : 'Audio Guide',
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
                  const Text(
                    'Explore the Legacy of Maharana Pratap',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.black87,
                    ),
                  ),
                  const SizedBox(height: 12),

                  _buildParagraph(
                      'Pratap Gaurav Kendra Udaipur offers a unique journey into the heroic life and achievements of Maharana Pratap, a symbol of courage and resilience in Indian history. This site is highly relevant for history lovers, tourists, and students keen on exploring the rich heritage of Rajasthan. As a prominent museum in Udaipur, the Maharana Pratap Museum Udaipur provides immersive exhibits that highlight the king’s struggles and victories, making it an essential destination for cultural exploration.'
                  ),

                  _buildSubHeader('Highlights of the Museum'),
                  _buildBulletPoint('The Maharana Pratap Museum displays a curated collection of historic artifacts, paintings, and weaponry.'),
                  _buildBulletPoint('Themed galleries recreate significant moments from Maharana Pratap’s battles and court life.'),
                  _buildBulletPoint('Rare manuscripts and photographs offer insights into 16th-century Rajput culture.'),
                  _buildBulletPoint('Interactive touchscreens provide engaging narratives and detailed information.'),
                  _buildBulletPoint('Planning a city tour? Don’t miss these essential Udaipur City Tour Places.'),

                  _buildSubHeader('Visitor Tips and Experience'),
                  _buildBulletPoint('Visit early in the morning or late afternoon to enjoy a quieter, more personalized experience.'),
                  _buildBulletPoint('Photography enthusiasts will find many scenic and historically rich spots for capturing unique shots.'),
                  _buildBulletPoint('Local guides and tour operators offer special heritage tours including Pratap Gaurav Kendra and nearby attractions.'),

                  const SizedBox(height: 8),
                  _buildParagraph(
                      'The Haldighati Vijay Yuddh Dirgha presents a powerful visual narration of the historic Battle of Haldighati fought between Maharana Pratap of Mewar and the Mughal forces. This gallery beautifully showcases the courage, military strategy, and unbreakable determination of the Rajput warriors who defended their homeland against a powerful empire. Through lifelike installations and artistic storytelling, the Dirgha preserves a proud chapter of Indian history and brings the spirit of honor and resistance to life.'
                  ),

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

                  _buildFaqTile(
                      question: 'What time does Pratap Gaurav Kendra open and close?',
                      answer: 'Visitors can explore the museum from 10:00 AM to 5:30 PM every day except on select holidays.'
                  ),
                  _buildFaqTile(
                      question: 'Is the Museum accessible for visitors with disabilities?',
                      answer: 'Yes, the museum is designed to be inclusive with features like ramps and assistance services.'
                  ),
                  _buildFaqTile(
                      question: 'Are guided tours available at the museum?',
                      answer: 'Yes, guided tours are offered in various languages and can be booked in advance.'
                  ),
                  _buildFaqTile(
                      question: 'Can school groups participate in educational programs?',
                      answer: 'Definitely, the museum regularly organizes tailored educational visits for students of all ages.'
                  ),
                  _buildFaqTile(
                      question: 'Is photography permitted inside?',
                      answer: 'Photography is allowed in designated areas, but flash and video recording may be restricted as per museum rules.'
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