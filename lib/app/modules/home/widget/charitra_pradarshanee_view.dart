import '../../../common/constant/app_imports.dart';
import '../controllers/home_controller.dart';

class CharitraPradarshaneeView extends GetView<HomeController> {
  CharitraPradarshaneeView({super.key});

  // Reactive state variable to track the active image index in the carousel
  final RxInt _currentCarouselIndex = 0.obs;

  // List of images for the slider (Update with your specific Charitra Pradarshanee ImageConstants)
  final List<String> _carouselImages = [
    ImageConstant.mewar,
    ImageConstant.bhaktiDham,
    ImageConstant.mewar,
  ];

  @override
  Widget build(BuildContext context) {
    Get.put(HomeController());
    // final l10n = AppLocalizations.of(context)!; // Uncomment for localization

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
          'Maharana Pratap Charitra Pradarshanee',
          style: TextStyle(
            color: Colors.black87,
            fontWeight: FontWeight.bold,
            fontSize: 16, // Slightly smaller to fit the long title
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
                    "Maharana Pratap Charitra Pradarshanee",
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
                    onTap: () => controller.toggleNarration('The life story of Maharana Pratap from birth to death is displayed through paintings in five rooms. Whether it is the birthplace of Pratap...'),
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
                          'Charitra Pradarshanee Narration',
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
                    'A Journey Through a Legend’s Life',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.black87,
                    ),
                  ),
                  const SizedBox(height: 12),

                  _buildParagraph(
                      'The life story of Maharana Pratap from birth to death is displayed through paintings in five rooms. Whether it is the birthplace of Pratap in Kumbhalgarh or scenes depicting Pratap freeing Abdul Rahim Khan-Khana’s family or the sacrifice of his loyal horse Chetak, these scenes provide a vivid portrayal through paintings, offering viewers an immersive experience.'
                  ),

                  _buildParagraph(
                      'A striking highlight is the Maharana Pratap statue that stands tall, symbolizing his unwavering spirit and bravery. The Charitra Pradarshanee offers a visually captivating and educational experience that brings the legendary Rajput warrior’s life to light.'
                  ),

                  const SizedBox(height: 8),
                  const Divider(),
                  const SizedBox(height: 8),

                  _buildSubHeader('The Grand Maharana Pratap Statue'),
                  _buildParagraph('Standing tall inside the Pradarshanee, this magnificent statue depicts Maharana Pratap mounted on his loyal horse, Chetak. It is a true tribute to the indomitable Rajput spirit.'),
                  _buildBulletPoint('Represents courage, sacrifice, and honor.'),
                  _buildBulletPoint('Serves as an inspiration for future generations.'),
                  _buildBulletPoint('A landmark that draws visitors from across India.'),

                  const SizedBox(height: 16),

                  _buildSubHeader('Key Highlights'),
                  _buildBulletPoint('Battle Dioramas: Life-like displays narrating the Battle of Haldighati and other decisive moments.'),
                  _buildBulletPoint('Weapons and Artifacts: Replicas of the swords, shields, and armors used by Rajput warriors.'),
                  _buildBulletPoint('Cultural Galleries: Exhibits showcasing Rajputana lifestyle, costumes, and traditions.'),
                  _buildBulletPoint('Freedom Fighters Section: Honoring India’s heroes who followed Maharana Pratap’s path of courage.'),

                  const SizedBox(height: 16),

                  _buildSubHeader('Why Visit During Your Udaipur Trip?'),
                  _buildBulletPoint('Establish a deeper connection with Rajasthan’s history.'),
                  _buildBulletPoint('A chance to learn about Maharana Pratap’s unmatched spirit of freedom.'),
                  _buildBulletPoint('An inspiring cultural experience unlike any other tourist site.'),

                  const SizedBox(height: 12),
                  _buildParagraph(
                      'More than a museum, the Maharana Pratap Charitra Pradarshanee is a place of inspiration. The exhibits and the statue ignite a sense of patriotism and pride in every visitor. It is a reminder that true leadership lies in selflessness, resilience, and honor.'
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
                      question: 'What is the Charitra Pradarshanee famous for?',
                      answer: 'It is famous for its magnificent Maharana Pratap statue and detailed galleries that bring to life the legacy of Maharana Pratap and the history of Mewar.'
                  ),
                  _buildFaqTile(
                      question: 'Where is the Maharana Pratap Statue located?',
                      answer: 'The grand Maharana Pratap statue is located at the Charitra Pradarshanee inside Pratap Gaurav Kendra, Udaipur.'
                  ),
                  _buildFaqTile(
                      question: 'How long does it take to explore?',
                      answer: 'Visitors usually spend 2–3 hours exploring the museum, statue, and exhibits in detail.'
                  ),
                  _buildFaqTile(
                      question: 'Is it suitable for families and children?',
                      answer: 'Yes, the museum is family-friendly and offers a wonderful educational experience for children and adults alike.'
                  ),
                  _buildFaqTile(
                      question: 'Why is the Maharana Pratap Statue important?',
                      answer: 'It is a cultural landmark that symbolizes bravery and sacrifice, keeping alive the story of Maharana Pratap for generations.'
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
          fontSize: 16.0,
          fontWeight: FontWeight.bold,
          color: Colors.black87,
        ),
      ),
    );
  }

  Widget _buildParagraph(String text) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12.0),
      child: Text(
        text,
        textAlign: TextAlign.justify,
        style: const TextStyle(
          fontSize: 14.0,
          color: Colors.black87,
          height: 1.5,
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
                fontWeight: FontWeight.w500,
                color: Colors.black87,
                height: 1.4,
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