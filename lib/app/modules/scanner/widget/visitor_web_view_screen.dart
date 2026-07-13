import '../../../common/constant/app_imports.dart';

class VisitorWebViewScreen extends StatefulWidget {
  final String? title;
  final String? thumbnailUrl;
  final String? videoUrl;
  final List<dynamic>? faqs; // If you imported your model, this can be List<FaqModel>?

  const VisitorWebViewScreen({
    super.key,
    this.title,
    this.thumbnailUrl,
    this.videoUrl,
    this.faqs,
  });

  @override
  State<VisitorWebViewScreen> createState() => _VisitorWebViewScreenState();
}

class _VisitorWebViewScreenState extends State<VisitorWebViewScreen> {
  // Get the existing controller
  final ScannerController controller = Get.find<ScannerController>();

  // Create a variable for our GetX listener
  late Worker _networkWorker;

  @override
  void initState() {
    super.initState();

    _networkWorker = ever(controller.isAuthorizedNetwork, (bool isAuthorized) {
      if (!isAuthorized) {
        Get.back();

        CustomSnackbar.showSnackbar(
          'Connection Lost',
          'You were disconnected from the authorized Wi-Fi network.',
          AppColors.error,
        );
      }
    });
  }

  @override
  void dispose() {
    _networkWorker.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: CustomAppBar(
        title: 'Visit Details',
        showBackButton: true,
      ),

      // ─── MAIN CONTENT ───
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [

            // ─── 1. HERO MEDIA SECTION ───
            ClipRRect(
              borderRadius: BorderRadius.circular(16),
              child: _buildMediaSection(controller),
            ),
            const SizedBox(height: 16),

            // ─── 2. WEB VIEW CONTENT CARD ───
            Obx(() => Container(
              height: controller.webViewHeight.value,
              clipBehavior: Clip.hardEdge,
              decoration: _cardDecoration(),
              child: Stack(
                children: [
                  if (controller.webController != null)
                    WebViewWidget(controller: controller.webController!),

                  if (controller.isWebLoading.value)
                    const Center(
                      child: CircularProgressIndicator(color: Color(0xFFF47B20)),
                    ),
                ],
              ),
            )),
            const SizedBox(height: 16),

            // ─── 3. FAQs SECTION ───
            if (widget.faqs != null && widget.faqs!.isNotEmpty) ...[
              const Text(
                'Frequently Asked Questions',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.black87,
                ),
              ),
              const SizedBox(height: 12),

              ListView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: widget.faqs!.length,
                itemBuilder: (context, index) {
                  final faq = widget.faqs![index];
                  return _buildFaqTile(
                    question: faq.question ?? '',
                    answer: faq.answer ?? '',
                  );
                },
              ),
              const SizedBox(height: 24),
            ],
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

