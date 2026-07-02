

import 'package:country_code_picker/country_code_picker.dart';
import '../../../common/constant/app_imports.dart';
import '../controllers/login_controller.dart';

class LoginView extends GetView<LoginController> {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      // ─── FIX: Use CustomScrollView and SliverFillRemaining ───
      body: CustomScrollView(
        slivers: [
          SliverFillRemaining(
            hasScrollBody: false, // Tells it to allow the Column to expand or scroll as needed
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
                        child: SizedBox(
                          width: 180,
                          height: 180,
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
                          const SizedBox(height: 12),
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

                                  // ─── THE MAGIC FIX: Custom Builder ───
                                  builder: (countryCode) {
                                    return Row(
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        const SizedBox(width: 12),
                                        // Flag
                                        Image.asset(
                                          countryCode?.flagUri ?? 'flags/in.png',
                                          package: 'country_code_picker',
                                          width: 20,
                                        ),
                                        const SizedBox(width: 4),
                                        // Dial Code
                                        Text(
                                          countryCode?.dialCode ?? '+91',
                                          style: const TextStyle(
                                            fontFamily: FontFamily.regular,
                                            fontSize: 14,
                                            fontWeight: FontWeight.w500,
                                            color: AppColors.textPrimary,
                                          ),
                                        ),
                                        // Dropdown Icon
                                        const Icon(
                                          Icons.arrow_drop_down,
                                          color: AppColors.textSecondary,
                                          size: 20,
                                        ),
                                        const SizedBox(width: 4), // Right margin before divider
                                        // Divider line (Optional, looks good)
                                        Container(
                                          height: 20,
                                          width: 1,
                                          color: AppColors.lightDivider,
                                        ),
                                        const SizedBox(width: 8), // Space between divider and text field
                                      ],
                                    );
                                  },
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
                        ],
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