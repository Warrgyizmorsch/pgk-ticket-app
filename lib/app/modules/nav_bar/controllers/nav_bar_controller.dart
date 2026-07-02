

import 'package:pgk_ticket_app/app/modules/profile/views/profile_view.dart';

import '../../../common/constant/app_imports.dart';
import '../../history/views/history_view.dart';
import '../../home/views/home_view.dart';
import '../../scanner/views/scanner_view.dart';
import '../../show_view/views/show_view_view.dart';
import '../../tickets/views/tickets_view.dart';

class NavBarController extends GetxController {
  /// Reactive integer tracking index exactly like your setup template
  final RxInt selectedIndex = 0.obs;

  /// Ordered array list containing your main target feature views
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

  /// Updates the active selected index natively
  void changeTab(int index) {
    if (index >= 0 && index < pages.length) {
      selectedIndex.value = index;
    }
  }

  /// Updates the active selected index using your Route string constants
  void changeTabByRoute(String routeName) {
    int index = routes.indexOf(routeName);
    if (index != -1) {
      selectedIndex.value = index;
    }
  }

  /// Quick getter to find out which route string is currently active
  String get currentRoute => routes[selectedIndex.value];
}