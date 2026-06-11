import '../../../common/constant/app_imports.dart';
import '../controllers/splash_controller.dart';

class SplashView extends GetView<SplashController> {
  const SplashView({super.key});

  @override
  Widget build(BuildContext context) {
    // Calling the controller explicitly ensures it is initialized immediately when the view builds
    Get.put(SplashController());

    return Scaffold(
      backgroundColor: AppColors.background, // Uses your warm thematic background surface
      body: Stack(
        children: [
          // ─── Optional Background Overlay Asset ───
          Positioned.fill(
            child: Opacity(
              opacity: 0.1, // Keeps the background subtle so it doesn't distract
              child: Image.asset(
                ImageConstant.splashBackground,
                fit: BoxFit.cover,
                errorBuilder: (context, error, stackTrace) => const SizedBox.shrink(),
              ),
            ),
          ),

          // ─── Core Brand Core Layout ───
          Center(
            child: Hero(
              tag: 'appHeroLogo', // Smooth transition link identifier to the Login screen logo container
              child: Container(
                width: 160,
                height: 160,
                decoration: BoxDecoration(
                  color: AppColors.white,
                  shape: BoxShape.circle,
                  boxShadow: [
                    BoxShadow(
                      color: AppColors.lightShadow,
                      blurRadius: 20,
                      offset: const Offset(0, 10),
                    ),
                  ],
                ),
                padding: const EdgeInsets.all(16),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(80),
                  child: Image.asset(
                    ImageConstant.appLogo,
                    fit: BoxFit.contain,
                    errorBuilder: (context, error, stackTrace) => const Icon(
                      Icons.account_balance_outlined,
                      size: 60,
                      color: AppColors.primary,
                    ),
                  ),
                ),
              ),
            ),
          ),

          // ─── Bottom Status / Progress Indicator ───
          Positioned(
            bottom: 60,
            left: 0,
            right: 0,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const SizedBox(
                  width: 24,
                  height: 24,
                  child: CircularProgressIndicator(
                    color: AppColors.primary,
                    strokeWidth: 2.5,
                  ),
                ),
                const SizedBox(height: 16),
                Text(
                  'Loading, please wait...',
                  style: TextStyle(
                    color: AppColors.textSecondary.withOpacity(0.8),
                    fontSize: 13,
                    fontWeight: FontWeight.w400,
                    letterSpacing: 0.3,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}