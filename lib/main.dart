import 'package:flutter/material.dart';
import 'dart:ui' as ui;

import 'package:get/get.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'utils/https_client.dart';
import 'routes/app_pages.dart';
import 'language/messages.dart';
import 'bindings/common_binding.dart';

void main() {
  // 初始化网络请求
  setupHttpClient();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(350, 750), // 设计稿中设备的尺寸
      minTextAdapt: true, // 是否根据宽度/高度中的最小值适配文字
      splitScreenMode: true, // 支持分屏尺寸
      builder: (context, child) {
        return GetMaterialApp(
          initialBinding: CommonBinding(),
          debugShowCheckedModeBanner: false,
          initialRoute: AppPages.INITIAL,
          getPages: AppPages.routes,
          translations: Messages(), // 国际化
          // locale: Get.locale,
          // locale: const Locale('zh', 'CN'),
          locale: ui.window.locale,
          fallbackLocale: const Locale('en', 'US'), // 添加一个回调语言选项，以备上面指定的语言翻译不存在
          // theme: ThemeData(
          //
          // ),
        );
      },
    );
  }
}
