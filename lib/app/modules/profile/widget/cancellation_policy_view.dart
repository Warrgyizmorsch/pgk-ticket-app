import '../../../common/constant/app_imports.dart';

class CancellationPolicyView extends StatelessWidget {
  const CancellationPolicyView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: const CustomAppBar(
        title: 'Cancellation Policy',
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20.0),
        child: Container(
          width: double.infinity,
          padding: const EdgeInsets.all(20.0),
          decoration: BoxDecoration(
            color: AppColors.white,
            borderRadius: BorderRadius.circular(16),
            boxShadow: const [
              BoxShadow(
                color: AppColors.lightShadow,
                blurRadius: 10,
                offset: Offset(0, 4),
              ),
            ],
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // ─── Introduction ───
              const Text(
                'Cancellation',
                style: AppTextStyles.titleLarge,
              ),
              const SizedBox(height: 12),
              const Text(
                'Veer Shiromani Maharana Pratap Samiti believes in helping its customers as far as possible, and has therefore a liberal cancellation policy. Under this policy:',
                style: AppTextStyles.bodyMedium,
                textAlign: TextAlign.justify,
              ),
              const SizedBox(height: 20),

              // ─── Policy Points ───
              _buildBulletPoint(
                'Cancellations will be considered only if the request is made immediately after placing the order. However, the cancellation request may not be entertained if the orders have been communicated to the vendors/merchants and they have initiated the process of shipping them.',
              ),
              _buildBulletPoint(
                'We do not accept cancellation requests for perishable items like flowers, eatables etc. However, refund/replacement can be made if the customer establishes that the quality of product delivered is not good.',
              ),
              _buildBulletPoint(
                'In case of receipt of damaged or defective items please report the same to our Customer Service team. The request will, however, be entertained once the merchant has checked and determined the same at his own end. This should be reported within 7 days of receipt of the products.',
              ),
              _buildBulletPoint(
                'In case you feel that the product received is not as shown on the site or as per your expectations, you must bring it to the notice of our customer service within 7 days of receiving the product. The Customer Service Team after looking into your complaint will take an appropriate decision.',
              ),
              _buildBulletPoint(
                'In case of complaints regarding products that come with a warranty from manufacturers, please refer the issue to them.',
              ),
              _buildBulletPoint(
                'In case of any Refunds approved by the Veer Shiromani Maharana Pratap Samiti, it’ll take 3-5 days for the refund to be processed to the end customer.',
              ),
            ],
          ),
        ),
      ),
    );
  }

  // ─── Helper: Custom Bullet Point ───
  Widget _buildBulletPoint(String text) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Custom Bullet Icon
          Container(
            margin: const EdgeInsets.only(top: 6, right: 12),
            height: 8,
            width: 8,
            decoration: const BoxDecoration(
              color: AppColors.primary,
              shape: BoxShape.circle,
            ),
          ),
          // Policy Text
          Expanded(
            child: Text(
              text,
              style: AppTextStyles.bodyMedium.copyWith(
                height: 1.5, // Adds line height for better readability
                color: AppColors.textSecondary, // Slightly softer text color for long reading
              ),
              textAlign: TextAlign.justify,
            ),
          ),
        ],
      ),
    );
  }
}