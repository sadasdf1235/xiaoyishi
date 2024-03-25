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
  List<BottomNavigationBarItem> bottomNavigationBarItems = [
    BottomNavigationBarItem(icon: Icon(LdIcon.home),activeIcon: Icon(LdIcon.home),label: I18nContent.TAB_HOME.tr),
    BottomNavigationBarItem(icon: Icon(LdIcon.discover),activeIcon: Icon(LdIcon.discover_act),label: I18nContent.TAB_DISCOVER.tr),
    BottomNavigationBarItem(icon: Icon(LdIcon.message),activeIcon: Icon(LdIcon.message),label: I18nContent.TAB_MESSAGE.tr),
    BottomNavigationBarItem(icon: Icon(LdIcon.my),activeIcon: Icon(LdIcon.my_act),label: I18nContent.TAB_USER.tr),
  ];
  PageController pageController = PageController(initialPage: 0);
  List<Widget> pages = const <Widget>[
    HomeView(),
    MessageView(),
    DiscoverView(),
    UserView()
  ];

  /// tab页切换
  void changeCurrentIndex(int index){
    currentIndex.value = index;
    update();
  }
}