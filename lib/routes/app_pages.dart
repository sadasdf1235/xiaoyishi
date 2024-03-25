import 'package:get/get.dart';

import '../pages/tabs/tabs_view.dart';
part 'app_routes.dart';

class AppPages {
  AppPages._();

  // 默认启动页
  static const INITIAL = Routes.TABS;

  static final routes = [
    GetPage(
      name: Routes.TABS,
      page: () => const TabsView(),
    ),
  ];
}
