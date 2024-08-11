import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../widgets/space_around.dart';
import '../../../constants/I18n_content.dart';
import '../../../constants/common_colors.dart';
import '../../../controllers/other/release_idle_controller.dart';
import '../../../controllers/home_controller.dart';
import '../../../extension/throttle_extension.dart';

class ReleaseView extends GetView<ReleaseIdleController> {
  const ReleaseView({super.key});

  @override
  Widget build(BuildContext context) {
    final HomeController homeController = Get.find();
    final ReleaseIdleController controller = Get.put(ReleaseIdleController());

    return Scaffold(
      resizeToAvoidBottomInset: true,
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Get.back();
          },
          icon: const Icon(Icons.close),
        ),
        title: Text(I18nContent.RELEASEIDLE.tr),
        actions: [
          ElevatedButton(
            onPressed: ()=>controller.addCommodity(),
            child: Text(I18nContent.RELEASE.tr),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.all(16.w),
          child: Obx(
            () => Column(
              children: [
                // Title
                Card(
                  child: TextField(
                    controller: controller.textEditingControllerTitle,
                    cursorColor: CommonColors.themeColor,
                    maxLines: 1,
                    decoration: InputDecoration(
                      hintText: I18nContent.INPUTTITLE.tr,
                      border: InputBorder.none,
                      counterText: '',
                      contentPadding:
                          EdgeInsets.symmetric(horizontal: 20.w, vertical: 5.h),
                      suffixIcon: controller.title.isNotEmpty
                          ? IconButton(
                              onPressed: () {
                                controller.cleanTitleInput();
                              },
                              icon: const Icon(Icons.close))
                          : const Text(''),
                    ),
                    onChanged: (value) {
                      controller.updateTitle(value);
                    }.throttleValue(500),
                    onSubmitted: (value) {
                      controller.updateTitle(value);
                    },
                  ),
                ),
                SizedBox(
                  height: 8.h,
                ),
                // Price
                Card(
                  child: SpaceAround(
                    left: 10.w,
                    right: 10.w,
                    leftChild: Text(
                      I18nContent.PRICE.tr,
                      style: const TextStyle(fontWeight: FontWeight.bold),
                    ),
                    rightChild: Row(
                      children: [
                        Text(
                          I18nContent.UNIT.tr,
                          style: const TextStyle(
                              color: Colors.red, fontWeight: FontWeight.bold),
                        ),
                        SizedBox(
                          width: 5.w,
                        ),
                        // 价格
                        IntrinsicWidth(
                          child: TextField(
                            keyboardType: TextInputType.number,
                            cursorColor: CommonColors.themeColor,
                            maxLength: 7,
                            maxLines: 1,
                            decoration: InputDecoration(
                              hintText: I18nContent.DEFAULTNUM.tr,
                              border: InputBorder.none,
                              counterText: '',
                            ),
                            onChanged: (value) {},
                            onSubmitted: (value) {
                              controller.updatePrice(value);
                            },
                          ),
                        ),
                      ],
                    ),
                    height: 40.h,
                  ),
                ),
                SizedBox(
                  height: 16.h,
                ),
                Card(
                  child: Container(
                    padding: EdgeInsets.all(10.w),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        // Describe
                        SizedBox(
                          width: (350 - 10 * 2 - 16 * 2).w,
                          child: TextField(
                            controller: controller.textEditingController,
                            maxLines: 5,
                            minLines: 1,
                            cursorColor: CommonColors.themeColor,
                            decoration: InputDecoration(
                              hintText: I18nContent.ARTICLEINTRODUCTION.tr,
                              border: InputBorder.none,
                              suffixIcon:
                                  controller.price.value != null
                                      ? IconButton(
                                          onPressed: () {
                                            controller.cleanInput();
                                          },
                                          icon: const Icon(Icons.close))
                                      : const Text(''),
                            ),
                            onChanged: (value) {
                              controller.updateDescription(value);
                            }.throttleValue(500),
                            onSubmitted: (value) {
                              controller.updateDescription(value);
                            },
                          ),
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            GridView.count(
                              crossAxisCount: 3,
                              mainAxisSpacing: 16.w,
                              crossAxisSpacing: 5.h,
                              shrinkWrap: true, // 添加这一行以确保网格视图的高度能够根据内容自适应
                              physics:
                                  const NeverScrollableScrollPhysics(), // 禁用滚动，因为它将放在一个滚动的列表视图中
                              children: [
                                if (controller.imageList.isNotEmpty)
                                  ...controller.imageList
                                      .map((image) => Image.network(
                                            image,
                                            width: 80.w,
                                            height: 80.w,
                                            fit: BoxFit.cover,
                                          ))
                                      .toList(),
                                // 图片上传
                                IconButton(
                                  iconSize: 80.w,
                                  onPressed: () {
                                    controller.selectMultiImage();
                                  },
                                  icon: const Icon(
                                    Icons.image,
                                    color: Colors.grey,
                                  ),
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                // 重新获取定位 （后续升级为：给地图，用户选择点？）
                                // 重新获取定位
                                IconButton(
                                  icon: const Icon(
                                    Icons.location_on,
                                    color: Colors.black38,
                                  ),
                                  onPressed: () {
                                    homeController.getLocation();
                                  },
                                ),
                                // SizedBox(
                                //   width: 5.w,
                                // ),
                                // 定位信息
                                Expanded(
                                  child: Text(
                                    homeController.location.value == ''
                                        ? I18nContent.ERRORLOCATION.tr
                                        : homeController.location.value,
                                    style: const TextStyle(
                                      color: Colors.black38,
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 16.h,
                        ),
                        // TODO 界面优化
                        InkWell(
                          onTap: () => controller.showPicker(context),
                          child: SpaceAround(
                              left: 10.w,
                              right: 10.w,
                              leftChild: const Text("分类"),
                              rightChild: Text(
                                  controller.category.value?.name ?? '请选择分类'),
                              height: 30.h),
                        ),
                        if (controller.category.value?.id != null)
                          InkWell(
                            onTap: () => controller.showSecPicker(context),
                            child: SpaceAround(
                                left: 10.w,
                                right: 10.w,
                                leftChild: const Text("二级分类"),
                                rightChild: Text(
                                    controller.secCategory.value.name ?? '请选择分类'),
                                height: 30.h),
                          ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
