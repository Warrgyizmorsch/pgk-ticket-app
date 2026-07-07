import 'package:mobile_scanner/mobile_scanner.dart';
import '../../../common/constant/app_imports.dart';
import '../controllers/scanner_controller.dart';

class ScannerView extends GetView<ScannerController> {
  const ScannerView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: CustomAppBar(
        title: 'QR Scan',
        showBackButton: false,
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

            // Functional QR Scanner Area
            Container(
              height: 280,
              width: 280,
              clipBehavior: Clip.hardEdge,
              decoration: BoxDecoration(
                border: Border.all(color: AppColors.textPrimary, width: 2),
                borderRadius: BorderRadius.circular(16),
              ),
              child: MobileScanner(
                controller: controller.scannerController,
                onDetect: controller.onDetect,
                // NEW (Use this)
                errorBuilder: (context, error) {
                  return const Center(
                    child: Icon(Icons.error, color: Colors.red, size: 50),
                  );
                },
              ),
            ),
            const SizedBox(height: 20),

            // Action Buttons (Gallery & Flash)
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CircleAvatar(
                  backgroundColor: AppColors.lightDisabled.withValues(alpha: 0.3),
                  radius: 24,
                  child: IconButton(
                    icon: const Icon(Icons.image, color: AppColors.textSecondary),
                    onPressed: controller.scanFromGallery,
                  ),
                ),
                const SizedBox(width: 20),
                CircleAvatar(
                  backgroundColor: AppColors.lightDisabled.withValues(alpha: 0.3),
                  radius: 24,
                  child: IconButton(
                    icon: const Icon(Icons.flash_on, color: AppColors.textSecondary),
                    onPressed: controller.toggleFlash,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 24),

            // Information Card
            Obx(() {
              return Card(
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
                      // 👉 Dynamic text injected here
                      Text(
                        controller.scannedText.value,
                        style: AppTextStyles.bodyMedium,
                      ),
                      const SizedBox(height: 12),

                      // Read More button (Optional: you might want to hide this if the text is short)
                      GestureDetector(
                        onTap: () {
                          // Handle read more tap
                        },
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
              );
            }),
            const SizedBox(height: 20),

            // Reactive Audio Player Component
            Obx(() {
              final isPlaying = controller.isPlaying.value;
              final progress = controller.audioProgress.value;

              // 👉 Ensure the TTS engine reads the actual scanned text
              final textToRead = controller.scannedText.value;

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
            const SizedBox(height: 24),
          ],
        ),
      ),
    );
  }
}