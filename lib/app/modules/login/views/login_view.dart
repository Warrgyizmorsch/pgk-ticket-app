import 'package:country_code_picker/country_code_picker.dart';
import '../../../common/constant/app_imports.dart';
import '../controllers/login_controller.dart';


class LoginView extends GetView<LoginController> {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: SingleChildScrollView(
        child: SizedBox(
          height: MediaQuery.of(context).size.height,
          child: Form(
            key: controller.loginFormKey,
            child: Column(
              children: [
                // ─── Header Section with Bottom Curve & Brand Logo ───
                Stack(
                  alignment: Alignment.center,
                  children: [
                    ClipPath(
                      clipper: BottomCurveClipper(),
                      child: Container(
                        height: MediaQuery.of(context).size.height * 0.45,
                        width: double.infinity,
                        decoration: const BoxDecoration(
                          gradient: AppColors.primaryGradient,
                        ),
                      ),
                    ),
                    Positioned(
                      bottom: 40,
                      child: Container(
                        width: 180,
                        height: 180,
                        decoration: BoxDecoration(
                          color: AppColors.white,
                          shape: BoxShape.circle,
                          boxShadow: [
                            BoxShadow(
                              color: AppColors.lightShadow,
                              blurRadius: 15,
                              offset: const Offset(0, 8),
                            ),
                          ],
                        ),
                        padding: const EdgeInsets.all(4),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(90),
                          child: Image.asset(
                            ImageConstant.appLogo,
                            fit: BoxFit.cover,
                            errorBuilder: (context, error, stackTrace) => Container(
                              color: AppColors.lightDisabled,
                              child: const Icon(
                                Icons.broken_image,
                                color: AppColors.textSecondary,
                                size: 50,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),

                // ─── Login Form Section ───
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 32.0),
                    child: Column(
                      children: [
                        const SizedBox(height: 16),
                        Text(
                          'Log in',
                          style: AppTextStyles.subhead.copyWith(
                            color: AppColors.textSecondary,
                          ),
                        ),
                        const SizedBox(height: 32),

                        // Custom Combined Text Form Layout Field
                        TextFormFieldCustom(
                          showTitle: false,
                          method: TextFieldCustom(
                            controller: controller.phoneController,
                            textInputType: TextInputType.phone,
                            hintText: 'Enter Phone Number',
                            hintTextColor: AppColors.lightTextHint,
                            hintTextSize: AppFontSize.s14,
                            hintTextStyle: FontFamily.regular,
                            backgroundColor: AppColors.white,
                            borderColor: AppColors.lightDivider,
                            inputFormatters: [
                              FilteringTextInputFormatter.digitsOnly,
                              LengthLimitingTextInputFormatter(10),
                            ],
                            validator: (value) => controller.validatePhoneNumber(value),
                            prefixIcon: CountryCodePicker(
                              onChanged: (country) {
                                if (country.dialCode != null) {
                                  controller.selectedDialCode.value = country.dialCode!;
                                }
                              },
                              initialSelection: 'IN',
                              favorite: const ['+91', 'IN', '+1', 'US'],
                              showDropDownButton: true,
                              showCountryOnly: false,
                              padding: EdgeInsets.zero,
                              alignLeft: false,
                              textStyle: const TextStyle(
                                fontFamily: FontFamily.regular,
                                fontSize: 14,
                                fontWeight: FontWeight.w500,
                                color: AppColors.textPrimary,
                              ),
                              flagWidth: 20,
                            ),
                          ),
                        ),
                        const SizedBox(height: 24),

                        // Get OTP Action Button utilizing AppButton widget component
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
                            title: 'Get OTP',
                            onTap: () => controller.getOtp(),
                          ),
                        ),
                        const SizedBox(height: 32),

                        // Text Separator Layout Structure
                        const Row(
                          children: [
                            Expanded(child: Divider(color: AppColors.lightDivider, thickness: 1)),
                            Padding(
                              padding: EdgeInsets.symmetric(horizontal: 16.0),
                              child: Text(
                                'or',
                                style: AppTextStyles.caption,
                              ),
                            ),
                            Expanded(child: Divider(color: AppColors.lightDivider, thickness: 1)),
                          ],
                        ),
                        const SizedBox(height: 32),

                        // Google Native Sign In Option
                        OutlinedButton(
                          onPressed: () => controller.loginWithGoogle(),
                          style: OutlinedButton.styleFrom(
                            minimumSize: const Size(double.infinity, 54),
                            side: const BorderSide(color: AppColors.lightDivider),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(14),
                            ),
                            backgroundColor: AppColors.white,
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Image.asset(
                                ImageConstant.googleIcon,
                                height: 20,
                                width: 20,
                              ),
                              const SizedBox(width: 12),
                              const Text(
                                'Log in with Google',
                                style: AppTextStyles.dropdownItem,
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(height: 24),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class BottomCurveClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = Path();
    path.lineTo(0, size.height - 40);

    var firstControlPoint = Offset(size.width / 2, size.height + 15);
    var firstEndPoint = Offset(size.width, size.height - 40);

    path.quadraticBezierTo(
      firstControlPoint.dx,
      firstControlPoint.dy,
      firstEndPoint.dx,
      firstEndPoint.dy,
    );

    path.lineTo(size.width, 0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}