import 'package:get/get.dart';
import 'package:xiaoyishi/pages/other/released/released_view.dart';

import '../bindings/common_binding.dart';
import '../controllers/discover_controller.dart';
import '../controllers/home_controller.dart';
import '../controllers/message_controller.dart';
import '../controllers/tabs_controller.dart';
import '../controllers/user_controller.dart';
import '../pages/tabs/tabs_view.dart';
import '../pages/home/home_view.dart';
import '../pages/discover/discover_view.dart';
import '../pages/message/message_view.dart';
import '../pages/user/user_view.dart';
import '../pages/other/release/release_view.dart';
import '../pages/other/login/login_view.dart';
import '../pages/other/search/search_view.dart';
import '../pages/other/collect/collect_view.dart';
import '../pages/other/history/history_view.dart';
import '../pages/other/post/post_view.dart';
import '../pages/other/released/released_view.dart';
import '../pages/other/sold/sold_view.dart';
import '../pages/other/purchased/purchased_view.dart';
import '../pages/other/product_detail/product_detail_view.dart';
import '../pages/other/chat/chat_view.dart';
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
      binding: BindingsBuilder(
        () {
          Get.lazyPut<TabsController>(() => TabsController());
        },
      ),
    ),
    GetPage(
      name: Routes.HOME,
      page: () => const HomeView(),
      binding: BindingsBuilder(
        () {
          Get.lazyPut<HomeController>(() => HomeController());
        },
      ),
    ),
    GetPage(
      name: Routes.DISCOVER,
      page: () => const DiscoverView(),
      binding: BindingsBuilder(
        () {
          Get.lazyPut<DiscoverController>(() => DiscoverController());
        },
      ),
    ),
    GetPage(
      name: Routes.MESSAGE,
      page: () => const MessageView(),
      binding: BindingsBuilder(
        () {
          Get.lazyPut<MessageController>(() => MessageController());
        },
      ),
    ),
    GetPage(
      name: Routes.USER,
      page: () => const UserView(),
      binding: BindingsBuilder(
        () {
          Get.lazyPut<UserController>(() => UserController());
        },
      ),
    ),
    GetPage(
      name: Routes.RELEASE,
      page: () => const ReleaseView(),
    ),
    GetPage(
      name: Routes.LOGIN,
      page: () => const LoginView(),
    ),
    GetPage(
      name: Routes.SEARCH,
      page: () => const SearchView(),
    ),
    GetPage(
      name: Routes.COLLECT,
      page: () => const CollectView(),
    ),
    GetPage(
      name: Routes.HISTORY,
      page: () => const HistoryView(),
    ),
    GetPage(
      name: Routes.POST,
      page: () => const PostView(),
    ),
    GetPage(
      name: Routes.RELEASED,
      page: () => const ReleasedView(),
    ),
    GetPage(
      name: Routes.SOLD,
      page: () => const SoldView(),
    ),
    GetPage(
      name: Routes.PURCHASED,
      page: () => const PurchasedView(),
    ),
    GetPage(
      name: Routes.PRODUCT_DETAIL,
      page: () => const ProductDetailView(),
    ),
    GetPage(
      name: Routes.CHAT,
      page: () => const ChatView(),
    ),
  ];
}
