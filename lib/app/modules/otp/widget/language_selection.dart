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
      // ─── AppBar Stylings Matching Mockup ───
      appBar: AppBar(
        backgroundColor: AppColors.white,
        elevation: 0,
        automaticallyImplyLeading: false,
        title: Obx(() {
          // Accessing the observable variable here registers it with this Obx scope
          final _ = controller.selectedLanguageId.value;
          return Text(
            localizations.chooseYourLanguage,
            style: AppTextStyles.titleLarge.copyWith(
              color: AppColors.textPrimary,
              fontFamily: FontFamily.bold,
              fontWeight: FontWeight.w700,
            ),
          );
        }),
        centerTitle: true,
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 24.0),
          child: Column(
            children: [
              // ─── 2-Column Grid Option Layout Array ───
              Expanded(
                child: GridView.builder(
                  itemCount: controller.supportedLanguages.length,
                  physics: const BouncingScrollPhysics(),
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,          // Changed from 3 to 2 columns to match image layout
                    crossAxisSpacing: 14,       // Clean side-by-side item gaps
                    mainAxisSpacing: 14,
                    childAspectRatio: 2.4,      // Maintained balanced rectangular card dimensions
                  ),
                  itemBuilder: (context, index) {
                    final lang = controller.supportedLanguages[index];

                    return Obx(() {
                      final bool isSelected = controller.selectedLanguageId.value == lang.id;

                      // Dynamically build language text format structure e.g., "हिंदी (Hindi)"
                      final String displayLanguageText = lang.id == 'en'
                          ? lang.name
                          : "${lang.nativeName} (${lang.name})";

                      return GestureDetector(
                        onTap: () => controller.selectLanguage(lang.id, lang.languageCode),
                        child: AnimatedContainer(
                          duration: const Duration(milliseconds: 180),
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                            color: isSelected ? AppColors.primary : AppColors.white,
                            borderRadius: BorderRadius.circular(12), // Clean rectangle card corners matching design
                            border: Border.all(
                              color: isSelected ? AppColors.primary : const Color(0xFF9CA3AF),
                              width: 1.5,
                            ),
                          ),
                          padding: const EdgeInsets.symmetric(horizontal: 16),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Expanded(
                                child: Text(
                                  displayLanguageText,
                                  overflow: TextOverflow.ellipsis,
                                  style: TextStyle(
                                    fontSize: 15,
                                    fontFamily: FontFamily.medium,
                                    fontWeight: FontWeight.w500,
                                    color: isSelected ? AppColors.white : AppColors.textPrimary,
                                  ),
                                ),
                              ),
                              // Renders the trailing validation checkmark safely on selected indices
                              if (isSelected)
                                const Icon(
                                  Icons.check,
                                  color: AppColors.white,
                                  size: 18,
                                ),
                            ],
                          ),
                        ),
                      );
                    });
                  },
                ),
              ),

              // ─── Wide Action Button Footer ───
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