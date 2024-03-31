import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../constants/I18n_content.dart';

class UserController extends GetxController{
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
      'iconData' : Icons.add,
      'bottomText' : I18nContent.POSTED.tr,
      'routerName' : '',
    },
    {
      'iconData' : Icons.add,
      'bottomText' : I18nContent.SOLD.tr,
      'routerName' : '',
    },
    {
      'iconData' : Icons.add,
      'bottomText' : I18nContent.PURCHASED.tr,
      'routerName' : '1',
    },
  ];
  RxBool isLogin = false.obs;
}