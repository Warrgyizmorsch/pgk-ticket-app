import '../../../common/constant/app_imports.dart';

class CancellationPolicyView extends StatelessWidget {
  const CancellationPolicyView({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;

    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: CustomAppBar(
        title: l10n.cancellationPolicyTitle,
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
              Text(
                l10n.cancellationHeader,
                style: AppTextStyles.titleLarge,
              ),
              const SizedBox(height: 12),
              Text(
                l10n.cancellationIntro,
                style: AppTextStyles.bodyMedium,
                textAlign: TextAlign.justify,
              ),
              const SizedBox(height: 20),

              // ─── Policy Points ───
              _buildBulletPoint(l10n.cancellationPoint1),
              _buildBulletPoint(l10n.cancellationPoint2),
              _buildBulletPoint(l10n.cancellationPoint3),
              _buildBulletPoint(l10n.cancellationPoint4),
              _buildBulletPoint(l10n.cancellationPoint5),
              _buildBulletPoint(l10n.cancellationPoint6),
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
