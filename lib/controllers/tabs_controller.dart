import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../pages/home/home_view.dart';
import '../pages/discover/discover_view.dart';
import '../pages/user/user_view.dart';
import '../pages/message/message_view.dart';
import '../widgets/ld_icon.dart';
import '../constants/I18n_content.dart';
class TabsController extends GetxController{

  RxInt currentIndex = 0.obs;
  List bottomNavigationBarList = [
    {
      'icon':LdIcon.home,
      'activeIcon':LdIcon.home,
      'label':I18nContent.TAB_HOME.tr
    },
    {
      'icon':LdIcon.discover,
      'activeIcon':LdIcon.discover_act,
      'label':I18nContent.TAB_DISCOVER.tr
    },
    {
      'icon':LdIcon.message,
      'activeIcon':LdIcon.message,
      'label':I18nContent.TAB_MESSAGE.tr
    },
    {
      'icon':LdIcon.my,
      'activeIcon':LdIcon.my_act,
      'label':I18nContent.TAB_USER
    },
  ];
  PageController pageController = PageController(initialPage: 0);
  List<Widget> pages = const <Widget>[
    HomeView(),
    DiscoverView(),
    MessageView(),
    UserView()
  ];

  /// tab页切换
  void changeCurrentIndex(int index){
    currentIndex.value = index;
    update();
  }
}