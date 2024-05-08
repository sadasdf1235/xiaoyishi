import 'package:get/get.dart';

import '../../constants/I18n_content.dart';

class PurchasedController extends GetxController{
  List tabs = [
    I18nContent.ALL.tr,
    I18nContent.OBLIGATION.tr,
    I18nContent.DECOCKER.tr,
    I18nContent.WAITFORREC.tr,
    I18nContent.REMAINEVAL,
    I18nContent.BEINGREF.tr,
  ];
  RxList orderList = [].obs;

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
  }
}