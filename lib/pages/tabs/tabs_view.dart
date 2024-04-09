import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../constants/common_colors.dart';
import '../../controllers/tabs_controller.dart';

class TabsView extends GetView<TabsController> {
  const TabsView({super.key});
  @override
  Widget build(BuildContext context) {
    return Obx(() => Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        items: controller.bottomNavigationBarList.map((e){
          return BottomNavigationBarItem(icon: Icon(e['icon']),activeIcon: Icon(e['activeIcon']),label: e['label']);
        }).toList(),
        currentIndex: controller.currentIndex.value,
        backgroundColor: Colors.white,
        selectedItemColor: CommonColors.themeColor,
        unselectedItemColor: CommonColors.unSelectColor,
        selectedIconTheme: const IconThemeData(
          color: CommonColors.themeColor
        ),
        onTap: (index) {
          controller.changeCurrentIndex(index);
          controller.pageController.jumpToPage(index);
        },
      ),
      body: PageView(
        controller: controller.pageController,
        children: controller.pages,
        onPageChanged: (index) {
          controller.changeCurrentIndex(index);
        },
      ),
    ));
  }
}
