import 'package:easy_refresh/easy_refresh.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../constants/I18n_content.dart';
import '../../constants/common_colors.dart';
import '../../controllers/user_controller.dart';
import '../../routes/app_routes.dart';

class UserView extends GetView<UserController> {
  const UserView({super.key});

  Widget _recordItem(
      {required Widget topChild,
      required String bottomText,
      required String routerName}) {
    return InkWell(
      onTap: () {
        if (!controller.isLogin.value) {
          Get.toNamed(Routes.LOGIN);
          return;
        }
        Get.toNamed(routerName);
      },
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          topChild,
          SizedBox(
            height: 5.h,
          ),
          Text(bottomText)
        ],
      ),
    );
  }

  PreferredSizeWidget _appBar() {
    return PreferredSize(
      preferredSize: Size.fromHeight(120.h),
      child: AppBar(
        flexibleSpace: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
                height: AppBar().preferredSize.height), // 上方留白，高度等于 AppBar 的高度
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.w), // 适当的左右边距
              child: Row(
                children: [
                  SizedBox(
                    width: 64.w,
                    height: 64.h,
                    child: CircleAvatar(
                      radius: 32.w,
                      backgroundImage: !controller.isLogin.value ||
                          controller.userInfo.value == null
                          ? AssetImage(controller.defaultAvatar)
                          : NetworkImage(
                          controller.userInfo.value!.avatar)
                      as ImageProvider<Object>,
                    ),
                  ),
                  SizedBox(width: 16.w), // 头像与标题之间的间距
                  controller.isLogin.value &&
                      controller.userInfo.value != null
                      ? Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        controller.userInfo.value!.username,
                        style: TextStyle(
                            fontSize: 20.sp,
                            fontWeight: FontWeight.bold),
                      ),
                      Text(
                        'ID: ${controller.userInfo.value?.userId}',
                        style: TextStyle(
                            fontSize: 12.sp, color: Colors.grey),
                      ),
                      SizedBox(height: 8.h), // 标题与按钮之间的间距
                      // 粉丝 关注
                      Row(
                        children: [
                          Text('${I18nContent.ATTENTION.tr} ${controller.userInfo.value?.follows ?? 0 }'),
                          SizedBox(width: 5.w),
                          Container(
                            width: 1.w,
                            height: 12.h,
                            color: Colors.black,
                          ),
                          SizedBox(width: 5.w),
                          Text('${I18nContent.FANS.tr} ${controller.userInfo.value?.beans ?? 0 }'),
                        ],
                      )
                    ],
                  )
                      : InkWell(
                    onTap: () {
                      Get.toNamed(Routes.LOGIN);
                    },
                    child: Text(
                        '${I18nContent.SIGNIN.tr}/${I18nContent.SIGNUP.tr} >'),
                  ),
                  const Spacer(), // 标题与按钮之间的间距
                  InkWell(
                    child: Column(
                      children: [
                        const Icon(Icons.help),
                        Text(I18nContent.HELP.tr),
                      ],
                    ),
                    onTap: () {},
                  ),
                  SizedBox(width: 16.w), // 按钮之间的间距
                  InkWell(
                    child: Column(
                      children: [
                        const Icon(Icons.settings),
                        Text(I18nContent.SETTING.tr),
                      ],
                    ),
                    onTap: () {},
                  ),
                ],
              ),
            ),
          ],
        ),
        automaticallyImplyLeading: false, // 禁用默认的 leading
      ),
    );
  }

  /// 发布闲置
  Widget _releaseIdle() {
    return Card(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SizedBox(
              width: 80.w,
              height: 80.w,
              child: Image.asset(
                controller.defaultRelease,
                fit: BoxFit.contain,
              )),
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(I18nContent.USER_TAGLINE.tr),
              TextButton.icon(
                  onPressed: () {
                    controller.toRelease();
                  },
                  icon: const Icon(
                    Icons.keyboard_arrow_right,
                    color: CommonColors.themeColor,
                  ),
                  label: Text(
                    I18nContent.RELEASEIDLE.tr,
                    style: const TextStyle(color: CommonColors.themeColor),
                  ))
            ],
          )
        ],
      ),
    );
  }

  /// 卡片
  Widget _userRecord() {
    return Card(
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 10.h),
        child: GridView.count(
          crossAxisCount: 3,
          mainAxisSpacing: 5.h,
          crossAxisSpacing: 5.w,
          childAspectRatio: 2,
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          children: controller.recordItemList.map((e) {
            Widget child = e['iconData'] == null
                ? Text('${e['topText']}')
                : Icon(e['iconData']);
            return _recordItem(
                topChild: child,
                bottomText: e['bottomText'],
                routerName: e['routerName']);
          }).toList(),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Obx(() => Scaffold(
          appBar: _appBar(),
          body: EasyRefresh(
            onRefresh: () async {
              // 下拉刷新逻辑
              // ...
              controller.getUserInfo(controller.userInfo.value?.userId ?? 0);
            },
            onLoad: () async {
              // 上拉加载逻辑
              // ...

            },
            child: Container(
              // vertical: 21.h
              padding: EdgeInsets.symmetric(
                horizontal: 10.w,
              ),
              child: Column(
                children: [
                  _releaseIdle(),
                  SizedBox(
                    height: 5.h,
                  ),
                  _userRecord(),
                ],
              ),
            ),
          ),
        ));
  }
}
