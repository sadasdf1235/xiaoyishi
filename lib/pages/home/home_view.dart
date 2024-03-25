import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

import '../../widgets/ld_icon.dart';
import '../../controllers/home_controller.dart';
import '../../constants/I18n_content.dart';
import '../../constants/common_colors.dart';
import '../../widgets/space_around.dart';

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
                              onPressed: () {},
                              icon: const Icon(
                                Icons.location_pin,
                                color: CommonColors.themeColor,
                              )),
                          // TODO
                          const Text("贵州师范大学")
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
              Text(
                "您想要的，这里都有",
                style: TextStyle(
                    fontSize: 36.sp, color: Colors.white, fontFamily: 'k2d'),
              ),
            ],
          ),
          Positioned(
            bottom: 10.h,
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
          )
        ],
      ),
    );
  }

  Widget _categoryItem(Icon icon, String title) {
    return Container(
      alignment: Alignment.center,
      padding: EdgeInsets.symmetric(horizontal: 17.w, vertical: 0),
      child: Column(
        children: [
          icon,
          SizedBox(
            height: 10.h,
          ),
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
      height: 156.h,
      padding: EdgeInsets.symmetric(horizontal: 16.w),
      child: GridView.count(
        crossAxisCount: 4,
        crossAxisSpacing: 0,
        childAspectRatio: 1,
        physics: const NeverScrollableScrollPhysics(),
        children: [
          _categoryItem(
              Icon(
                LdIcon.phone,
                color: CommonColors.themeColor,
              ),
              '手机'),
          _categoryItem(
              Icon(
                LdIcon.phone,
                color: CommonColors.themeColor,
              ),
              '手机'),
          _categoryItem(
              Icon(
                LdIcon.phone,
                color: CommonColors.themeColor,
              ),
              '手机'),
          _categoryItem(
              Icon(
                LdIcon.phone,
                color: CommonColors.themeColor,
              ),
              '手机'),
          _categoryItem(
              Icon(
                LdIcon.phone,
                color: CommonColors.themeColor,
              ),
              '手机'),
          _categoryItem(
              Icon(
                LdIcon.phone,
                color: CommonColors.themeColor,
              ),
              '手机'),
          _categoryItem(
              Icon(
                LdIcon.phone,
                color: CommonColors.themeColor,
              ),
              '手机'),
          _categoryItem(
              Icon(
                LdIcon.package,
                color: CommonColors.themeColor,
              ),
              '手机'),
        ],
      ),
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
  Widget _commodity() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Image.network(
          "https://fastcdn.hoyoverse.com/content-v2/hk4e/122892/133ba31bce0ff2577de049e395ebfc5c_683894240453798045.jpg",
          fit: BoxFit.cover,
        ),
        SizedBox(
          height: 10.h,
        ),
        Text(
          "15km",
          style: TextStyle(
            fontSize: 12.sp,
          ),
        ),
        Text(
          '女大学生自用',
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
            Text("4.9"),
            SizedBox(
              width: 8.w,
            ),
            Text("200"),
            const Text("+收藏")
          ],
        )
      ],
    );
  }

  /// 商品列表
  Widget _productList() {
    return MasonryGridView.count(
      padding: EdgeInsets.fromLTRB(16.w, 0, 16.w, 16.h),
      itemCount: 10,
      crossAxisCount: 2,
      mainAxisSpacing: 16.w,
      crossAxisSpacing: 10.h,
      shrinkWrap: true, // 添加这一行以确保网格视图的高度能够根据内容自适应
      physics: const NeverScrollableScrollPhysics(), // 禁用滚动，因为它将放在一个滚动的列表视图中
      itemBuilder: (context,index){
        return _commodity();
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
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
      ),
    );
  }
}
