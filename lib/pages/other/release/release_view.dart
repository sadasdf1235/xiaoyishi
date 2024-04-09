import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../widgets/space_around.dart';
import '../../../constants/I18n_content.dart';
import '../../../constants/common_colors.dart';
import '../../../controllers/other/release_idle_controller.dart';
import '../../../controllers/home_controller.dart';
import '../../../extension/throttle_extension.dart';
import '../../../constants/common_colors.dart';

class ReleaseView extends GetView<ReleaseIdleController> {
  const ReleaseView({super.key});

  @override
  Widget build(BuildContext context) {
    final HomeController homeController = Get.find();
    final ReleaseIdleController controller = Get.put(ReleaseIdleController());
    return Scaffold(
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
            onPressed: () {},
            child: Text(I18nContent.RELEASE.tr),
          ),
        ],
      ),
      body: Container(
        padding: EdgeInsets.all(16.w),
        child: Obx(
          () => Column(
            children: [
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
              SizedBox(
                height: 300.h,
                child: Card(
                  child: Container(
                    padding: EdgeInsets.all(10.w),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SizedBox(
                          width: (350 - 10 * 2 - 16 * 2).w,
                          // height: 100.h,
                          child: TextField(
                            controller: controller.textEditingController,
                            maxLines: 5,
                            minLines: 1,
                            cursorColor: CommonColors.themeColor,
                            decoration: InputDecoration(
                              hintText: I18nContent.ARTICLEINTRODUCTION.tr,
                              border: InputBorder.none,
                              suffixIcon: controller.describe.value.isNotEmpty
                                  ? IconButton(
                                      onPressed: () {
                                        controller.cleanInput();
                                      },
                                      icon: const Icon(Icons.close))
                                  : const Text(''),
                            ),
                            onChanged: (value) {
                              controller.updateDescribe(value);
                            }.throttleValue(500),
                            onSubmitted: (value) {
                              controller.updateDescribe(value);
                            },
                          ),
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            // 图片上传
                            IconButton(
                              iconSize: 80.w,
                              onPressed: () {},
                              icon: const Icon(
                                Icons.image,
                                color: Colors.grey,
                              ),
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
                                    homeController.location.value == '' ? I18nContent.ERRORLOCATION.tr : homeController.location.value,
                                    style: const TextStyle(
                                      color: Colors.black38,
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
