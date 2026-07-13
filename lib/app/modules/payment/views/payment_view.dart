import '../../../common/constant/app_imports.dart';


class PaymentView extends GetView<PaymentController> {
  const PaymentView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: CustomAppBar(
        title: 'Complete Payment',
        showBackButton: true,
      ),
      body: SafeArea(
        child: Obx(() {
          if (controller.paymentUrl.value.isEmpty) {
            return const Center(
              child: Text(
                'Invalid Payment Request.\nPlease try booking again.',
                textAlign: TextAlign.center,
              ),
            );
          }

          return Stack(
            children: [

              Opacity(
                opacity: controller.isVerifyingPayment.value ? 0.0 : 1.0,
                child: WebViewWidget(controller: controller.webViewController),
              ),

              if (controller.isLoading.value || controller.isVerifyingPayment.value)
                Container(
                  color: AppColors.background,
                  child: Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const CustomAppLoader(),
                        const SizedBox(height: 16),
                        Text(
                          controller.isVerifyingPayment.value
                              ? 'Verifying your payment...\nPlease do not press back or close the app.'
                              : 'Loading secure payment gateway...',
                          style: AppTextStyles.bodyMedium.copyWith(color: AppColors.textSecondary),
                          textAlign: TextAlign.center,
                        ),
                      ],
                    ),
                  ),
                ),
            ],
          );
        }),
      ),
    );
  }
}