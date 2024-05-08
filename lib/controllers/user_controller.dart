import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../constants/I18n_content.dart';
import '../widgets/ld_icon.dart';
import '../../routes/app_routes.dart';
import '../../constants/release_way.dart';

class UserController extends GetxController{
  String defaultAvatar = 'assets/images/avatar.png';
  String defaultRelease = 'assets/images/user_bk.png';
  List<Map<String,dynamic>> recordItemList = [
    {
      'topText' : '0',
      'bottomText' : I18nContent.COLLECT.tr,
      'routerName' : Routes.COLLECT,
    },
    {
      'topText' : '0',
      'bottomText' : I18nContent.HISTORY.tr,
      'routerName' : Routes.HISTORY,
    },
    {
      'topText' : '0',
      'bottomText' : I18nContent.POST.tr,
      'routerName' : Routes.POST,
    },
    {
      'iconData' : LdIcon.posted,
      'bottomText' : I18nContent.POSTED.tr,
      'routerName' : Routes.RELEASED,
    },
    {
      'iconData' : LdIcon.sold,
      'bottomText' : I18nContent.SOLD.tr,
      'routerName' : Routes.SOLD,
    },
    {
      'iconData' : LdIcon.purchased,
      'bottomText' : I18nContent.PURCHASED.tr,
      'routerName' : Routes.PURCHASED,
    },
  ];
  RxBool isLogin = false.obs;

  // 去发布页
  void toRelease(){
    if(!isLogin.value){
      Get.toNamed(Routes.LOGIN);
      return;
    }
    Get.toNamed(Routes.RELEASE,arguments: {
      'way' : ReleaseWay.idle
    });
  }
  void changeLoginStatus(status){
    isLogin.value = status;
    update();
  }
}