  Widget _buildFaqTile({required String question, required String answer}) {
    return Theme(
      data: Theme.of(Get.context!).copyWith(dividerColor: Colors.transparent),
      child: Container(
        margin: const EdgeInsets.only(bottom: 12.0),
        decoration: BoxDecoration(
          color: AppColors.white,
          borderRadius: BorderRadius.circular(8),
          border: Border.all(color: AppColors.lightDivider),
        ),
        child: ExpansionTile(
          tilePadding: const EdgeInsets.symmetric(horizontal: 16.0),
          title: Text(
            question,
            style: const TextStyle(
              fontSize: 14.0,
              fontWeight: FontWeight.w600,
              color: AppColors.primary,
              fontFamily: FontFamily.medium,
            ),
          ),
          iconColor: AppColors.primary,
          collapsedIconColor: AppColors.textSecondary,
          childrenPadding: const EdgeInsets.only(left: 16.0, right: 16.0, bottom: 16.0),
          children: [
            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                answer,
                style: const TextStyle(
                  fontSize: 13.0,
                  color: AppColors.textPrimary,
                  height: 1.5,
                  fontFamily: FontFamily.regular,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildMediaSection(ScannerController controller) {
    return Obx(() {
      // ─── ACTIVE VIDEO PLAYER STATE ───
      if (controller.isVideoPlaying.value && controller.videoController != null) {
        return Container(
          height: 260,
          width: double.infinity,
          color: Colors.black,
          child: controller.isVideoLoading.value
              ? const Center(child: CircularProgressIndicator(color: Colors.white))
              : _buildActiveVideoPlayer(controller.videoController!),
        );
      }

      // ─── DEFAULT STATE: THUMBNAIL ───
      return GestureDetector(
        onTap: widget.videoUrl != null ? () => controller.initializeAndPlayVideo(widget.videoUrl!) : null,
        child: Stack(
          alignment: Alignment.bottomLeft,
          children: [
            // 1. Thumbnail
            if (widget.thumbnailUrl != null)
              Image.network(
                widget.thumbnailUrl!,
                width: double.infinity,
                height: 260,
                fit: BoxFit.cover,
                errorBuilder: (context, error, stackTrace) => _buildPlaceholder(),
              )
            else
              _buildPlaceholder(),

            // 2. Gradient Overlay for text readability
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

            // 3. Play Icon in center
            if (widget.videoUrl != null)
              Positioned.fill(
                child: Center(
                  child: Container(
                    padding: const EdgeInsets.all(12),
                    decoration: BoxDecoration(
                      color: Colors.black.withValues(alpha: 0.6),
                      shape: BoxShape.circle,
                    ),
                    child: const Icon(Icons.play_arrow_rounded, color: Colors.white, size: 40),
                  ),
                ),
              ),

            // 4. Title Text
            if (widget.title != null)
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Text(
                  widget.title!,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                    height: 1.2,
                  ),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
          ],
        ),
      );
    });
  }

  Widget _buildActiveVideoPlayer(VideoPlayerController videoCtrl) {
    return GestureDetector(
      onTap: () {
        videoCtrl.value.isPlaying ? videoCtrl.pause() : videoCtrl.play();
      },
      child: Stack(
        alignment: Alignment.center,
        children: [
          AspectRatio(
            aspectRatio: videoCtrl.value.aspectRatio,
            child: VideoPlayer(videoCtrl),
          ),
          ValueListenableBuilder(
            valueListenable: videoCtrl,
            builder: (context, VideoPlayerValue value, child) {
              if (value.isPlaying) return const SizedBox.shrink();
              return Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Colors.black.withValues(alpha: 0.6),
                  shape: BoxShape.circle,
                ),
                child: const Icon(Icons.play_arrow_rounded, color: Colors.white, size: 50),
              );
            },
          ),
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.bottomCenter,
                  end: Alignment.topCenter,
                  colors: [
                    Colors.black.withValues(alpha: 0.8),
                    Colors.transparent,
                  ],
                ),
              ),
              child: Row(
                children: [
                  ValueListenableBuilder(
                    valueListenable: videoCtrl,
                    builder: (context, VideoPlayerValue value, child) {
                      return GestureDetector(
                        onTap: () => value.isPlaying ? videoCtrl.pause() : videoCtrl.play(),
                        child: Icon(
                          value.isPlaying ? Icons.pause_rounded : Icons.play_arrow_rounded,
                          color: Colors.white,
                          size: 28,
                        ),
                      );
                    },
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: VideoProgressIndicator(
                      videoCtrl,
                      allowScrubbing: true,
                      padding: const EdgeInsets.symmetric(vertical: 8),
                      colors: const VideoProgressColors(
                        playedColor: Color(0xFFF47B20),
                        bufferedColor: Colors.white38,
                        backgroundColor: Colors.white24,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildPlaceholder() {
    return Container(
      width: double.infinity,
      height: 260,
      color: Colors.grey[300],
      child: const Icon(Icons.image, size: 50, color: Colors.grey),
    );
  }
}