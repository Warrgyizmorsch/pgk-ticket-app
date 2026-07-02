import '../../../common/constant/app_imports.dart';

class RefundPolicyView extends StatelessWidget {
  const RefundPolicyView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: const CustomAppBar(
        title: 'Refund & Returns',
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

              // ─── Main Policy Overview ───
              const Text(
                'Refund and Returns Policy',
                style: AppTextStyles.titleLarge,
              ),
              const SizedBox(height: 12),
              _buildParagraph('Our refund and returns policy lasts 30 days. If 30 days have passed since your purchase, we can’t offer you a full refund or exchange.'),
              _buildParagraph('To be eligible for a return, your item must be unused and in the same condition that you received it. It must also be in the original packaging.'),
              _buildParagraph('Several types of goods are exempt from being returned. Perishable goods such as food, flowers, newspapers or magazines cannot be returned. We also do not accept products that are intimate or sanitary goods, hazardous materials, or flammable liquids or gases.'),

              const SizedBox(height: 16),
              _buildSectionSubTitle('Additional non-returnable items:'),
              const SizedBox(height: 8),
              _buildBulletPoint('Gift cards'),
              _buildBulletPoint('Downloadable software products'),
              _buildBulletPoint('Some health and personal care items'),

              const SizedBox(height: 16),
              _buildParagraph('To complete your return, we require a receipt or proof of purchase. Please do not send your purchase back to the manufacturer.'),

              const SizedBox(height: 16),
              _buildSectionSubTitle('There are certain situations where only partial refunds are granted:'),
              const SizedBox(height: 8),
              _buildBulletPoint('Book with obvious signs of use.'),
              _buildBulletPoint('CD, DVD, VHS tape, software, video game, cassette tape, or vinyl record that has been opened.'),
              _buildBulletPoint('Any item not in its original condition, is damaged or missing parts for reasons not due to our error.'),
              _buildBulletPoint('Any item that is returned more than 30 days after delivery.'),

              const Divider(height: 40, color: AppColors.lightDivider),

              // ─── Refunds Section ───
              const Text('Refunds', style: AppTextStyles.titleLarge),
              const SizedBox(height: 12),
              _buildParagraph('Once your return is received and inspected, we will send you an email to notify you that we have received your returned item. We will also notify you of the approval or rejection of your refund.'),
              _buildParagraph('If you are approved, then your refund will be processed, and a credit will automatically be applied to your credit card or original method of payment, within a certain amount of days.'),

              const SizedBox(height: 24),

              // ─── Late or Missing Refunds ───
              const Text('Late or missing refunds', style: AppTextStyles.titleLarge),
              const SizedBox(height: 12),
              _buildBulletPoint('If you haven’t received a refund yet, first check your bank account again.'),
              _buildBulletPoint('Then contact your credit card company, it may take some time before your refund is officially posted.'),
              _buildBulletPoint('Next contact your bank. There is often some processing time before a refund is posted.'),
              _buildParagraph('If you’ve done all of this and you still have not received your refund yet, please contact us at support@pratapgauravkendra.org.'),

              const Divider(height: 40, color: AppColors.lightDivider),

              // ─── Sale Items ───
              const Text('Sale items', style: AppTextStyles.titleLarge),
              const SizedBox(height: 12),
              _buildParagraph('Only regular priced items may be refunded. Sale items cannot be refunded.'),

              const SizedBox(height: 24),

              // ─── Exchanges ───
              const Text('Exchanges', style: AppTextStyles.titleLarge),
              const SizedBox(height: 12),
              _buildParagraph('We only replace items if they are defective or damaged. If you need to exchange it for the same item, send us an email at support@pratapgauravkendra.org and send your item to: Pratap Gaurav Kendra, Udaipur, Rajasthan.'),

              const Divider(height: 40, color: AppColors.lightDivider),

              // ─── Need Help ───
              const Text('Need help?', style: AppTextStyles.titleLarge),
              const SizedBox(height: 12),
              _buildParagraph('Contact us at support@pratapgauravkendra.org for questions related to refunds and returns.'),

            ],
          ),
        ),
      ),
    );
  }

  // ─── Helper: Standard Paragraph ───
  Widget _buildParagraph(String text) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12.0),
      child: Text(
        text,
        style: AppTextStyles.bodyMedium.copyWith(
          height: 1.5,
          color: AppColors.textSecondary,
        ),
        textAlign: TextAlign.justify,
      ),
    );
  }

  // ─── Helper: Section Subtitle (Bold text for lists) ───
  Widget _buildSectionSubTitle(String text) {
    return Text(
      text,
      style: AppTextStyles.subtitle.copyWith(
        fontFamily: FontFamily.semiBold,
        color: AppColors.textPrimary,
      ),
    );
  }

  // ─── Helper: Custom Bullet Point ───
  Widget _buildBulletPoint(String text) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12.0, left: 8.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            margin: const EdgeInsets.only(top: 6, right: 12),
            height: 6,
            width: 6,
            decoration: const BoxDecoration(
              color: AppColors.primary,
              shape: BoxShape.circle,
            ),
          ),
          Expanded(
            child: Text(
              text,
              style: AppTextStyles.bodyMedium.copyWith(
                height: 1.5,
                color: AppColors.textSecondary,
              ),
              textAlign: TextAlign.justify,
            ),
          ),
        ],
      ),
    );
  }
}