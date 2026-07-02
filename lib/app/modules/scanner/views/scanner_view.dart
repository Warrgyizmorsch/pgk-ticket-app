import '../../../common/constant/app_imports.dart';
import '../controllers/scanner_controller.dart';

class ScannerView extends GetView<ScannerController> {
  const ScannerView({super.key});

  @override
  Widget build(BuildContext context) {


    return Scaffold(
      backgroundColor: AppColors.white,

      // Custom AppBar integration
      appBar: CustomAppBar(
        title: 'QR Scan',
        showBackButton: false,
        leading: IconButton(
          icon: const Icon(Icons.menu, color: AppColors.textPrimary),
          onPressed: () {
            // Handle drawer or menu logic
          },
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.notifications_none, color: AppColors.textPrimary),
            onPressed: () {
              // Handle notifications
            },
          ),
        ],
      ),

      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(height: 10),

            // Subtitle
            Text(
              'Scan Your Qr Code Here',
              style: AppTextStyles.subtitle.copyWith(color: AppColors.primary),
            ),
            const SizedBox(height: 20),

            // QR Scanner Area Mockup
            Container(
              height: 280,
              width: 280,
              decoration: BoxDecoration(
                border: Border.all(color: AppColors.textPrimary, width: 2),
                borderRadius: BorderRadius.circular(16),
              ),
              child: const Center(
                // Replace this Icon with your actual QR Scanner widget
                child: Icon(
                  Icons.qr_code_2,
                  size: 250,
                  color: AppColors.textPrimary,
                ),
              ),
            ),
            const SizedBox(height: 20),

            // Action Buttons (Gallery & Flash)
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CircleAvatar(
                  backgroundColor: AppColors.lightDisabled.withOpacity(0.3),
                  radius: 24,
                  child: IconButton(
                    icon: const Icon(Icons.image, color: AppColors.textSecondary),
                    onPressed: () {},
                  ),
                ),
                const SizedBox(width: 20),
                CircleAvatar(
                  backgroundColor: AppColors.lightDisabled.withOpacity(0.3),
                  radius: 24,
                  child: IconButton(
                    icon: const Icon(Icons.flash_on, color: AppColors.textSecondary),
                    onPressed: () {},
                  ),
                ),
              ],
            ),
            const SizedBox(height: 24),

            // Information Card
            Card(
              elevation: 0,
              color: AppColors.white,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16),
                side: const BorderSide(color: AppColors.lightDivider),
              ),
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s,\n\nLorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s,',
                      style: AppTextStyles.bodyMedium,
                    ),
                    const SizedBox(height: 12),
                    GestureDetector(
                      onTap: () {},
                      child: Text(
                        'Read more',
                        style: AppTextStyles.bodyMedium.copyWith(
                          color: AppColors.primary,
                          decoration: TextDecoration.underline,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
            const SizedBox(height: 20),

            // Video Player Placeholder
            Container(
              height: 160,
              width: double.infinity,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                color: AppColors.lightDisabled,
                // Replace with actual asset or network image
                image: const DecorationImage(
                  image: AssetImage(ImageConstant.pgkFullImage),
                  fit: BoxFit.cover,
                ),
              ),
              child: Center(
                child: CircleAvatar(
                  backgroundColor: AppColors.black.withOpacity(0.54),
                  radius: 24,
                  child: IconButton(
                    icon: const Icon(Icons.play_arrow, color: AppColors.white),
                    onPressed: () {},
                  ),
                ),
              ),
            ),
            const SizedBox(height: 20),

            // Reactive Audio Player Component
            Obx(() {
              // Now "controller" automatically references ScannerController via GetView
              final isPlaying = controller.isPlaying.value;
              final progress = controller.audioProgress.value;
              const textToRead = "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s.";

              return Container(
                padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                decoration: BoxDecoration(
                  color: AppColors.white,
                  borderRadius: BorderRadius.circular(12),
                  boxShadow: const [
                    BoxShadow(
                      color: AppColors.lightShadow,
                      blurRadius: 4,
                      spreadRadius: 1,
                    )
                  ],
                ),
                child: Row(
                  children: [
                    Container(
                      padding: const EdgeInsets.all(8),
                      decoration: BoxDecoration(
                        color: AppColors.tagBg,
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: const Icon(Icons.headphones, color: AppColors.primary),
                    ),
                    const SizedBox(width: 12),

                    // Dynamic Play/Pause
                    GestureDetector(
                      onTap: () => controller.toggleNarration(textToRead),
                      child: Icon(
                        isPlaying ? Icons.pause_circle_filled : Icons.play_arrow,
                        color: AppColors.textPrimary,
                        size: 28,
                      ),
                    ),
                    const SizedBox(width: 8),

                    // Progress Percentage
                    Text(
                      '${(progress * 100).toInt()}%',
                      style: AppTextStyles.caption,
                    ),

                    // Dynamic Waveform
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: List.generate(
                              15,
                                  (index) {
                                final barThreshold = index / 15;
                                final isActive = progress > barThreshold;

                                return Padding(
                                  padding: const EdgeInsets.symmetric(horizontal: 2.0),
                                  child: AnimatedContainer(
                                    duration: const Duration(milliseconds: 150),
                                    width: 3,
                                    height: (index % 3 == 0) ? 20 : 10,
                                    color: isActive ? AppColors.primary : AppColors.lightDisabled,
                                  ),
                                );
                              }
                          ),
                        ),
                      ),
                    ),
                    const Icon(Icons.volume_up, color: AppColors.textSecondary, size: 20),
                  ],
                ),
              );
            }),

            // Standard bottom padding to clear the global bottom navigation bar
            const SizedBox(height: 100),
          ],
        ),
      ),
    );
  }
}