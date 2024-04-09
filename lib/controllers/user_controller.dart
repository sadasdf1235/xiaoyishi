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
      'routerName' : '',
    },
    {
      'topText' : '0',
      'bottomText' : I18nContent.HISTORY.tr,
      'routerName' : '',
    },
    {
      'topText' : '0',
      'bottomText' : I18nContent.POST.tr,
      'routerName' : '',
    },
    {
      'iconData' : LdIcon.posted,
      'bottomText' : I18nContent.POSTED.tr,
      'routerName' : '',
    },
    {
      'iconData' : LdIcon.sold,
      'bottomText' : I18nContent.SOLD.tr,
      'routerName' : '',
    },
    {
      'iconData' : LdIcon.purchased,
      'bottomText' : I18nContent.PURCHASED.tr,
      'routerName' : '1',
    },
  ];
  RxBool isLogin = false.obs;

  void toRelease(){
    Get.toNamed(Routes.RELEASE,arguments: {
      'way' : ReleaseWay.idle
    });
  }
}