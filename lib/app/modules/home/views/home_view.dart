import 'package:pgk_ticket_app/app/modules/show_view/widget/water_show_view.dart';

import '../../../common/constant/app_imports.dart';
import '../../show_view/widget/light_sound_show_view.dart';
import '../controllers/home_controller.dart';
import '../widget/bharat_mata_mandir_view.dart';
import '../widget/charitra_pradarshanee_view.dart';
import '../widget/diver_mahotsav_view.dart';
import '../widget/event_detail_view.dart';
import '../widget/haldighati_vijay_yudh_view.dart';
import '../widget/krantikari_dirgha_view.dart';
import '../widget/mewad_ratan_dirgha_view.dart';
import '../widget/rajasthan_dirgha_view.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    // Initialize AppLocalizations
    final l10n = AppLocalizations.of(context)!;
    final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

    return Scaffold(
      key: scaffoldKey,
      backgroundColor: AppColors.background,

      appBar: CustomAppBar(title: l10n.museumDashboard, showBackButton: false),

      // ─── Main Content Body ───
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // ─── Premium Hero Banner ───
            ClipRRect(
              borderRadius: const BorderRadius.only(
                bottomLeft: Radius.circular(24),
                bottomRight: Radius.circular(24),
              ),
              child: Stack(
                alignment: Alignment.bottomCenter,
                children: [
                  Image.asset(
                    ImageConstant.pgkFullImage,
                    width: double.infinity,
                    height: 240, // Slightly taller for a premium feel
                    fit: BoxFit.cover,
                    errorBuilder: (context, error, stackTrace) => Container(
                      width: double.infinity,
                      height: 240,
                      color: AppColors.lightDisabled,
                      child: const Icon(
                        Icons.account_balance,
                        size: 64,
                        color: Colors.white70,
                      ),
                    ),
                  ),
                  // Sleek Gradient Overlay
                  Container(
                    width: double.infinity,
                    padding: const EdgeInsets.only(
                      top: 60,
                      bottom: 20,
                      left: 20,
                      right: 20,
                    ),
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.bottomCenter,
                        end: Alignment.topCenter,
                        colors: [
                          AppColors.primary.withValues(alpha: 0.95),
                          AppColors.primary.withValues(alpha: 0.6),
                          Colors.transparent,
                        ],
                      ),
                    ),
                    child: Text(
                      l10n.welcomeBannerText,
                      style: AppTextStyles.titleLarge.copyWith(
                        color: AppColors.white,
                        fontSize: 18,
                        height: 1.4,
                      ),
                    ),
                  ),
                ],
              ),
            ),

            Padding(
              padding: const EdgeInsets.all(
                20.0,
              ), // Increased edge padding to 20 for breathing room
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // ─── Section: History ───
                  _buildHistoryCard(
                    imageUrl: ImageConstant.homePGK,
                    title: l10n.pratapGauravKendra,
                    description: l10n.aboutPratapGauravKendra,
                    readMoreText: l10n.readMore,
                    onReadMore: () => Get.toNamed(Routes.ABOUTPGK),
                  ),
                  const SizedBox(height: 16),

                  _buildFullTextHighlightCard(
                    imageUrl: ImageConstant.otp,
                    title: l10n.statueOfPride,
                    description: l10n.statueOfPrideDesc,
                  ),
                  const SizedBox(height: 16),

                  _buildSectionTitle(l10n.historyOfPratap),
                  const SizedBox(height: 16),

                  _buildHistoryCard(
                    imageUrl: ImageConstant.mewar,
                    title: l10n.historyOfPratap,
                    description: l10n.historyIntroP1,
                    readMoreText: l10n.readMore,
                    onReadMore: () => Get.toNamed(Routes.PRATAPHISTORY),
                  ),

                  const SizedBox(height: 16),

                  _buildSectionTitle(l10n.majorAttractions),
                  const SizedBox(height: 16),
                  SizedBox(
                    height: 200,
                    child: ListView(
                      scrollDirection: Axis.horizontal,
                      clipBehavior: Clip.none,
                      physics: const BouncingScrollPhysics(),
                      children: [
                        _buildExhibitCard(
                          imageUrl: ImageConstant.bhaktiDhamIntro,
                          title: l10n.bhaktiDham,
                          onTap: () => Get.toNamed(Routes.BHAKTIDHAM),
                        ),
                        _buildExhibitCard(
                          imageUrl: ImageConstant.waterShow,
                          title: l10n.waterLaserShow,
                          onTap: () => Get.to(() => const WaterShowView()),
                        ),
                        _buildExhibitCard(
                          imageUrl: ImageConstant.haldighatiDirgha,
                          title: l10n.haldighatiDirghaTitle, // Localized
                          onTap: () => Get.to(() => HaldighatiView()),
                        ),
                        _buildExhibitCard(
                          imageUrl: ImageConstant.bharatMataMandir,
                          title: l10n.bharatMataMandirTitle, // Localized
                          onTap: () {
                            Get.to(() => BharatMataMandirView());
                          },
                        ),
                        _buildExhibitCard(
                          imageUrl: ImageConstant.mewadRatanDirgha,
                          title: l10n.mewadRatanDirghaTitle, // Localized
                          onTap: () => Get.to(() => MewadRatanDirghaView()),
                        ),
                        _buildExhibitCard(
                          imageUrl: ImageConstant.krantikariDirgha,
                          title: l10n.krantikariDirghaTitle, // Localized
                          onTap: () => Get.to(() => KrantikariDirghaView()),
                        ),
                        _buildExhibitCard(
                          imageUrl: ImageConstant.charitraPradarshanee,
                          title: l10n.charitraPradarshaneeTitle, // Localized
                          onTap: () => Get.to(() => CharitraPradarshaneeView()),
                        ),
                        _buildExhibitCard(
                          imageUrl: ImageConstant.rajasthanDirgha,
                          title: l10n.rajasthanDirghaTitle, // Localized
                          onTap: () => Get.to(() => RajasthanDirghaView()),
                        ),
                      ],
                    ),
                  ),

                  const SizedBox(height: 16),

                  _buildSectionTitle(l10n.museumNews),
                  const SizedBox(height: 16),
                  SizedBox(
                    height: 110,
                    child: ListView(
                      scrollDirection: Axis.horizontal,
                      clipBehavior: Clip.none,
                      physics: const BouncingScrollPhysics(),
                      children: [
                        _buildNewsEventCard(
                          title: l10n.newsLightSoundShow,
                          hasBackgroundImage: false,
                          onTap: ()=>Get.to(() => const LightSoundShowView()),
                        ),
                        _buildNewsEventCard(
                          title: l10n.newsSpecialExhibition,
                          hasBackgroundImage: true,
                        ),
                      ],
                    ),
                  ),

                  const SizedBox(height: 16),

                  // ─── Section: Upcoming Events ───
                  _buildSectionTitle(l10n.events),
                  const SizedBox(height: 16),
                  SizedBox(
                    height: 90,
                    child: ListView(
                      scrollDirection: Axis.horizontal,
                      clipBehavior: Clip.none,
                      physics: const BouncingScrollPhysics(),
                      children: [
                        _buildNewsEventCard(
                          title: l10n.eventPratapJayanti,
                          hasBackgroundImage: true,
                          onTap: () {
                            Get.to(() => EventDetailView());
                          },
                        ),
                        _buildNewsEventCard(
                          title: l10n.diverMahotsavTitle,
                          hasBackgroundImage: true,
                          onTap: () {
                            Get.to(() => DiverMahotsavView());
                          },
                        ),
                        _buildNewsEventCard(
                          title: l10n.eventKidsWorkshop,
                          hasBackgroundImage: false,
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 24),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  // ─── Layout Builder Helpers ───
  Widget _buildSectionTitle(String title) {
    return Text(title, style: AppTextStyles.headline.copyWith(fontSize: 20));
  }

  Widget _buildFullTextHighlightCard({
    required String imageUrl,
    required String title,
    required String description,
  }) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(24),
        boxShadow: const [
          BoxShadow(
            color: AppColors.lightShadow,
            blurRadius: 16,
            offset: Offset(0, 6),
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(16),
              child: Image.asset(
                imageUrl,
                width: double.infinity,
                height: 220,
                fit: BoxFit.cover,
                errorBuilder: (context, error, stackTrace) => Container(
                  width: double.infinity,
                  height: 220,
                  color: AppColors.lightDisabled,
                  child: const Icon(
                    Icons.account_balance,
                    size: 48,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 24),
            Text(title, style: AppTextStyles.titleLarge.copyWith(fontSize: 22)),
            const SizedBox(height: 12),
            Text(
              description,
              style: AppTextStyles.bodyMedium.copyWith(
                color: AppColors.textSecondary,
                fontSize: AppFontSize.s12,
              ),
              textAlign: TextAlign.justify,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildHistoryCard({
    required String imageUrl,
    required String title,
    required String description,
    String? readMoreText,
    VoidCallback? onReadMore,
  }) {
    return Container(
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
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(20),
              bottomLeft: Radius.circular(20),
            ),
            child: Image.asset(
              imageUrl,
              width: 140,
              height: 160,
              fit: BoxFit
                  .cover, // Changed to cover so it fills the edge perfectly
              errorBuilder: (context, error, stackTrace) => Container(
                width: 140,
                height: 160,
                color: AppColors.lightDisabled,
                child: const Icon(Icons.image, color: Colors.white),
              ),
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: AppTextStyles.titleLarge.copyWith(fontSize: 16),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    description,
                    maxLines: 4,
                    overflow: TextOverflow.ellipsis,
                    style: AppTextStyles.bodySmall.copyWith(
                      color: AppColors.textSecondary,
                      height: 1.4,
                    ),
                  ),
                  if (onReadMore != null) ...[
                    const SizedBox(height: 12),
                    InkWell(
                      onTap: onReadMore,
                      borderRadius: BorderRadius.circular(4),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(
                            readMoreText ?? 'Read More',
                            style: AppTextStyles.button.copyWith(
                              color: AppColors.primary,
                            ),
                          ),
                          const SizedBox(width: 4),
                          const Icon(
                            Icons.arrow_forward_rounded,
                            size: 16,
                            color: AppColors.primary,
                          ),
                        ],
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

  Widget _buildExhibitCard({
    required String imageUrl,
    required String title,
    required onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 160, // Slightly wider for better image proportion
        margin: const EdgeInsets.only(right: 16),
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
            ClipRRect(
              borderRadius: const BorderRadius.vertical(
                top: Radius.circular(16),
              ),
              child: Image.asset(
                imageUrl,
                height: 140,
                width: double.infinity,
                fit: BoxFit.cover,
                errorBuilder: (context, error, stackTrace) => Container(
                  height: 100,
                  width: double.infinity,
                  color: AppColors.lightDisabled,
                  child: const Icon(Icons.image, color: Colors.white),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: Text(
                title,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: AppTextStyles.subtitle.copyWith(fontSize: 12),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildNewsEventCard({
    required String title,
    required bool hasBackgroundImage,
    VoidCallback? onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 260,
        margin: const EdgeInsets.only(right: 16),
        decoration: BoxDecoration(
          color: const Color(
            0xFF2C1C16,
          ), // Used your textPrimary as a dark slate theme
          borderRadius: BorderRadius.circular(16),
          image: hasBackgroundImage
              ? DecorationImage(
                  image: const AssetImage(ImageConstant.bhaktiDham),
                  fit: BoxFit.cover,
                  colorFilter: ColorFilter.mode(
                    Colors.black.withValues(alpha: 0.7),
                    BlendMode.darken,
                  ),
                )
              : null,
          boxShadow: const [
            BoxShadow(
              color: AppColors.lightShadow,
              blurRadius: 8,
              offset: Offset(0, 4),
            ),
          ],
        ),
        child: Stack(
          children: [
            Positioned(
              left: 16,
              top: 20,
              bottom: 20,
              child: Container(
                width: 4,
                decoration: BoxDecoration(
                  color: AppColors.primary,
                  borderRadius: BorderRadius.circular(4),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                left: 32,
                top: 16,
                right: 16,
                bottom: 16,
              ),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  title,
                  style: AppTextStyles.subtitle.copyWith(
                    color: AppColors.white,
                    height: 1.5,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// import 'package:pgk_ticket_app/app/modules/otp/widget/language_selection.dart';
//
// import '../../../common/constant/app_imports.dart';
// import '../../otp/controllers/otp_controller.dart';
// import '../../show_view/widget/light_sound_show_view.dart';
// import '../controllers/home_controller.dart';
//
// class HomeView extends GetView<HomeController> {
//   const HomeView({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     final l10n = AppLocalizations.of(context)!;
//     // Using a GlobalKey to cleanly control the Scaffold state for the drawer
//     final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
//
//     return Scaffold(
//       key: scaffoldKey,
//       backgroundColor: AppColors.background, // Creamy background (#FFF5F1)
//
//       // ─── Left Side Navigation Drawer ───
//       drawer: _buildAppDrawer(context, l10n),
//
//       // ─── AppBar Section ───
//       appBar: CustomAppBar(
//         title: l10n.museumDashboard,
//         showBackButton: false,
//         // Replaced static icon with a functional menu button that opens the drawer
//         leading: IconButton(
//           icon: const Icon(Icons.menu, color: Colors.white),
//           onPressed: () => scaffoldKey.currentState?.openDrawer(),
//         ),
//         actions: [
//           IconButton(
//             icon: const Icon(Icons.account_circle, color: Colors.white, size: 30),
//             onPressed: () {
//               // Get.toNamed(Routes.PROFILE);
//             },
//           ),
//           const SizedBox(width: 8),
//         ],
//       ),
//
//       // ─── Main Content Body ───
//       body: SingleChildScrollView(
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             // ─── Hero Banner Section ───
//             Stack(
//               alignment: Alignment.bottomCenter,
//               children: [
//                 Image.asset(
//                   ImageConstant.pgkFullImage,
//                   width: double.infinity,
//                   height: 220,
//                   fit: BoxFit.cover,
//                   errorBuilder: (context, error, stackTrace) => Container(
//                     width: double.infinity,
//                     height: 220,
//                     color: AppColors.lightDisabled,
//                     child: const Icon(Icons.account_balance, size: 64, color: Colors.grey),
//                   ),
//                 ),
//                 // Orange Gradient Overlay
//                 Container(
//                   width: double.infinity,
//                   padding: const EdgeInsets.only(top: 40, bottom: 16, left: 16, right: 16),
//                   decoration: BoxDecoration(
//                     gradient: LinearGradient(
//                       begin: Alignment.bottomCenter,
//                       end: Alignment.topCenter,
//                       colors: [
//                         AppColors.primary.withValues(alpha: 0.95),
//                         AppColors.primary.withValues(alpha: 0.0),
//                       ],
//                     ),
//                   ),
//                   child: Text(
//                     l10n.welcomeBannerText,
//                     style: const TextStyle(
//                       color: Colors.white,
//                       fontSize: 16,
//                       fontFamily: FontFamily.semiBold,
//                       fontWeight: FontWeight.w600,
//                       height: 1.3,
//                     ),
//                   ),
//                 ),
//               ],
//             ),
//
//             Padding(
//               padding: const EdgeInsets.all(16.0),
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   // ─── Section: History ───
//                   _buildHistoryCard(
//                     imageUrl: ImageConstant.homePGK,
//                     title: l10n.pratapGauravKendra,
//                     description: l10n.aboutPratapGauravKendra,
//                     readMoreText: l10n.readMore,
//                     onReadMore: () => Get.toNamed(Routes.ABOUTPGK),
//                   ),
//                   const SizedBox(height: 24),
//                   _buildFullTextHighlightCard(
//                     imageUrl: ImageConstant.otp,
//                     title: l10n.statueOfPride,
//                     description: l10n.statueOfPrideDesc,
//                   ),
//                   const SizedBox(height: 24),
//                   _buildSectionTitle(l10n.historyOfPratap),
//                   const SizedBox(height: 12),
//                   _buildHistoryCard(
//                     imageUrl: ImageConstant.mewar,
//                     title: l10n.historyOfPratap,
//                     description: l10n.historyIntroP1,
//                     readMoreText: l10n.readMore,
//                     onReadMore: () => Get.toNamed(Routes.PRATAPHISTORY),
//                   ),
//
//                   const SizedBox(height: 24),
//
//                   // ─── Section: Popular Exhibits ───
//                   _buildSectionTitle(l10n.majorAttractions),
//                   const SizedBox(height: 12),
//                   SizedBox(
//                     height: 140,
//                     child: ListView(
//                       scrollDirection: Axis.horizontal,
//                       physics: const BouncingScrollPhysics(),
//                       children: [
//                         _buildExhibitCard(
//                           imageUrl: ImageConstant.bhaktiDham,
//                           title: l10n.bhaktiDham,
//                           onTap: () => Get.toNamed(Routes.BHAKTIDHAM),
//                         ),
//                         _buildExhibitCard(
//                           imageUrl: ImageConstant.bhaktiDham,
//                           title: l10n.waterLaserShow,
//                           onTap: () => Get.to(const LightSoundShowView()),
//                         ),
//                         _buildExhibitCard(
//                           imageUrl: ImageConstant.bhaktiDham,
//                           title: l10n.vijayStambh,
//                           onTap: () {},
//                         ),
//                       ],
//                     ),
//                   ),
//
//                   const SizedBox(height: 24),
//
//                   // ─── Section: Museum News ───
//                   _buildSectionTitle(l10n.museumNews),
//                   const SizedBox(height: 12),
//                   SizedBox(
//                     height: 110,
//                     child: ListView(
//                       scrollDirection: Axis.horizontal,
//                       physics: const BouncingScrollPhysics(),
//                       children: [
//                         _buildNewsEventCard(
//                           title: l10n.newsLightSoundShow,
//                           hasBackgroundImage: false,
//                         ),
//                         _buildNewsEventCard(
//                           title: l10n.newsSpecialExhibition,
//                           hasBackgroundImage: true,
//                         ),
//                       ],
//                     ),
//                   ),
//
//                   const SizedBox(height: 24),
//
//                   // ─── Section: Upcoming Events ───
//                   _buildSectionTitle(l10n.events),
//                   const SizedBox(height: 12),
//                   SizedBox(
//                     height: 90,
//                     child: ListView(
//                       scrollDirection: Axis.horizontal,
//                       physics: const BouncingScrollPhysics(),
//                       children: [
//                         _buildNewsEventCard(
//                           title: l10n.eventPratapJayanti,
//                           hasBackgroundImage: false,
//                         ),
//                         _buildNewsEventCard(
//                           title: l10n.eventKidsWorkshop,
//                           hasBackgroundImage: false,
//                         ),
//                       ],
//                     ),
//                   ),
//                   const SizedBox(height: 100),
//                 ],
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
//
//   // ─── Drawer Builder Helper ───
//   Widget _buildAppDrawer(BuildContext context, AppLocalizations l10n) {
//     return Drawer(
//       backgroundColor: AppColors.white,
//       child: Column(
//         children: [
//           // Elegant customized header block reflecting museum theming
//           UserAccountsDrawerHeader(
//             decoration: const BoxDecoration(
//               color: AppColors.primary,
//             ),
//             currentAccountPicture: Container(
//               decoration: const BoxDecoration(
//                 color: AppColors.white,
//                 shape: BoxShape.circle,
//               ),
//               child: const Icon(
//                 Icons.person,
//                 size: 45,
//                 color: AppColors.primary,
//               ),
//             ),
//             accountName: const Text(
//               'Guest User',
//               style: TextStyle(
//                 fontFamily: FontFamily.bold,
//                 fontWeight: FontWeight.w700,
//                 fontSize: 16,
//               ),
//             ),
//             accountEmail: const Text(
//               'welcome@pratapgauravkendra.org',
//               style: TextStyle(
//                 fontFamily: FontFamily.regular,
//                 fontSize: 12,
//               ),
//             ),
//           ),
//
//           // Drawer Menu Navigation Links
//           Expanded(
//             child: ListView(
//               padding: EdgeInsets.zero,
//               children: [
//                 _buildDrawerItem(
//                   icon: Icons.person_outline,
//                   title: 'Profile',
//                   onTap: () {
//                     Get.back(); // Closes the drawer safely
//                     Get.toNamed(Routes.PROFILE);
//                   },
//                 ),
//                 _buildDrawerItem(
//                   icon: Icons.language_outlined,
//                   title: 'Change Language',
//                   onTap: () {
//                     Get.back();
//                     Get.lazyPut(()=>OtpController());
//                    Get.to(() => const LanguageSelectionView());
//                   },
//                 ),
//                 _buildDrawerItem(
//                   icon: Icons.bluetooth_searching_outlined,
//                   title: 'Bluetooth Connectivity',
//                   subtitle: 'Connect audio guides',
//                   onTap: () {
//                     // Get.back();
//                     // Get.toNamed(Routes.BLUETOOTH_SETUP);
//                   },
//                 ),
//                 const Divider(height: 32, thickness: 1, indent: 16, endIndent: 16),
//               ],
//             ),
//           ),
//
//           // Permanent alignment of Logout item at bottom of drawer canvas
//           Padding(
//             padding: const EdgeInsets.only(bottom: 24.0),
//             child: _buildDrawerItem(
//               icon: Icons.logout_rounded,
//               title: 'Logout',
//               iconColor: Colors.redAccent,
//               textColor: Colors.redAccent,
//               onTap: () {
//                 Get.back();
//                 _showLogoutConfirmation();
//               },
//             ),
//           ),
//         ],
//       ),
//     );
//   }
//
//   Widget _buildDrawerItem({
//     required IconData icon,
//     required String title,
//     String? subtitle,
//     required VoidCallback onTap,
//     Color iconColor = AppColors.primary,
//     Color textColor = AppColors.textPrimary,
//   }) {
//     return ListTile(
//       leading: Icon(icon, color: iconColor, size: 24),
//       title: Text(
//         title,
//         style: TextStyle(
//           color: textColor,
//           fontSize: 14,
//           fontFamily: FontFamily.semiBold,
//           fontWeight: FontWeight.w600,
//         ),
//       ),
//       subtitle: subtitle != null
//           ? Text(
//         subtitle,
//         style: const TextStyle(
//           fontSize: 11,
//           color: AppColors.textSecondary,
//           fontFamily: FontFamily.regular,
//         ),
//       )
//           : null,
//       trailing: const Icon(Icons.chevron_right_rounded, color: Colors.grey, size: 20),
//       onTap: onTap,
//     );
//   }
//
//   // ─── Dialog & Sheet Implementations ───
//   void _showLanguageSelector() {
//     Get.bottomSheet(
//       Container(
//         padding: const EdgeInsets.all(20),
//         decoration: const BoxDecoration(
//           color: AppColors.white,
//           borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
//         ),
//         child: Column(
//           mainAxisSize: MainAxisSize.min,
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             const Text(
//               'Select Preferred Language',
//               style: TextStyle(fontSize: 16, fontFamily: FontFamily.bold, fontWeight: FontWeight.bold),
//             ),
//             const SizedBox(height: 16),
//             ListTile(
//               title: const Text('English'),
//               trailing: Get.locale?.languageCode == 'en' ? const Icon(Icons.check, color: AppColors.primary) : null,
//               onTap: () {
//                 Get.updateLocale(const Locale('en', 'US'));
//                 Get.back();
//               },
//             ),
//             ListTile(
//               title: const Text('हिन्दी (Hindi)'),
//               trailing: Get.locale?.languageCode == 'hi' ? const Icon(Icons.check, color: AppColors.primary) : null,
//               onTap: () {
//                 Get.updateLocale(const Locale('hi', 'IN'));
//                 Get.back();
//               },
//             ),
//           ],
//         ),
//       ),
//     );
//   }
//
//   void _showLogoutConfirmation() {
//     Get.dialog(
//       AlertDialog(
//         title: const Text('Logout'),
//         content: const Text('Are you sure you want to log out of the application?'),
//         actions: [
//           TextButton(
//             onPressed: () => Get.back(),
//             child: const Text('Cancel', style: TextStyle(color: AppColors.textSecondary)),
//           ),
//           ElevatedButton(
//             onPressed: () {
//               Get.back();
//               // Complete teardown of preferences via global auth controllers
//               Get.offAllNamed(Routes.LOGIN);
//             },
//             style: ElevatedButton.styleFrom(backgroundColor: Colors.redAccent),
//             child: const Text('Logout', style: TextStyle(color: Colors.white)),
//           ),
//         ],
//       ),
//     );
//   }
//
//   // ─── Layout Builder Helpers ───
//   Widget _buildSectionTitle(String title) {
//     return Text(
//       title,
//       style: AppTextStyles.titleLarge.copyWith(
//         fontSize: 18,
//         fontFamily: FontFamily.bold,
//         color: AppColors.textPrimary,
//       ),
//     );
//   }
//
//   Widget _buildFullTextHighlightCard({
//     required String imageUrl,
//     required String title,
//     required String description,
//   }) {
//     return Container(
//       width: double.infinity,
//       decoration: BoxDecoration(
//         color: AppColors.white,
//         borderRadius: BorderRadius.circular(24),
//         boxShadow: [
//           BoxShadow(
//             color: Colors.black.withValues(alpha: 0.04),
//             blurRadius: 20,
//             spreadRadius: 2,
//             offset: const Offset(0, 8),
//           ),
//         ],
//       ),
//       child: Padding(
//         padding: const EdgeInsets.all(20.0),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             ClipRRect(
//               borderRadius: BorderRadius.circular(16),
//               child: Image.asset(
//                 imageUrl,
//                 width: double.infinity,
//                 height: 240,
//                 fit: BoxFit.cover,
//                 errorBuilder: (context, error, stackTrace) => Container(
//                   width: double.infinity,
//                   height: 240,
//                   decoration: BoxDecoration(
//                     color: Colors.grey.shade100,
//                     borderRadius: BorderRadius.circular(16),
//                   ),
//                   child: const Icon(Icons.account_balance, size: 48, color: Colors.grey),
//                 ),
//               ),
//             ),
//             const SizedBox(height: 24),
//             Text(
//               title,
//               style: const TextStyle(
//                 fontSize: 20,
//                 fontFamily: FontFamily.bold,
//                 fontWeight: FontWeight.w800,
//                 color: AppColors.textPrimary,
//                 letterSpacing: 0.2,
//               ),
//             ),
//             const SizedBox(height: 12),
//             Text(
//               description,
//               style: const TextStyle(
//                 fontSize: 14,
//                 height: 1.6,
//                 fontFamily: FontFamily.regular,
//                 color: AppColors.textSecondary,
//               ),
//               textAlign: TextAlign.justify,
//             ),
//           ],
//         ),
//       ),
//     );
//   }
//
//   Widget _buildHistoryCard({
//     required String imageUrl,
//     required String title,
//     required String description,
//     String? readMoreText,
//     VoidCallback? onReadMore,
//   }) {
//     return Container(
//       decoration: BoxDecoration(
//         color: AppColors.white,
//         borderRadius: BorderRadius.circular(16),
//         boxShadow: [
//           BoxShadow(
//             color: Colors.black.withValues(alpha: 0.05),
//             blurRadius: 10,
//             offset: const Offset(0, 4),
//           ),
//         ],
//       ),
//       child: Row(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           ClipRRect(
//             borderRadius: const BorderRadius.only(
//               topLeft: Radius.circular(16),
//               bottomLeft: Radius.circular(16),
//             ),
//             child: Image.asset(
//               imageUrl,
//               width: 130,
//               height: 150,
//               fit: BoxFit.fitHeight,
//               errorBuilder: (context, error, stackTrace) => Container(
//                 width: 130,
//                 height: 150,
//                 color: AppColors.lightDisabled,
//                 child: const Icon(Icons.image, color: Colors.grey),
//               ),
//             ),
//           ),
//           Expanded(
//             child: Padding(
//               padding: const EdgeInsets.all(12.0),
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   Text(
//                     title,
//                     maxLines: 1,
//                     overflow: TextOverflow.ellipsis,
//                     style: const TextStyle(
//                       fontSize: 14,
//                       fontFamily: FontFamily.bold,
//                       fontWeight: FontWeight.w700,
//                       color: AppColors.textPrimary,
//                     ),
//                   ),
//                   const SizedBox(height: 6),
//                   Text(
//                     description,
//                     maxLines: 5,
//                     overflow: TextOverflow.ellipsis,
//                     style: const TextStyle(
//                       fontSize: 11,
//                       height: 1.3,
//                       fontFamily: FontFamily.regular,
//                       color: AppColors.textSecondary,
//                     ),
//                   ),
//                   if (onReadMore != null) ...[
//                     const SizedBox(height: 10),
//                     SizedBox(
//                       height: 32,
//                       child: ElevatedButton(
//                         onPressed: onReadMore,
//                         style: ElevatedButton.styleFrom(
//                           backgroundColor: AppColors.primary,
//                           foregroundColor: AppColors.white,
//                           elevation: 0,
//                           padding: const EdgeInsets.symmetric(horizontal: 16),
//                           shape: RoundedRectangleBorder(
//                             borderRadius: BorderRadius.circular(8),
//                           ),
//                         ),
//                         child: Text(
//                           readMoreText ?? 'Read More',
//                           style: const TextStyle(
//                             fontSize: 11,
//                             fontFamily: FontFamily.semiBold,
//                           ),
//                         ),
//                       ),
//                     ),
//                   ],
//                 ],
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
//
//   Widget _buildExhibitCard({required String imageUrl, required String title, required onTap}) {
//     return GestureDetector(
//       onTap: onTap,
//       child: Container(
//         width: 140,
//         margin: const EdgeInsets.only(right: 12),
//         decoration: BoxDecoration(
//           color: AppColors.white,
//           borderRadius: BorderRadius.circular(12),
//           boxShadow: [
//             BoxShadow(
//               color: Colors.black.withValues(alpha: 0.04),
//               blurRadius: 8,
//               offset: const Offset(0, 2),
//             ),
//           ],
//         ),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             ClipRRect(
//               borderRadius: const BorderRadius.vertical(top: Radius.circular(12)),
//               child: Image.asset(
//                 imageUrl,
//                 height: 90,
//                 width: 140,
//                 fit: BoxFit.cover,
//                 errorBuilder: (context, error, stackTrace) => Container(
//                   height: 90,
//                   width: 140,
//                   color: AppColors.lightDisabled,
//                   child: const Icon(Icons.image, color: Colors.grey),
//                 ),
//               ),
//             ),
//             Padding(
//               padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 12),
//               child: Text(
//                 title,
//                 maxLines: 1,
//                 overflow: TextOverflow.ellipsis,
//                 style: const TextStyle(
//                   fontSize: 12,
//                   fontFamily: FontFamily.bold,
//                   fontWeight: FontWeight.w600,
//                   color: AppColors.textPrimary,
//                 ),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
//
//   Widget _buildNewsEventCard({required String title, required bool hasBackgroundImage}) {
//     return Container(
//       width: 240,
//       margin: const EdgeInsets.only(right: 12),
//       decoration: BoxDecoration(
//         color: const Color(0xFF1E1E1E),
//         borderRadius: BorderRadius.circular(12),
//         image: hasBackgroundImage
//             ? DecorationImage(
//           image: const AssetImage(ImageConstant.bhaktiDham),
//           fit: BoxFit.cover,
//           colorFilter: ColorFilter.mode(
//             Colors.black.withValues(alpha: 0.6),
//             BlendMode.darken,
//           ),
//         )
//             : null,
//         boxShadow: [
//           BoxShadow(
//             color: Colors.black.withValues(alpha: 0.1),
//             blurRadius: 6,
//             offset: const Offset(0, 2),
//           ),
//         ],
//       ),
//       child: Stack(
//         children: [
//           Positioned(
//             left: 16,
//             top: 16,
//             bottom: 16,
//             child: Container(
//               width: 3,
//               decoration: BoxDecoration(
//                 color: AppColors.primary,
//                 borderRadius: BorderRadius.circular(2),
//               ),
//             ),
//           ),
//           Padding(
//             padding: const EdgeInsets.only(left: 28, top: 16, right: 16, bottom: 16),
//             child: Align(
//               alignment: Alignment.centerLeft,
//               child: Text(
//                 title,
//                 style: const TextStyle(
//                   color: AppColors.white,
//                   fontSize: 13,
//                   fontFamily: FontFamily.semiBold,
//                   fontWeight: FontWeight.w600,
//                   height: 1.4,
//                 ),
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
