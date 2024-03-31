import 'package:get/get.dart';

import '../pages/tabs/tabs_view.dart';
import '../pages/home/home_view.dart';
import '../pages/discover/discover_view.dart';
import '../pages/message/message_view.dart';
import '../pages/user/user_view.dart';
import '../pages/other/release_idle/release_idle_view.dart';
import '../pages/other/login/login_view.dart';
import '../pages/other/search/search_view.dart';
// part 'app_routes.dart';
import './app_routes.dart';

class AppPages {
  AppPages._();

  // 默认启动页
  static const INITIAL = Routes.TABS;

  static final routes = [
    GetPage(
      name: Routes.TABS,
      page: () => const TabsView(),
    ),
    GetPage(
      name: Routes.HOME,
      page: () => const HomeView(),
    ),
    GetPage(
      name: Routes.DISCOVER,
      page: () => const DiscoverView(),
    ),
    GetPage(
      name: Routes.MESSAGE,
      page: () => const MessageView(),
    ),
    GetPage(
      name: Routes.USER,
      page: () => const UserView(),
    ),
    GetPage(
      name: Routes.RELEASE_IDLE,
      page: () => const ReleaseIdleView(),
    ),
    GetPage(
      name: Routes.LOGIN,
      page: () => const LoginView(),
    ),
    GetPage(
      name: Routes.SEARCH,
      page: () => const SearchView(),
    ),
  ];
}
