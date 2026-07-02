import '../../../common/constant/app_imports.dart';
import '../controllers/splash_controller.dart';

class SplashView extends GetView<SplashController> {
  const SplashView({super.key});

  @override
  Widget build(BuildContext context) {
    // ─── CRITICAL FIX: Initialize your controller here ───
    Get.put(SplashController());

    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: const BoxDecoration(
          gradient: AppColors.discountGradient,
        ),
        child: Stack(
          children: [
            // ─── Core Brand Logo Layout ───
            Center(
              child: Hero(
                tag: 'appHeroLogo',
                child: Container(
                  width: 200,
                  height: 200,
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
                      color: AppColors.white,
                      strokeWidth: 2.5,
                    ),
                  ),
                  const SizedBox(height: 16),
                  Text(
                    'Loading, please wait...',
                    style: TextStyle(
                      color: AppColors.white.withValues(alpha:0.8),
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
      ),
    );
  }
}