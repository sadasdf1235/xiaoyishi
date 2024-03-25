import 'package:get/get.dart';

import '../../controllers/tabs_controller.dart';
import '../../controllers/user_controller.dart';
import '../../controllers/message_controller.dart';
import '../../controllers/discover_controller.dart';
import '../../controllers/home_controller.dart';
class CommonBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<TabsController>(() => TabsController());
    Get.lazyPut<HomeController>(() => HomeController());
    Get.lazyPut<DiscoverController>(() => DiscoverController());
    Get.lazyPut<MessageController>(() => MessageController());
    Get.lazyPut<UserController>(() => UserController());
  }
}