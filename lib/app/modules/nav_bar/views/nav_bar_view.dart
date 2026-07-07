import '../../../common/constant/app_imports.dart';
import '../controllers/nav_bar_controller.dart';


class NavBarView extends GetView<NavBarController> {
  const NavBarView({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(NavBarController());
    final l10n = AppLocalizations.of(context)!;

    return Scaffold(
      backgroundColor: AppColors.background,
      body: Obx(() => controller.pages[controller.selectedIndex.value]),

      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: Container(
        margin: const EdgeInsets.only(top: 20),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            GestureDetector(
              onTap: () => controller.changeTabByRoute(Routes.SCANNER),
              child: Container(
                width: 64,
                height: 64,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  gradient: AppColors.primaryGradient,
                  boxShadow: [
                    BoxShadow(
                      color: AppColors.primary.withValues(alpha: 0.4),
                      blurRadius: 10,
                      offset: const Offset(0, 4),
                    ),
                  ],
                ),
                child: const Icon(
                  Icons.qr_code_scanner_rounded,
                  color: Colors.white,
                  size: 32,
                ),
              ),
            ),
            const SizedBox(height: 4),
            Text(
              l10n.navQrScan,
              style: const TextStyle(fontSize: 10, fontWeight: FontWeight.bold, color: AppColors.primary),
            ),
          ],
        ),
      ),

      bottomNavigationBar: Container(
        height: 84,
        decoration: BoxDecoration(
          color: AppColors.white,
          borderRadius: const BorderRadius.only(topLeft: Radius.circular(24), topRight: Radius.circular(24)),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withValues(alpha: 0.05),
              blurRadius: 10,
              offset: const Offset(0, -4),
            )
          ],
        ),
        child: ClipRRect(
          borderRadius: const BorderRadius.only(topLeft: Radius.circular(24), topRight: Radius.circular(24)),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: Obx(() => Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                _buildNavItem(
                  route: Routes.HOME,
                  icon: Icons.home_rounded,
                  label: l10n.navHome,
                  isActive: controller.currentRoute == Routes.HOME,
                ),
                _buildNavItem(
                  route: Routes.SHOW_VIEW,
                  icon: Icons.star_rounded,
                  label: l10n.navShows,
                  isActive: controller.currentRoute == Routes.SHOW_VIEW,
                ),

                const SizedBox(width: 64),

                _buildNavItem(
                  route: Routes.TICKETS,
                  icon: Icons.confirmation_number_rounded,
                  label: l10n.navTickets,
                  isActive: controller.currentRoute == Routes.TICKETS,
                ),
                _buildNavItem(
                  route: Routes.PROFILE,
                  icon: Icons.account_circle_rounded,
                  label: l10n.navProfile,
                  isActive: controller.currentRoute == Routes.PROFILE,
                ),
              ],
            )),
          ),
        ),
      ),
    );
  }

  Widget _buildNavItem({
    required String route,
    required IconData icon,
    required String label,
    required bool isActive,
  }) {
    return GestureDetector(
      onTap: () => controller.changeTabByRoute(route),
      behavior: HitTestBehavior.opaque,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          AnimatedContainer(
            duration: const Duration(milliseconds: 200),
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
            decoration: BoxDecoration(
              color: isActive ? AppColors.tagBg : Colors.transparent,
              borderRadius: BorderRadius.circular(12),
              border: Border.all(color: isActive ? AppColors.priceDivider : Colors.transparent, width: 1),
            ),
            child: Icon(icon, color: isActive ? AppColors.primary : AppColors.lightTextDisabled, size: 24),
          ),
          const SizedBox(height: 4),
          Text(
            label,
            style: TextStyle(
              fontSize: 10,
              fontWeight: FontWeight.w300,
              color: isActive ? AppColors.primary : AppColors.textSecondary,
            ),
          ),
        ],
      ),
    );
  }
}