import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

import '../../widgets/ld_icon.dart';
import '../../controllers/home_controller.dart';
import '../../constants/I18n_content.dart';
import '../../constants/common_colors.dart';
import '../../widgets/space_around.dart';
import '../../extension/throttle_extension.dart';
import '../../routes/app_routes.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({super.key});

  Widget _top() {
    return Container(
      decoration: BoxDecoration(
          color: CommonColors.themeColor,
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(20.r),
            bottomRight: Radius.circular(20.r),
          )),
      width: double.infinity,
      height: 300.h,
      padding: EdgeInsets.fromLTRB(16.w, 10.h, 16.w, 0),
      child: Stack(
        children: [
          Column(
            children: [
              SpaceAround(
                color: CommonColors.themeColor,
                height: 60.h,
                leftChild: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      I18nContent.LOCATION.tr,
                      style: TextStyle(color: Colors.white, fontSize: 12.sp),
                    ),
                    SizedBox(
                      height: 8.h,
                    ),
                    Container(
                      alignment: Alignment.center,
                      width: 170.w,
                      height: 32.h,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(1000.r),
                        color: Colors.white,
                      ),
                      child: Row(
                        children: [
                          IconButton(
                              onPressed: () {
                                controller.getLocation();
                              }.throttle(),
                              icon: const Icon(
                                Icons.location_pin,
                                color: CommonColors.themeColor,
                              )),
                          //
                          Expanded(
                              child: Text(
                            controller.location.value == ''
                                ? I18nContent.ERRORLOCATION.tr
                                : controller.location.value,
                          ))
                        ],
                      ),
                    )
                  ],
                ),
                rightChild: Container(
                  width: 48.w,
                  height: 48.h,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(48.r)),
                    color: Colors.white,
                  ),
                  child: const Icon(
                    Icons.notifications,
                    color: CommonColors.themeColor,
                  ),
                ),
              ),
              SizedBox(
                height: 10.h,
              ),

              /// 宣传语
              Text(
                I18nContent.TAGLINE.tr,
                style: TextStyle(
                    fontSize: 36.sp, color: Colors.white, fontFamily: 'k2d'),
              ),
            ],
          ),
          Positioned(
            bottom: 10.h,
            child: InkWell(
              onTap: (){
                Get.toNamed(Routes.SEARCH);
              },
              child: Container(
                width: 318.w,
                height: 52.h,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(1000.r),
                  color: Colors.white,
                ),
                child: Row(
                  children: [
                    SizedBox(
                      width: 25.w,
                    ),
                    const Icon(
                      Icons.search,
                      color: CommonColors.unimportanceColor,
                    ),
                    SizedBox(
                      width: 20.w,
                    ),
                    Text(
                      (I18nContent.SEARCHFAVORITES.tr),
                      style:
                          const TextStyle(color: CommonColors.unimportanceColor),
                    )
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }

  PreferredSizeWidget _appBar() {
    return PreferredSize(
        preferredSize: Size.fromHeight(300.h),
        child: AppBar(
          backgroundColor: CommonColors.themeColor, // AppBar 背景颜色
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(20.r),
              bottomRight: Radius.circular(20.r),
            ),
          ),
          leading: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                I18nContent.LOCATION.tr,
                style: TextStyle(color: Colors.white, fontSize: 12.sp),
              ),
              SizedBox(height: 8.h),
              Container(
                alignment: Alignment.center,
                width: 170.w,
                height: 32.h,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(1000.r),
                  color: Colors.white,
                ),
                child: Row(
                  children: [
                    IconButton(
                      onPressed: () {
                        controller.getLocation();
                      }.throttle(),
                      icon: const Icon(
                        Icons.location_pin,
                        color: CommonColors.themeColor,
                      ),
                    ),
                    Expanded(child: Obx(() => Text(controller.location.value))),
                  ],
                ),
              ),
            ],
          ),
          actions: [
            Container(
              width: 48.w,
              height: 48.h,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(48.r)),
                color: Colors.white,
              ),
              child: const Icon(
                Icons.notifications,
                color: CommonColors.themeColor,
              ),
            ),
          ],

          /// 宣传语1
          flexibleSpace: Text(
            I18nContent.TAGLINE.tr,
            style: TextStyle(
                fontSize: 36.sp, color: Colors.white, fontFamily: 'k2d'),
          ),
          bottom: PreferredSize(
            preferredSize: Size.fromHeight(52.h),
            child: Padding(
              padding: EdgeInsets.only(bottom: 10.h),
              child: Container(
                width: 318.w,
                height: 52.h,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(1000.r),
                  color: Colors.white,
                ),
                child: Row(
                  children: [
                    SizedBox(width: 25.w),
                    Icon(
                      Icons.search,
                      color: CommonColors.unimportanceColor,
                    ),
                    SizedBox(width: 20.w),
                    Text(
                      I18nContent.SEARCHFAVORITES.tr,
                      style: TextStyle(color: CommonColors.unimportanceColor),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ));
  }

  Widget _categoryItem({
    String imgUrl = '',
    required Icon icon,
    required String title,
  }) {
    return Container(
      alignment: Alignment.center,
      padding: EdgeInsets.symmetric(horizontal: 17.w, vertical: 0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          imgUrl.isEmpty
              ? icon
              : SizedBox(
                  width: 46.w,
                  height: 46.w,
                  child: Image.asset(
                    imgUrl,
                    fit: BoxFit.cover,
                  ),
                ),
          // SizedBox(
          //   height: 10.h,
          // ),
          Text(
            title,
            style: TextStyle(fontSize: 11.sp, fontWeight: FontWeight.bold),
          )
        ],
      ),
    );
  }

  /// 分类列表
  Widget _category() {
    return Container(
      width: double.infinity,
      height: 160.h,
      padding: EdgeInsets.symmetric(horizontal: 16.w),
      child: GridView.count(
          crossAxisCount: 4,
          crossAxisSpacing: 0,
          childAspectRatio: 1,
          physics: const NeverScrollableScrollPhysics(),
          children: List.generate(8, (index) {
            var e = controller.categoryList[index];
            if (index == 7) {
              return _categoryItem(
                  icon: Icon(
                    Icons.view_cozy,
                    size: 46.w,
                    color: CommonColors.themeColor,
                  ),
                  title: I18nContent.ALL.tr);
            }
            return _categoryItem(
                icon: const Icon(Icons.add),
                imgUrl: e['images'],
                title: e['name']);
          })),
    );
  }

  ///  猜你喜欢
  Widget _favorite() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 17.h),
      child: SpaceAround(
          leftChild: Text(
            I18nContent.GUESSLIKE.tr,
            style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 16.sp,
                color: Colors.black),
          ),
          rightChild: Text(
            I18nContent.SEEALL.tr,
            style: TextStyle(fontSize: 12.sp, color: CommonColors.themeColor),
          ),
          height: 20.h),
    );
  }

  /// 单个商品
  Widget _commodity(
      {required String imgUrl,
      required String title,
        required double price,
      double distance = 0,
      double score = 0,
      double collectNum = 0}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Image.network(
          imgUrl,
          fit: BoxFit.cover,
        ),
        SizedBox(
          height: 10.h,
        ),
        distance == 0
            ? const Text('')
            : Text(
                '$distance',
                style: TextStyle(
                  fontSize: 12.sp,
                ),
              ),
        Text(
          title,
          style: TextStyle(
              fontSize: 13.sp,
              color: Colors.black,
              fontWeight: FontWeight.bold),
          maxLines: 2,
          overflow: TextOverflow.ellipsis,
        ),
        Row(
          children: [
            const Icon(
              Icons.star,
              color: Color(0xFFEC6400),
            ),
            Text('${score == 0 ? '' : score}'),
            SizedBox(
              width: 8.w,
            ),
            collectNum == 0
                ? const Text('')
                : Text('$collectNum ${I18nContent.COLLECT.tr}'),
            Text('${I18nContent.UNIT.tr} $price',style: const TextStyle(color: Colors.red,fontWeight: FontWeight.bold),)
          ],
        )
      ],
    );
  }

  /// 商品列表
  Widget _productList() {
    return MasonryGridView.count(
      padding: EdgeInsets.fromLTRB(16.w, 0, 16.w, 16.h),
      itemCount: controller.productList.length,
      crossAxisCount: 2,
      mainAxisSpacing: 16.w,
      crossAxisSpacing: 10.h,
      shrinkWrap: true, // 添加这一行以确保网格视图的高度能够根据内容自适应
      physics: const NeverScrollableScrollPhysics(), // 禁用滚动，因为它将放在一个滚动的列表视图中
      itemBuilder: (context, index) {
        var e = controller.productList[index];
        return _commodity(
          imgUrl: e['image'],
          title: e['title'],
          price: double.parse(e['price']),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: _appBar(),
      body: Obx(() => ListView(
            controller: controller.scrollController,
            children: [
              _top(),
              SizedBox(
                height: 33.h,
              ),
              //  分类
              _category(),
              // 猜你喜欢
              _favorite(),
              // 商品列表
              _productList(),
            ],
          )),
    );
  }
}
