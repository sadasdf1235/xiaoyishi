import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../widgets/ld_icon.dart';
import '../../controllers/home_controller.dart';
import '../../constants/I18n_content.dart';
import '../../constants/common_colors.dart';
import '../../widgets/space_around.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({super.key});

  Widget _categoryItem(Icon icon,String title){
    return Container(
      alignment: Alignment.center,
      padding: EdgeInsets.symmetric(horizontal: 17.w,vertical: 0),
      child: Column(
        children: [
          icon,
          SizedBox(height: 10.h,),
          Text(title,style: TextStyle(fontSize: 11.sp,fontWeight: FontWeight.bold),)
        ],
      ),
    );
  }

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
                  SizedBox(width: 25.w,),
                  const Icon(Icons.search,color: CommonColors.unimportanceColor,),
                  SizedBox(width: 20.w,),
                  Text(
                    (I18nContent.SEARCHFAVORITES.tr),
                    style: const TextStyle(color: CommonColors.unimportanceColor),
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget _category(){
    return Container(
      width: double.infinity,
      height: 156.h,
      padding: EdgeInsets.symmetric(horizontal: 16.w),
      child: GridView.count(
        crossAxisCount: 4,
        crossAxisSpacing: 0,
        childAspectRatio: 1,
        children: [
          _categoryItem(Icon(LdIcon.phone,color: CommonColors.themeColor,), '手机'),
          _categoryItem(Icon(LdIcon.phone,color: CommonColors.themeColor,), '手机'),
          _categoryItem(Icon(LdIcon.phone,color: CommonColors.themeColor,), '手机'),
          _categoryItem(Icon(LdIcon.phone,color: CommonColors.themeColor,), '手机'),
          _categoryItem(Icon(LdIcon.phone,color: CommonColors.themeColor,), '手机'),
          _categoryItem(Icon(LdIcon.phone,color: CommonColors.themeColor,), '手机'),
          _categoryItem(Icon(LdIcon.phone,color: CommonColors.themeColor,), '手机'),
          _categoryItem(Icon(LdIcon.package,color: CommonColors.themeColor,), '手机'),
        ],
      ),
      );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          _top(),
          SizedBox(height: 33.h,),
          _category(),
        ],
      ),
    );
  }
}
