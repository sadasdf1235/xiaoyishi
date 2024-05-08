import 'package:get/get.dart';

import '../../constants/I18n_content.dart';

class CollectController extends GetxController{

  List tabs = [I18nContent.ALL.tr,I18nContent.COWRY.tr];
  RxList collectList = [].obs;
  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
  }
}