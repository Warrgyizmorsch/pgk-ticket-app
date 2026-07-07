import '../../../common/constant/app_imports.dart';

class RefundPolicyView extends StatelessWidget {
  const RefundPolicyView({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;

    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: CustomAppBar(title: l10n.refundReturnsTitle),
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
              Text(l10n.refundPolicyHeader, style: AppTextStyles.titleLarge),
              const SizedBox(height: 12),
              _buildParagraph(l10n.refundPolicyP1),
              _buildParagraph(l10n.refundPolicyP2),
              _buildParagraph(l10n.refundPolicyP3),

              const SizedBox(height: 16),
              _buildSectionSubTitle(l10n.nonReturnableItemsHeader),
              const SizedBox(height: 8),
              _buildBulletPoint(l10n.nonReturnable1),
              _buildBulletPoint(l10n.nonReturnable2),
              _buildBulletPoint(l10n.nonReturnable3),

              const SizedBox(height: 16),
              _buildParagraph(l10n.proofOfPurchaseText),

              const SizedBox(height: 16),
              _buildSectionSubTitle(l10n.partialRefundsHeader),
              const SizedBox(height: 8),
              _buildBulletPoint(l10n.partialRefund1),
              _buildBulletPoint(l10n.partialRefund2),
              _buildBulletPoint(l10n.partialRefund3),
              _buildBulletPoint(l10n.partialRefund4),

              const Divider(height: 40, color: AppColors.lightDivider),

              // ─── Refunds Section ───
              Text(l10n.refundsHeader, style: AppTextStyles.titleLarge),
              const SizedBox(height: 12),
              _buildParagraph(l10n.refundsP1),
              _buildParagraph(l10n.refundsP2),

              const SizedBox(height: 24),

              // ─── Late or Missing Refunds ───
              Text(
                l10n.lateMissingRefundsHeader,
                style: AppTextStyles.titleLarge,
              ),
              const SizedBox(height: 12),
              _buildBulletPoint(l10n.lateRefund1),
              _buildBulletPoint(l10n.lateRefund2),
              _buildBulletPoint(l10n.lateRefund3),
              _buildParagraph(l10n.lateRefund4),

              const Divider(height: 40, color: AppColors.lightDivider),

              // ─── Sale Items ───
              Text(l10n.saleItemsHeader, style: AppTextStyles.titleLarge),
              const SizedBox(height: 12),
              _buildParagraph(l10n.saleItemsText),

              const SizedBox(height: 24),

              // ─── Exchanges ───
              Text(l10n.exchangesHeader, style: AppTextStyles.titleLarge),
              const SizedBox(height: 12),
              _buildParagraph(l10n.exchangesText),

              const Divider(height: 40, color: AppColors.lightDivider),

              // ─── Need Help ───
              Text(l10n.needHelpHeader, style: AppTextStyles.titleLarge),
              const SizedBox(height: 12),
              _buildParagraph(l10n.needHelpText),
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
