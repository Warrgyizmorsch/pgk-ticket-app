import '../../../../l10n/app_localizations.dart';
import '../../../common/constant/app_imports.dart';
import '../controllers/otp_controller.dart';

class LanguageSelectionView extends GetView<OtpController> {
  const LanguageSelectionView({super.key});

  @override
  Widget build(BuildContext context) {
    // Access the localized strings from the current build context
    final localizations = AppLocalizations.of(context)!;

    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: AppBar(
        backgroundColor: AppColors.primary,
        elevation: 4,
        automaticallyImplyLeading: false,
        // Wrapped with Obx so the title string updates dynamically when a locale changes
        title: Obx(() {
          // Accessing the observable variable here registers it with this Obx scope
          final _ = controller.selectedLanguageId.value;
          return Text(
            localizations.chooseYourLanguage,
            style: AppTextStyles.titleLarge.copyWith(
              color: Colors.white,
              fontFamily: FontFamily.bold,
            ),
          );
        }),
        centerTitle: true,
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 32.0),
          child: Column(
            children: [
              // ─── Grid Option Array ───
              Expanded(
                child: GridView.builder(
                  itemCount: controller.supportedLanguages.length,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3,
                    crossAxisSpacing: 12,
                    mainAxisSpacing: 12,
                    childAspectRatio: 2.3,
                  ),
                  itemBuilder: (context, index) {
                    final lang = controller.supportedLanguages[index];

                    // Individual item Obx block for instant rendering states
                    return Obx(() {
                      final bool isSelected = controller.selectedLanguageId.value == lang.id;

                      return GestureDetector(
                        onTap: () => controller.selectLanguage(lang.id,lang.languageCode),
                        child: AnimatedContainer(
                          duration: const Duration(milliseconds: 200),
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                            color: isSelected ? AppColors.primary : AppColors.white,
                            borderRadius: BorderRadius.circular(30),
                            border: Border.all(
                              color: isSelected ? AppColors.primary : AppColors.lightDisabled,
                              width: 2,
                            ),
                          ),
                          padding: const EdgeInsets.symmetric(horizontal: 12),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                lang.name,
                                style: TextStyle(
                                  fontSize: 14,
                                  fontFamily: FontFamily.medium,
                                  fontWeight: FontWeight.w600,
                                  color: isSelected ? AppColors.white : AppColors.textSecondary,
                                ),
                              ),
                              const SizedBox(width: 4),
                              Text(
                                isSelected ? '✓' : '+',
                                style: TextStyle(
                                  fontSize: 12,
                                  fontFamily: FontFamily.regular,
                                  color: isSelected ? AppColors.white : AppColors.lightTextDisabled,
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    });
                  },
                ),
              ),

              // ─── Action Button Footer ───
              Obx(() {
                return controller.isLoading.value
                    ? const SizedBox(
                  height: 48,
                  child: Center(
                    child: CircularProgressIndicator(
                      color: AppColors.primary,
                      strokeWidth: 2.5,
                    ),
                  ),
                )
                    : AppButton(
                  // Dynamic translated title string from ARB
                  title: localizations.continueButton,
                  onTap: () => controller.confirmLanguageSelection(),
                );
              }),
            ],
          ),
        ),
      ),
    );
  }
}