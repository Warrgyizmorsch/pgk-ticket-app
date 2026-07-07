import '../../../common/constant/app_imports.dart';

class DiverMahotsavView extends StatelessWidget {
  const DiverMahotsavView({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;

    return Scaffold(
      backgroundColor: AppColors.background,
      body: CustomScrollView(
        physics: const BouncingScrollPhysics(),
        slivers: [
          // ─── App Bar with Hero Image ───
          SliverAppBar(
            expandedHeight: 260.0,
            floating: false,
            pinned: true,
            backgroundColor: AppColors.primary,
            leading: IconButton(
              icon: const Icon(Icons.arrow_back_rounded, color: Colors.white),
              onPressed: () => Get.back(),
            ),
            flexibleSpace: FlexibleSpaceBar(
              title: Text(
                l10n.diverMahotsavTitle,
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
                    ImageConstant.mewar, // Use an appropriate image asset
                    fit: BoxFit.cover,
                  ),
                  Container(
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.bottomCenter,
                        end: Alignment.topCenter,
                        colors: [
                          Colors.black.withValues(alpha: 0.9),
                          Colors.transparent,
                        ],
                      ),
                    ),
                  ),

                ],
              ),
            ),
          ),

          // ─── Body Content ───
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // History & Introduction
                  _buildHistoryCard(l10n),
                  const SizedBox(height: 24),

                  Text(
                    l10n.upcomingHighlights,
                    style: AppTextStyles.headline.copyWith(fontSize: 20, color: AppColors.primary),
                  ),
                  const SizedBox(height: 16),
                  SizedBox(
                    height: 140,
                    child: ListView(
                      scrollDirection: Axis.horizontal,
                      physics: const BouncingScrollPhysics(),
                      clipBehavior: Clip.none,
                      children: [
                        _buildHighlightCard(
                          date: l10n.event1Date,
                          time: l10n.event1Time,
                          title: l10n.event1Title,
                          icon: Icons.event_available_rounded,
                        ),
                        _buildHighlightCard(
                          date: l10n.event2Date,
                          time: l10n.event2Time,
                          title: l10n.event2Title,
                          subtitle: l10n.event2Subtitle,
                          icon: Icons.connect_without_contact_rounded,
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 32),

                  // Competitions & Programs
                  Text(
                    l10n.competitionsPrograms,
                    style: AppTextStyles.headline.copyWith(fontSize: 20, color: AppColors.primary),
                  ),
                  const SizedBox(height: 16),

                  _buildProgramTile(
                    title: l10n.quizTitle,
                    subtitle: l10n.quizSubtitle,
                    icon: Icons.quiz_rounded,
                    content: _buildQuizDetails(l10n),
                  ),
                  _buildProgramTile(
                    title: l10n.essayTitle,
                    subtitle: l10n.essaySubtitle,
                    icon: Icons.edit_document,
                    content: _buildEssayDetails(l10n),
                  ),
                  _buildProgramTile(
                    title: l10n.paintTitle,
                    subtitle: l10n.paintSubtitle,
                    icon: Icons.palette_rounded,
                    content: _buildPaintingDetails(l10n),
                  ),
                  _buildProgramTile(
                    title: l10n.filmTitle,
                    subtitle: l10n.filmSubtitle,
                    icon: Icons.movie_creation_rounded,
                    content: _buildFilmDetails(l10n),
                  ),
                  _buildProgramTile(
                    title: l10n.lectureTitle,
                    subtitle: l10n.lectureSubtitle,
                    icon: Icons.mic_rounded,
                    content: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Text(l10n.lectureRules),
                    ),
                  ),
                  _buildProgramTile(
                    title: l10n.closingTitle,
                    subtitle: l10n.closingSubtitle,
                    icon: Icons.celebration_rounded,
                    content: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Text(l10n.closingRules),
                    ),
                  ),
                  const SizedBox(height: 40),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  // ─── WIDGET: History Card ───
  Widget _buildHistoryCard(AppLocalizations l10n) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: const [
          BoxShadow(color: AppColors.lightShadow, blurRadius: 10, offset: Offset(0, 4)),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              const Icon(Icons.auto_stories_rounded, color: AppColors.primary),
              const SizedBox(width: 8),
              Text(l10n.historicalBackground, style: AppTextStyles.titleLarge),
            ],
          ),
          const Padding(
            padding: EdgeInsets.symmetric(vertical: 12.0),
            child: Divider(),
          ),
          Text(
            l10n.historyDesc,
            style: AppTextStyles.bodyMedium.copyWith(color: AppColors.textSecondary, height: 1.6),
            textAlign: TextAlign.justify,
          ),
        ],
      ),
    );
  }

  // ─── WIDGET: Highlight Event Card ───
  Widget _buildHighlightCard({
    required String date,
    required String time,
    required String title,
    String? subtitle,
    required IconData icon,
  }) {
    return Container(
      width: 280,
      margin: const EdgeInsets.only(right: 16),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: const Color(0xFF2C1C16), // Premium dark theme
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            children: [
              Icon(icon, color: Colors.orangeAccent, size: 24),
              const SizedBox(width: 8),
              Text(date, style: AppTextStyles.subtitle.copyWith(color: Colors.white)),
            ],
          ),
          const SizedBox(height: 12),
          Text(
            title,
            style: AppTextStyles.titleLarge.copyWith(color: Colors.white, fontSize: 16),
          ),
          const SizedBox(height: 6),
          Text(
            subtitle ?? time,
            style: AppTextStyles.caption.copyWith(color: Colors.white70),
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          ),
        ],
      ),
    );
  }

  // ─── WIDGET: Expandable Program Tile ───
  Widget _buildProgramTile({
    required String title,
    required String subtitle,
    required IconData icon,
    required Widget content,
  }) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.grey.withValues(alpha: 0.2)),
      ),
      child: Theme(
        data: ThemeData(dividerColor: Colors.transparent), // Removes borders inside ExpansionTile
        child: ExpansionTile(
          iconColor: AppColors.primary,
          collapsedIconColor: Colors.grey,
          leading: Container(
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: AppColors.primary.withValues(alpha: 0.1),
              borderRadius: BorderRadius.circular(10),
            ),
            child: Icon(icon, color: AppColors.primary),
          ),
          title: Text(title, style: AppTextStyles.subtitle.copyWith(fontWeight: FontWeight.bold)),
          subtitle: Text(subtitle, style: AppTextStyles.caption),
          children: [
            const Divider(height: 1),
            content,
          ],
        ),
      ),
    );
  }

  // ─── DETAILS: Quiz ───
  Widget _buildQuizDetails(AppLocalizations l10n) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildPrizeRow(l10n.prize1st, '₹ 5100'),
          _buildPrizeRow(l10n.prize2nd, '₹ 3100'),
          _buildPrizeRow(l10n.prize3rd, '₹ 2100'),
          _buildPrizeRow(l10n.prizeConsolation, '₹ 1100'),
          const SizedBox(height: 12),
          Text(l10n.quizRules),
        ],
      ),
    );
  }

  // ─── DETAILS: Essay ───
  Widget _buildEssayDetails(AppLocalizations l10n) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(l10n.essayTopics, style: const TextStyle(fontWeight: FontWeight.w600)),
          _buildPrizeRow(l10n.prize1st, '₹ 5100'),
          _buildPrizeRow(l10n.prize2nd, '₹ 3100'),
          _buildPrizeRow(l10n.prize3rd, '₹ 2100'),
          const SizedBox(height: 12),
          Text(l10n.essayRules),
        ],
      ),
    );
  }

  // ─── DETAILS: Painting ───
  Widget _buildPaintingDetails(AppLocalizations l10n) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildPrizeRow(l10n.prizeSec, '₹ 1000 ${l10n.eachWord}'),
          _buildPrizeRow(l10n.prizeSrSec, '₹ 1500 ${l10n.eachWord}'),
          _buildPrizeRow(l10n.prizeHigher, '₹ 2000 ${l10n.eachWord}'),
          const SizedBox(height: 12),
          Text(l10n.paintRules),
        ],
      ),
    );
  }

  // ─── DETAILS: Film / NSS ───
  Widget _buildFilmDetails(AppLocalizations l10n) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(l10n.filmNSS, style: const TextStyle(fontWeight: FontWeight.bold, color: Colors.blue)),
          const SizedBox(height: 12),
          _buildPrizeRow(l10n.prize1st, '₹ 5100'),
          _buildPrizeRow(l10n.prize2nd, '₹ 3100'),
          _buildPrizeRow(l10n.prize3rd, '₹ 2100'),
          const SizedBox(height: 12),
          Text(l10n.filmRules),
        ],
      ),
    );
  }

  // ─── HELPER: Prize Row ───
  Widget _buildPrizeRow(String title, String amount) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 6.0),
      child: Row(
        children: [
          const Icon(Icons.emoji_events_rounded, size: 18, color: Colors.orange),
          const SizedBox(width: 8),
          Expanded(child: Text(title, style: const TextStyle(fontWeight: FontWeight.w500))),
          Text(amount, style: const TextStyle(fontWeight: FontWeight.bold, color: Colors.green)),
        ],
      ),
    );
  }
}