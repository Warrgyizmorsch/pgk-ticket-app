import '../../../common/constant/app_imports.dart';



class OtpView extends GetView<OtpController> {
  const OtpView({super.key});

  @override
  Widget build(BuildContext context) {
    final double fieldSize = (MediaQuery.of(context).size.width - 64 - 48) / 5;

    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: AppColors.textPrimary),
          onPressed: () => Get.back(),
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 32.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(height: 16),

              Center(
                child: SizedBox(
                  height: MediaQuery.of(context).size.height * 0.35,
                  child: AspectRatio(
                    aspectRatio: 1,
                    child: Image.asset(
                      ImageConstant.otp,
                      fit: BoxFit.contain,
                      errorBuilder: (context, error, stackTrace) => Container(
                        decoration: BoxDecoration(
                          color: AppColors.lightDisabled,
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: const Icon(
                          Icons.mark_email_read_outlined,
                          size: 72,
                          color: AppColors.textSecondary,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 40),

              Text(
                'Enter Code Here',
                style: AppTextStyles.subhead.copyWith(
                  color: AppColors.textSecondary,
                ),
              ),
              const SizedBox(height: 32),

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: List.generate(
                  5,
                      (index) => SizedBox(
                    width: fieldSize,
                    height: fieldSize * 1.1,
                    child: OtpTextFieldCustom(
                      controller: controller.otpControllers[index],
                      focusNode: controller.otpFocusNodes[index],
                      onChanged: (value) {
                        controller.handleOtpInput(value??"", index);
                        return null;
                      },
                      textInputType: TextInputType.number,
                      maxLength: 1,
                      inputFormatters: [
                        FilteringTextInputFormatter.digitsOnly,
                      ],
                      contentPadding: EdgeInsets.zero,
                      backgroundColor: AppColors.white,
                      borderColor: AppColors.lightDivider,
                      borderWidth: 2,
                      hintTextSize: 24, // Used to control the input text size in your custom widget
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 64),

              Obx(
                    () => controller.isLoading.value
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
                  title: 'Verify OTP',
                  onTap: () => controller.verifyOtp(context),
                ),
              ),
              const SizedBox(height: 24),
            ],
          ),
        ),
      ),
    );
  }
}