import '../../../common/constant/app_imports.dart';
import '../controllers/home_controller.dart';

class RajasthanDirghaView extends GetView<HomeController> {
  RajasthanDirghaView({super.key});

  // Reactive state variable to track the active image index in the carousel
  final RxInt _currentCarouselIndex = 0.obs;

  // List of images for the slider (Update with your specific Rajasthan Dirgha ImageConstants)
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
          'Rajasthan Dirgha',
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
            ),
            const SizedBox(height: 16),


            // ─── 4. AUDIO PLAYER CARD (TTS INTEGRATED) ───
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
              decoration: _cardDecoration(),
              child: Row(
                children: [
                  GestureDetector(
                    onTap: () => controller.toggleNarration('In this epic, statues of 25 selected warriors, great personalities, saints, and local deities of Rajasthan are showcased...'),
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
                          'Rajasthan Dirgha Narration',
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
                    'The Great Personalities of Rajasthan',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.black87,
                    ),
                  ),
                  const SizedBox(height: 12),

                  _buildParagraph(
                      'In this epic, breathtaking statues of 25 selected warriors, great personalities, saints, and local deities of Rajasthan are proudly showcased. The exhibit serves as a cultural archive, offering a glimpse into the diverse spiritual and martial history of the region.'
                  ),

                  const SizedBox(height: 8),
                  const Divider(),
                  const SizedBox(height: 8),

                  _buildSubHeader('Prominent Local Deities'),
                  _buildBulletPoint('Ramdevji'),
                  _buildBulletPoint('Tejaji'),
                  _buildBulletPoint('Gogaji'),

                  const SizedBox(height: 12),

                  _buildSubHeader('Heroic Figures & Warriors'),
                  _buildBulletPoint('Durgadas Rathore'),
                  _buildBulletPoint('Hamir Chauhan'),
                  _buildBulletPoint('Rao Chandrasen'),
                  _buildBulletPoint('Rao Shekha Ji'),
                  _buildBulletPoint('And many more legendary figures.'),

                  const SizedBox(height: 16),

                  _buildParagraph(
                      'More than just a visual display, this epic dirgha provides thoroughly documented records of the life stories, teachings, and monumental sacrifices of these local deities, saints, and warriors.'
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
}