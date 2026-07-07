import '../../../common/constant/app_imports.dart';

class EventDetailView extends StatelessWidget {
  const EventDetailView({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;

    return Scaffold(
      backgroundColor: AppColors.background,
      body: CustomScrollView(
        physics: const BouncingScrollPhysics(),
        slivers: [
          // ─── Top Image App Bar ───
          SliverAppBar(
            expandedHeight: 250.0,
            floating: false,
            pinned: true,
            backgroundColor: AppColors.primary,
            leading: IconButton(
              icon: const Icon(Icons.arrow_back_rounded, color: Colors.white),
              onPressed: () => Get.back(),
            ),
            flexibleSpace: FlexibleSpaceBar(
              title: Text(
                l10n.eventDetailAppBarTitle,
                style: const TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                ),
              ),
              background: Stack(
                fit: StackFit.expand,
                children: [
                  Image.asset(
                    ImageConstant.pgkFullImage, // Or a specific Haldighati image
                    fit: BoxFit.cover,
                  ),
                  Container(
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.bottomCenter,
                        end: Alignment.topCenter,
                        colors: [
                          Colors.black.withValues(alpha: 0.8),
                          Colors.transparent,
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),

          // ─── Event Content ───
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Event Details Card
                  _buildEventInfoCard(l10n),
                  const SizedBox(height: 32),

                  // Section Title
                  Text(
                    l10n.lifeJourneyTitle,
                    style: AppTextStyles.headline.copyWith(
                      color: AppColors.primary,
                      fontSize: 22,
                    ),
                  ),
                  const SizedBox(height: 16),

                  // Timeline Widget
                  _buildLifeJourneyTimeline(l10n),
                  const SizedBox(height: 40),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  // ─── Widget: Event Info Card ───
  Widget _buildEventInfoCard(AppLocalizations l10n) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(20),
        boxShadow: const [
          BoxShadow(
            color: AppColors.lightShadow,
            blurRadius: 12,
            offset: Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            l10n.historicalEventLabel,
            style: AppTextStyles.subtitle.copyWith(
              color: AppColors.primary,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            l10n.eventWelcomeText,
            style: AppTextStyles.bodyMedium.copyWith(
              color: AppColors.textSecondary,
              height: 1.5,
            ),
          ),
          const Padding(
            padding: EdgeInsets.symmetric(vertical: 16.0),
            child: Divider(color: AppColors.lightDivider),
          ),
          Row(
            children: [
              const Icon(Icons.calendar_month, color: AppColors.primary, size: 20),
              const SizedBox(width: 8),
              Text(l10n.eventDateValue, style: AppTextStyles.bodyMedium),
              const Spacer(),
              const Icon(Icons.access_time_rounded, color: AppColors.primary, size: 20),
              const SizedBox(width: 8),
              Text(l10n.eventTimeValue, style: AppTextStyles.bodyMedium),
            ],
          ),
          const SizedBox(height: 12),
          Row(
            children: [
              const Icon(Icons.location_on, color: AppColors.primary, size: 20),
              const SizedBox(width: 8),
              Text(l10n.eventVenueValue, style: AppTextStyles.bodyMedium),
            ],
          ),
        ],
      ),
    );
  }

  // ─── Widget: Life Journey Timeline ───
  Widget _buildLifeJourneyTimeline(AppLocalizations l10n) {
    final List<Map<String, dynamic>> timelineData = [
      {'year': l10n.tlYear1, 'emoji': '🟠', 'title': l10n.tlTitle1, 'desc': l10n.tlDesc1},
      {'year': l10n.tlYear2, 'emoji': '🟠', 'title': l10n.tlTitle2, 'desc': l10n.tlDesc2},
      {'year': l10n.tlYear3, 'emoji': '🟠', 'title': l10n.tlTitle3, 'desc': l10n.tlDesc3},
      {'year': l10n.tlYear4, 'emoji': '⚔️', 'title': l10n.tlTitle4, 'desc': l10n.tlDesc4},
      {'year': l10n.tlYear5, 'emoji': '🛡️', 'title': l10n.tlTitle5, 'desc': l10n.tlDesc5},
      {'year': l10n.tlYear6, 'emoji': '💰', 'title': l10n.tlTitle6, 'desc': l10n.tlDesc6},
      {'year': l10n.tlYear7, 'emoji': '🏆', 'title': l10n.tlTitle7, 'desc': l10n.tlDesc7},
      {'year': l10n.tlYear8, 'emoji': '🏰', 'title': l10n.tlTitle8, 'desc': l10n.tlDesc8},
      {'year': l10n.tlYear9, 'emoji': '⚔️', 'title': l10n.tlTitle9, 'desc': l10n.tlDesc9},
      {'year': l10n.tlYear10, 'emoji': '🕯️', 'title': l10n.tlTitle10, 'desc': l10n.tlDesc10},
    ];

    return ListView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      padding: EdgeInsets.zero,
      itemCount: timelineData.length,
      itemBuilder: (context, index) {
        final item = timelineData[index];
        final bool isLast = index == timelineData.length - 1;

        return Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Left Side: Year
            SizedBox(
              width: 50,
              child: Padding(
                padding: const EdgeInsets.only(top: 2.0),
                child: Text(
                  item['year'],
                  style: AppTextStyles.subtitle.copyWith(
                    color: AppColors.primary,
                    fontWeight: FontWeight.bold,
                  ),
                  textAlign: TextAlign.right,
                ),
              ),
            ),
            const SizedBox(width: 12),

            // Middle: Line and Dot Indicator
            Column(
              children: [
                Container(
                  height: 24,
                  width: 24,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    color: AppColors.primary.withValues(alpha: 0.1),
                    shape: BoxShape.circle,
                    border: Border.all(color: AppColors.primary, width: 2),
                  ),
                  child: Text(
                    item['emoji'],
                    style: const TextStyle(fontSize: 10),
                  ),
                ),
                if (!isLast)
                  Container(
                    width: 2,
                    height: 50, // Controls spacing between items
                    color: AppColors.primary.withValues(alpha: 0.3),
                  ),
              ],
            ),
            const SizedBox(width: 12),

            // Right Side: Title and Description
            Expanded(
              child: Padding(
                padding: const EdgeInsets.only(bottom: 24.0), // Bottom padding for spacing
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      item['title'],
                      style: AppTextStyles.titleLarge.copyWith(fontSize: 16),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      item['desc'],
                      style: AppTextStyles.bodyMedium.copyWith(
                        color: AppColors.textSecondary,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}