import 'package:flutter/material.dart';
import 'dart:ui' as ui;

import 'package:get/get.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:card_swiper/card_swiper.dart';

import '../../../constants/I18n_content.dart';
import '../../../routes/app_routes.dart';

class ProductDetailView extends GetView {
  const ProductDetailView({super.key});

  @override
  Widget build(BuildContext context) {
    double swiperHeight = MediaQuery.of(context).size.height / 3;
    bool isUs = ui.window.locale.languageCode == 'en';
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Get.back();
          },
          icon: const Icon(Icons.arrow_back_ios),
        ),
      ),
      body: SingleChildScrollView(
        child: ListView(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          children: [
            SizedBox(
              width: double.infinity,
              height: swiperHeight,
              child: Swiper(
                itemBuilder: (BuildContext context, int index) {
                  return Image.network(
                    Get.arguments['images'][index],
                    fit: BoxFit.cover,
                  );
                },
                itemCount: Get.arguments['images']!.length,
                // 分页
                pagination: const SwiperPagination(),
                // control: SwiperControl(),
              ),
            ),
            SizedBox(
              height: 10.h,
            ),
            Card(
              child: Padding(
                padding: EdgeInsets.all(10.w),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Get.arguments['price'] != null ?
                    Text(
                      '${I18nContent.UNIT.tr} ${isUs ? (Get.arguments['price'] / 7.24).toStringAsFixed(2) : Get.arguments['price']}',
                      style: TextStyle(
                          color: Colors.red,
                          fontWeight: FontWeight.bold,
                          fontSize: 26.sp),
                    ) : const Text(""),
                    Text(
                      Get.arguments['title'],
                      style: TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 26.sp),
                    ),
                    Text(
                      Get.arguments['describe'],
                    ),
                    SizedBox(
                      height: 10.h,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            CircleAvatar(
                              backgroundImage: Get.arguments['avatar'].isEmpty
                                  ? const AssetImage('assets/images/avatar.png')
                                      as ImageProvider
                                  : NetworkImage(Get.arguments['avatar']),
                            ),
                            SizedBox(
                              width: 5.w,
                            ),
                            Text(Get.arguments['userName'])
                          ],
                        ),
                        ElevatedButton(
                            onPressed: () {},
                            child: Text(I18nContent.ATTENTION.tr))
                      ],
                    )
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 10.h,
            ),
            false
                ? Card(
                    child: Container(
                      padding: EdgeInsets.symmetric(
                          horizontal: 10.w, vertical: 10.h),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('2条留言'),
                          SizedBox(
                            height: 10.h,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Row(
                                children: [
                                  CircleAvatar(
                                    backgroundImage: NetworkImage(
                                        'https://ts3.cn.mm.bing.net/th?id=ORMS.becf43acdce32d195dc2a5ef7ff27523&pid=Wdp&w=300&h=156&qlt=90&c=1&rs=1&dpr=1.25&p=0'),
                                  ),
                                  SizedBox(
                                    width: 5.w,
                                  ),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      // userName
                                      Text('dsadsadsa'),
                                      SizedBox(
                                        height: 5.h,
                                      ),
                                      Text('dasdasdasdasd'),
                                    ],
                                  ),
                                ],
                              ),
                              const Icon(Icons.thumb_up_off_alt)
                            ],
                          )
                        ],
                      ),
                    ),
                  )
                : const Text('')
          ],
        ),
      ),
      bottomNavigationBar: IntrinsicHeight(
        child: Container(
          width: double.infinity,
          padding: EdgeInsets.symmetric(
            horizontal: 10.w,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const Icon(Icons.textsms),
                      Text('0', style: TextStyle(fontSize: 12.sp))
                    ],
                  ),
                  SizedBox(
                    width: 10.w,
                  ),
                  Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const Icon(Icons.star_outline),
                      Text('0', style: TextStyle(fontSize: 12.sp))
                    ],
                  )
                ],
              ),
              Flexible(
                  child: ElevatedButton(
                      onPressed: () {
                        Get.toNamed(Routes.CHAT,arguments: {
                          'avatar' : Get.arguments['avatar'],
                          'userName' : Get.arguments['userName'],
                        });
                      },
                      child: Text(I18nContent.PRIVATELETTER.tr,
                          style: TextStyle(fontSize: 12.sp)))),
            ],
          ),
        ),
      ),
    );
  }
}
