import 'package:pgk_ticket_app/app/modules/profile/views/profile_view.dart';
import '../../../common/constant/app_imports.dart';
import '../../home/views/home_view.dart';
import '../../scanner/views/scanner_view.dart';
import '../../show_view/views/show_view_view.dart';
import '../../tickets/views/tickets_view.dart';

class NavBarController extends GetxController {
  final RxInt selectedIndex = 0.obs;

  final List<Widget> pages = [
    const HomeView(),         // index 0
    const ShowView(),         // index 1
    const ScannerView(),      // index 2
    const TicketsView(),      // index 3
    const ProfileView(),      // index 4
  ];

  /// Parallel list mapping indices to your exact Route string constants
  final List<String> routes = [
    Routes.HOME,         // index 0
    Routes.SHOW_VIEW,    // index 1
    Routes.SCANNER,       // index 2 (matching your spelling)
    Routes.TICKETS,      // index 3
    Routes.PROFILE,      // index 4
  ];

  void changeTab(int index) {
    if (index >= 0 && index < pages.length) {
      selectedIndex.value = index;
    }
  }

  void changeTabByRoute(String routeName) {
    int index = routes.indexOf(routeName);
    if (index != -1) {
      selectedIndex.value = index;
    }
  }

  String get currentRoute => routes[selectedIndex.value];
}