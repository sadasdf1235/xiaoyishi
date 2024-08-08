import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:xiaoyishi/models/category/CategoryModel.dart';

import '../../../controllers/other/category_controller.dart';
import '../../../routes/app_routes.dart';

class CategoryView extends GetView<CategoryController> {
  const CategoryView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: _appBar(),
        body: Obx(
          () => Row(
            children: [firstCategory(), secondCategory()],
          ),
        ));
  }

  PreferredSizeWidget _appBar() {
    return AppBar(
      title: InkWell(
        onTap: () => Get.toNamed(Routes.SEARCH),
        child: Container(
          width: 318.w,
          height: 52.h,
          decoration: BoxDecoration(
            color: Colors.grey[200],
            borderRadius: BorderRadius.circular(30),
          ),
          child: Padding(
            padding: EdgeInsets.all(5.w),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    const Icon(Icons.search),
                    SizedBox(
                      width: 10.w,
                    ),
                    Text(
                      "搜索",
                      style: TextStyle(fontSize: 14.sp),
                    )
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
      backgroundColor: Colors.white,
      actions: const [
        Icon(
          Icons.message_outlined,
          color: Colors.black54,
        )
      ],
      centerTitle: true,
      elevation: 0,
    );
  }

  Widget firstCategory() {
    return SizedBox(
      width: 90.w,
      height: double.infinity,
      child: ListView.builder(
          itemCount: controller.categoryList.length,
          itemBuilder: (ctx, index) {
            return InkWell(
              onTap: () => controller.changeSelectIndex(index),
              child: SizedBox(
                width: double.infinity,
                height: 50.h,
                child: Stack(
                  children: [
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Container(
                        width: 5.w,
                        height: 40.h,
                        color: controller.selectIndex.value == index
                            ? Colors.orange
                            : Colors.white,
                      ),
                    ),
                    Center(
                      child: Text(
                        controller.categoryList.value[index].name,
                        style: TextStyle(
                          fontSize: 16.sp,
                          fontWeight: controller.selectIndex.value == index
                              ? FontWeight.bold
                              : FontWeight.normal,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            );
          }),
    );
  }

  Widget secondCategory() {
    List<CategoryModel> e = controller.secCategoryList.value;
    return Expanded(
        child: Container(
      padding: EdgeInsets.symmetric(vertical: 10.h, horizontal: 10.w),
      height: double.infinity,
      child: GridView.builder(
        itemCount: e.length,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3,
            crossAxisSpacing: 20.w,
            mainAxisSpacing: 10.h,
            childAspectRatio: 240 / 340),
        itemBuilder: (ctx, index) {
          return InkWell(
            onTap: () => Get.toNamed(Routes.PRODUCT_DETAIL, arguments: {}),
            child: Column(
              children: [
                Container(
                  alignment: Alignment.center,
                  width: double.infinity,
                  child: Image.network(
                    'https://images.unsplash.com/photo-1636678374833-c8afb2e0167d?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&ixid=M3wyMDg4MDd8MHwxfHNlYXJjaHw1fHx3YWxsYXBlcnxlbnwwfHx8fDE3MjMxMDgyNTB8MA&ixlib=rb-4.0.3&q=80&w=1080',
                    fit: BoxFit.fitHeight,
                  ),
                ),
                SizedBox(
                  height: 10.h,
                ),
                Text(
                  e[index].name,
                  style: TextStyle(
                    fontSize: 12.sp,
                  ),
                )
              ],
            ),
          );
        },
      ),
    ));
  }
}
