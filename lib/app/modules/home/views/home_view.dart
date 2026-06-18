
import '../../../common/constant/app_imports.dart';
import '../controllers/home_controller.dart';
import '../widget/bhakti_dham_view.dart';
import '../widget/pratap_history_view.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    // ─── Bind Localizations ───
    final l10n = AppLocalizations.of(context)!;

    return Scaffold(
      backgroundColor: AppColors.background, // Uses your creamy background token (#FFF5F1)

      // ─── AppBar / Header Section ───
      appBar: AppBar(
        backgroundColor: AppColors.primary,
        elevation: 0,
        centerTitle: true,
        title: Text(
          l10n.museumDashboard, // Localized
          style: AppTextStyles.titleLarge.copyWith(
            color: Colors.white,
            fontFamily: FontFamily.bold,
          ),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.account_circle, color: Colors.white, size: 30),
            onPressed: () {
              // TODO: Navigate to Profile
            },
          ),
          const SizedBox(width: 8),
        ],
      ),

      // ─── Main Content Base Body ───
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // ─── Hero Banner Section ───
            Stack(
              alignment: Alignment.bottomCenter,
              children: [
                Image.asset(
                  ImageConstant.pgkFullImage, // Replace with your museum building asset
                  width: double.infinity,
                  height: 220,
                  fit: BoxFit.cover,
                  errorBuilder: (context, error, stackTrace) => Container(
                    width: double.infinity,
                    height: 220,
                    color: AppColors.lightDisabled,
                    child: const Icon(Icons.account_balance, size: 64, color: Colors.grey),
                  ),
                ),
                // Orange Gradient Overlay
                Container(
                  width: double.infinity,
                  padding: const EdgeInsets.only(top: 40, bottom: 16, left: 16, right: 16),
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.bottomCenter,
                      end: Alignment.topCenter,
                      colors: [
                        AppColors.primary.withOpacity(0.95),
                        AppColors.primary.withOpacity(0.0),
                      ],
                    ),
                  ),
                  child: Text(
                    l10n.welcomeBannerText, // Localized
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontFamily: FontFamily.semiBold,
                      fontWeight: FontWeight.w600,
                      height: 1.3,
                    ),
                  ),
                ),
              ],
            ),

            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // ─── Section: History ───

                  _buildHistoryCard(
                    imageUrl: ImageConstant.homePGK,
                    title: l10n.pratapGauravKendra,
                    description: l10n.aboutPratapGauravKendra,
                    readMoreText: l10n.readMore,

                    onReadMore: () {
                      Get.toNamed(Routes.ABOUTPGK);
                    },
                  ),
                  const SizedBox(height: 24),
                  _buildHistoryCard(
                    imageUrl: ImageConstant.homePGK,
                    title: l10n.statueOfPride,
                    description: l10n.statueOfPrideDesc,
                    readMoreText: l10n.readMore,

                  ),
                  const SizedBox(height: 24),
                  _buildSectionTitle(l10n.historyOfPratap), // Localized
                  const SizedBox(height: 12),
                  _buildHistoryCard(
                    imageUrl: ImageConstant.mewar,
                    title: l10n.historyOfPratap, // Localized
                    description: l10n.historyIntroP1, // Localized
                    readMoreText: l10n.readMore, // Localized
                    onReadMore: () {
                      Get.toNamed( Routes.PRATAPHISTORY);
                    },
                  ),

                  const SizedBox(height: 24),

                  // ─── Section: Popular Exhibits ───
                  _buildSectionTitle(l10n.majorAttractions), // Localized
                  const SizedBox(height: 12),
                  SizedBox(
                    height: 140,
                    child: ListView(
                      scrollDirection: Axis.horizontal,
                      physics: const BouncingScrollPhysics(),
                      children: [
                        _buildExhibitCard(
                          imageUrl: ImageConstant.bhaktiDham,
                          title: l10n.bhaktiDham,
                          onTap: (){
                            Get.toNamed(Routes.BHAKTIDHAM);
                          }// Localized
                        ),
                        _buildExhibitCard(
                          imageUrl: ImageConstant.bhaktiDham,
                          title: l10n.waterLaserShow,
                          onTap: (){}// Localized
                        ),
                        _buildExhibitCard(
                          imageUrl: ImageConstant.bhaktiDham,
                          title: l10n.vijayStambh,
                            onTap: (){}// Localized

                        ),
                      ],
                    ),
                  ),

                  const SizedBox(height: 24),

                  // ─── Section: Museum News ───
                  _buildSectionTitle(l10n.museumNews), // Localized
                  const SizedBox(height: 12),
                  SizedBox(
                    height: 110,
                    child: ListView(
                      scrollDirection: Axis.horizontal,
                      physics: const BouncingScrollPhysics(),
                      children: [
                        _buildNewsEventCard(
                          title: l10n.newsLightSoundShow, // Localized
                          hasBackgroundImage: false,
                        ),
                        _buildNewsEventCard(
                          title: l10n.newsSpecialExhibition, // Localized
                          hasBackgroundImage: true,
                        ),
                      ],
                    ),
                  ),

                  const SizedBox(height: 24),

                  // ─── Section: Upcoming Events ───
                  _buildSectionTitle(l10n.events), // Localized
                  const SizedBox(height: 12),
                  SizedBox(
                    height: 90,
                    child: ListView(
                      scrollDirection: Axis.horizontal,
                      physics: const BouncingScrollPhysics(),
                      children: [
                        _buildNewsEventCard(
                          title: l10n.eventPratapJayanti, // Localized
                          hasBackgroundImage: false,
                        ),
                        _buildNewsEventCard(
                          title: l10n.eventKidsWorkshop, // Localized
                          hasBackgroundImage: false,
                        ),
                      ],
                    ),
                  ),

                  // Spacer to ensure nothing hides behind the floating bottom navbar
                  const SizedBox(height: 100),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  // ─── Layout Builder Helpers ───

  /// Standard Section Title Header
  Widget _buildSectionTitle(String title) {
    return Text(
      title,
      style: AppTextStyles.titleLarge.copyWith(
        fontSize: 18,
        fontFamily: FontFamily.bold,
        color: AppColors.textPrimary,
      ),
    );
  }

  /// History Card with solid orange Read More button
  /// History Card with optional solid orange Read More button
  Widget _buildHistoryCard({
    required String imageUrl,
    required String title,
    required String description,

    String? readMoreText, // Made optional (?)
    VoidCallback? onReadMore, // Made optional (?)
  }) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Left Image
          ClipRRect(
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(16),
              bottomLeft: Radius.circular(16),
            ),
            child: Image.asset(
              imageUrl,
              width: 130,
              height: 150,
              fit: BoxFit.cover,
              errorBuilder: (context, error, stackTrace) => Container(
                width: 130,
                height: 150,
                color: AppColors.lightDisabled,
                child: const Icon(Icons.image, color: Colors.grey),
              ),
            ),
          ),
          // Right Content
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(
                      fontSize: 14,
                      fontFamily: FontFamily.bold,
                      fontWeight: FontWeight.w700,
                      color: AppColors.textPrimary,
                    ),
                  ),
                  const SizedBox(height: 6),
                  Text(
                    description,
                    maxLines:5,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(
                      fontSize: 11,
                      height: 1.3,
                      fontFamily: FontFamily.regular,
                      color: AppColors.textSecondary,
                    ),
                  ),

                  // ─── Conditionally show the Read More button ───
                  if (onReadMore != null) ...[
                    const SizedBox(height: 10),
                    SizedBox(
                      height: 32,
                      child: ElevatedButton(
                        onPressed: onReadMore,
                        style: ElevatedButton.styleFrom(
                          backgroundColor: AppColors.primary,
                          foregroundColor: AppColors.white,
                          elevation: 0,
                          padding: const EdgeInsets.symmetric(horizontal: 16),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                        ),
                        child: Text(
                          readMoreText ?? 'Read More', // Fallback text just in case
                          style: const TextStyle(
                            fontSize: 11,
                            fontFamily: FontFamily.semiBold,
                          ),
                        ),
                      ),
                    ),
                  ],
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  /// Popular Exhibits Vertical Card
  Widget _buildExhibitCard({required String imageUrl, required String title, required onTap}) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 140,
        margin: const EdgeInsets.only(right: 12),
        decoration: BoxDecoration(
          color: AppColors.white,
          borderRadius: BorderRadius.circular(12),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.04),
              blurRadius: 8,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: const BorderRadius.vertical(top: Radius.circular(12)),
              child: Image.asset(
                imageUrl,
                height: 90,
                width: 140,
                fit: BoxFit.cover,
                errorBuilder: (context, error, stackTrace) => Container(
                  height: 90,
                  width: 140,
                  color: AppColors.lightDisabled,
                  child: const Icon(Icons.image, color: Colors.grey),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 12),
              child: Text(
                title,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: const TextStyle(
                  fontSize: 12,
                  fontFamily: FontFamily.bold,
                  fontWeight: FontWeight.w600,
                  color: AppColors.textPrimary,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  /// Dark News/Event Card with Orange Left Accent Line
  Widget _buildNewsEventCard({required String title, required bool hasBackgroundImage}) {
    return Container(
      width: 240,
      margin: const EdgeInsets.only(right: 12),
      decoration: BoxDecoration(
        color: const Color(0xFF1E1E1E), // Dark background matching mockup
        borderRadius: BorderRadius.circular(12),
        // Optional faint background image layer mapping
        image: hasBackgroundImage
            ? DecorationImage(
          image: const AssetImage(ImageConstant.bhaktiDham), // Replace with actual background
          fit: BoxFit.cover,
          colorFilter: ColorFilter.mode(
            Colors.black.withOpacity(0.6),
            BlendMode.darken,
          ),
        )
            : null,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 6,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Stack(
        children: [
          // Left Orange Accent Line
          Positioned(
            left: 16,
            top: 16,
            bottom: 16,
            child: Container(
              width: 3,
              decoration: BoxDecoration(
                color: AppColors.primary,
                borderRadius: BorderRadius.circular(2),
              ),
            ),
          ),
          // Text Content
          Padding(
            padding: const EdgeInsets.only(left: 28, top: 16, right: 16, bottom: 16),
            child: Align(
              alignment: Alignment.centerLeft,
              child: Text(
                title,
                style: const TextStyle(
                  color: AppColors.white,
                  fontSize: 13,
                  fontFamily: FontFamily.semiBold,
                  fontWeight: FontWeight.w600,
                  height: 1.4,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}