import '../../../common/constant/app_imports.dart';

class VisitorInfoView extends StatelessWidget {
  const VisitorInfoView({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;

    return DefaultTabController(
      length: 2,
      child: Scaffold(
        backgroundColor: AppColors.background,
        appBar: AppBar(
          backgroundColor: AppColors.primary,
          elevation: 0,
          centerTitle: true,
          leading: IconButton(
            icon: const Icon(Icons.arrow_back_ios_new, color: Colors.white),
            onPressed: () => Get.back(),
          ),
          title: Text(
            l10n.visitorInfoTitle,
            style: const TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: 18,
            ),
          ),
          bottom: TabBar(
            labelColor: AppColors.white,
            unselectedLabelColor: Colors.white70,
            indicatorColor: AppColors.background,
            indicatorWeight: 5,
            indicatorSize: TabBarIndicatorSize.tab,
            labelStyle: AppTextStyles.bodyMedium.copyWith(fontWeight: FontWeight.w600),
            tabs: [
              Tab(text: l10n.tabInstructions),
              Tab(text: l10n.tabFacilities),
            ],
          ),
        ),
        body: TabBarView(
          physics: const BouncingScrollPhysics(),
          children: [_buildInstructionsTab(l10n), _buildFacilitiesTab(l10n)],
        ),
      ),
    );
  }

  // ════════════════════════════════════════════════════════════════
  // 1. INSTRUCTIONS & TICKETING TAB
  // ════════════════════════════════════════════════════════════════
  Widget _buildInstructionsTab(AppLocalizations l10n) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16.0),
      physics: const BouncingScrollPhysics(),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Timings Card
          _buildInfoCard(
            title: l10n.timingsTitle,
            icon: Icons.access_time_filled_rounded,
            iconColor: Colors.orange,
            content: [l10n.timing1, l10n.timing2, l10n.timing3],
          ),
          const SizedBox(height: 16),

          // Domestic Tickets Card
          _buildInfoCard(
            title: l10n.pricingIndianTitle,
            icon: Icons.currency_rupee_rounded,
            iconColor: Colors.green,
            content: [
              l10n.pricingInd1,
              l10n.pricingInd2,
              l10n.pricingInd3,
              l10n.pricingInd4,
            ],
          ),
          const SizedBox(height: 16),

          // Foreign Tickets Card
          _buildInfoCard(
            title: l10n.pricingForeignTitle,
            icon: Icons.public_rounded,
            iconColor: Colors.blue,
            content: [
              l10n.pricingFor1,
              l10n.pricingFor2,
              l10n.pricingFor3,
              l10n.pricingFor4,
            ],
          ),
          const SizedBox(height: 16),

          // School & College Visit Card
          _buildInfoCard(
            title: l10n.schoolGroupsTitle,
            icon: Icons.school_rounded,
            iconColor: Colors.purple,
            content: [l10n.schoolGrp1, l10n.schoolGrp2, l10n.schoolGrp3],
          ),
          const SizedBox(height: 16),

          // Rules & Regulations Card
          _buildInfoCard(
            title: l10n.guidelinesTitle,
            icon: Icons.gavel_rounded,
            iconColor: Colors.red,
            content: [l10n.guideline1, l10n.guideline2, l10n.guideline3],
          ),
          const SizedBox(height: 16),

          // Humble Request (Highlighted)
          Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: AppColors.primary.withValues(alpha: 0.1),
              borderRadius: BorderRadius.circular(16),
              border: Border.all(
                color: AppColors.primary.withValues(alpha: 0.3),
              ),
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Icon(
                  Icons.volunteer_activism_rounded,
                  color: AppColors.primary,
                  size: 28,
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        l10n.humbleRequestTitle,
                        style: AppTextStyles.subtitle.copyWith(
                          color: AppColors.primary,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 8),
                      Text(
                        l10n.humbleRequestDesc,
                        style: AppTextStyles.bodySmall.copyWith(
                          color: AppColors.textPrimary,
                          height: 1.4,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 24),
        ],
      ),
    );
  }

  // ════════════════════════════════════════════════════════════════
  // 2. FACILITIES TAB
  // ════════════════════════════════════════════════════════════════
  Widget _buildFacilitiesTab(AppLocalizations l10n) {
    return ListView(
      padding: const EdgeInsets.all(16.0),
      physics: const BouncingScrollPhysics(),
      children: [
        _buildFacilityItem(
          icon: Icons.restaurant_rounded,
          title: l10n.facCanteenTitle,
          description: l10n.facCanteenDesc,
        ),
        _buildFacilityItem(
          icon: Icons.wc_rounded,
          title: l10n.facRestroomsTitle,
          description: l10n.facRestroomsDesc,
        ),
        _buildFacilityItem(
          icon: Icons.water_drop_rounded,
          title: l10n.facWaterTitle,
          description: l10n.facWaterDesc,
        ),
        _buildFacilityItem(
          icon: Icons.medical_services_rounded,
          title: l10n.facMedicalTitle,
          description: l10n.facMedicalDesc,
        ),
        _buildFacilityItem(
          icon: Icons.accessible_rounded,
          title: l10n.facWheelchairTitle,
          description: l10n.facWheelchairDesc,
        ),
        _buildFacilityItem(
          icon: Icons.local_parking_rounded,
          title: l10n.facParkingTitle,
          description: l10n.facParkingDesc,
        ),
        _buildFacilityItem(
          icon: Icons.soup_kitchen_rounded,
          title: l10n.facCookingTitle,
          description: l10n.facCookingDesc,
        ),
        const SizedBox(height: 24),
      ],
    );
  }

  // ════════════════════════════════════════════════════════════════
  // HELPER WIDGETS
  // ════════════════════════════════════════════════════════════════

  Widget _buildInfoCard({
    required String title,
    required IconData icon,
    required Color iconColor,
    required List<String> content,
  }) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white, // Or AppColors.white
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withValues(alpha: 0.1),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: iconColor.withValues(alpha: 0.1),
                  shape: BoxShape.circle,
                ),
                child: Icon(icon, color: iconColor, size: 24),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Text(
                  title,
                  style: AppTextStyles.subtitle.copyWith(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),
          ...content.map(
            (text) => Padding(
              padding: const EdgeInsets.only(bottom: 6.0, left: 4.0),
              child: Text(
                text,
                style: AppTextStyles.bodyMedium.copyWith(
                  color: Colors.grey.shade700, // Or AppColors.textSecondary
                  height: 1.4,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildFacilityItem({
    required IconData icon,
    required String title,
    required String description,
  }) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.grey.withValues(alpha: 0.2)),
      ),
      child: ListTile(
        contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        leading: Container(
          padding: const EdgeInsets.all(10),
          decoration: BoxDecoration(
            color: AppColors.primary.withValues(alpha: 0.1),
            borderRadius: BorderRadius.circular(12),
          ),
          child: Icon(icon, color: AppColors.primary, size: 28),
        ),
        title: Text(
          title,
          style: AppTextStyles.subtitle.copyWith(fontWeight: FontWeight.bold),
        ),
        subtitle: Padding(
          padding: const EdgeInsets.only(top: 6.0),
          child: Text(
            description,
            style: AppTextStyles.bodySmall.copyWith(
              color: Colors.grey.shade700,
              height: 1.4,
            ),
          ),
        ),
      ),
    );
  }
}
