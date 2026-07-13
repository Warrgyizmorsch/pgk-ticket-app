import '../../../common/constant/app_imports.dart';


class NavBarController extends GetxController {
  final RxInt selectedIndex = 0.obs;

  final List<Widget> pages = [
    const HomeView(),
    const ShowView(),
    const ScannerView(),
    const TicketsView(),
    const ProfileView(),
  ];

  final List<String> routes = [
    Routes.HOME,
    Routes.SHOW_VIEW,
    Routes.SCANNER,
    Routes.TICKETS,
    Routes.PROFILE,
  ];

  void changeTab(int index) {
    if (index >= 0 && index < pages.length) {
      selectedIndex.value = index;

      if (index == 3) {
        if (Get.isRegistered<TicketsController>()) {
          Get.find<TicketsController>().fetchTickets('success', isRefresh: true);
          Get.find<TicketsController>().fetchTickets('pending', isRefresh: true);
        }
      }
    }
  }

  void changeTabByRoute(String routeName) {
    int index = routes.indexOf(routeName);
    if (index != -1) {
      selectedIndex.value = index;
    }
    if (index == 3) {
      if (Get.isRegistered<TicketsController>()) {
        Get.find<TicketsController>().fetchTickets('success', isRefresh: true);
        Get.find<TicketsController>().fetchTickets('pending', isRefresh: true);
      }
    }
  }

  String get currentRoute => routes[selectedIndex.value];
}