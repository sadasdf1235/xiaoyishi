import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../models/commodity/CommodityModel.dart';
import '../../../controllers/other/collect_controller.dart';
import '../../../constants/I18n_content.dart';
import '../../../constants/common_colors.dart';
import '../../../widgets/empty_status.dart';
import '../../../models/collect/CollectModel.dart';

class CollectView extends GetView<CollectController> {
  const CollectView({super.key});
  Widget _collectItem(
      {required String title,
      double price = 0.00,
      int collectNum = 0,
      required String userName,
      required String image,
      required String avatar}) {
    return SizedBox(
      height: 100.h,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Flexible(
            flex: 1,
            child: Image.network(
              image,
            ),
          ),
          Flexible(
            flex: 2,
            child: Padding(
              padding: EdgeInsets.only(left: 10.w),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: const TextStyle(fontWeight: FontWeight.bold),
                    overflow: TextOverflow.ellipsis,
                  ),
                  if (price > 0)
                    RichText(
                      text: TextSpan(children: [
                        TextSpan(
                          text: '${I18nContent.PRICE.tr} $price',
                          style: const TextStyle(color: Colors.red),
                        ),
                        TextSpan(
                            text: '  $collectNum ${I18nContent.COLLECT.tr}',
                            style: const TextStyle(color: Colors.grey))
                      ]),
                    ),
                  Row(
                    children: [
                      SizedBox(
                        width: 10.w,
                        height: 10.w,
                        child: CircleAvatar(
                          backgroundImage: NetworkImage(avatar),
                        ),
                      ),
                      SizedBox(
                        width: 10.w,
                      ),
                      Text(userName)
                    ],
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget _collectAllItem(CollectModel collect) {
    return Container(
      height: 100.h,
      color: Colors.white,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          // 图片
          Flexible(
            flex: 1,
            child: Container(
              margin: EdgeInsets.symmetric(vertical: 0, horizontal: 10.w),
              decoration: BoxDecoration(
                border: Border.all(color: Colors.black12)
              ),
              child: collect.images != null
                  ? Image.network(
                collect.images![0],
              )
                  : const Text(""),
            ),
          ),
          Flexible(
            flex: 2,
            child: Padding(
              padding: EdgeInsets.only(left: 10.w),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // title
                  Text(
                    collect.title ?? '',
                    style: const TextStyle(fontWeight: FontWeight.bold),
                    overflow: TextOverflow.ellipsis,
                  ),
                  // 价格和收藏展示
                  if (collect.type > 0)
                    Row(
                      children: [
                        Text(
                          '${I18nContent.PRICE.tr} ${collect.price}',
                          style: const TextStyle(color: Colors.red),
                        ),
                        SizedBox(width: 10.w), // 间距
                        Text(
                          ' 0 ${I18nContent.COLLECT.tr}',
                          style: const TextStyle(color: Colors.grey),
                        ),
                      ],
                    ),
                  // userInfo
                  Row(
                    children: [
                      SizedBox(
                        width: 10.w,
                        height: 10.w,
                        child: CircleAvatar(
                          backgroundImage: NetworkImage(collect.avatar ?? ''),
                        ),
                      ),
                      SizedBox(
                        width: 10.w,
                      ),
                      Text(collect.username ?? '')
                    ],
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    CollectController controller = Get.put(CollectController());
    return Obx(() => DefaultTabController(
        length: controller.tabs.length,
        child: Scaffold(
          appBar: AppBar(
            leading: IconButton(
                onPressed: () {
                  Get.back();
                },
                icon: const Icon(Icons.arrow_back_ios)),
            title: Text(I18nContent.COLLECT.tr),
            bottom: PreferredSize(
              preferredSize: Size.fromHeight(50.h),
              child: Container(
                alignment: Alignment.centerLeft,
                child: TabBar(
                  indicatorColor: CommonColors.themeColor,
                  indicatorWeight: 1,
                  indicatorSize: TabBarIndicatorSize.label,
                  labelColor: Colors.black,
                  labelStyle:
                      TextStyle(fontSize: 25.sp, fontWeight: FontWeight.bold),
                  unselectedLabelColor: Colors.grey,
                  unselectedLabelStyle: TextStyle(fontSize: 16.sp),
                  isScrollable: true,
                  dividerHeight: 0,
                  tabAlignment: TabAlignment.start,
                  tabs: List.generate(
                      controller.tabs.length,
                      (index) => Tab(
                            text: controller.tabs[index],
                          )),
                  onTap: (index) {
                    controller.tabChange(index);
                  },
                ),
              ),
            ),
          ),
          body: TabBarView(
              children: controller.tabs.map<Widget>((tab) {
            final list = tab == I18nContent.ALL.tr
                ? controller.collectList
                : tab == I18nContent.COMMODITY.tr
                    ? controller.collectList.where((e)=>e.type==1).toList()
                    : controller.collectList.where((e)=>e.type==2).toList();
            return list.isNotEmpty
                ? ListView.builder(
                    itemCount: list.length,
                    itemBuilder: (context, index) {
                      CollectModel e = list[index];
                      return Padding(
                        padding: EdgeInsets.only(
                            top: 10.0
                                .h), // 注意：确保 `.h` 是一个有效的单位，这通常是 Flutter 本地代码中的自定义扩展
                        child: _collectAllItem(e),
                      );
                    },
                  )
                : EmptyStatus(
                    img: 'assets/images/no_matches.png',
                    title: I18nContent.NOCOLLECT.tr,
                    des: '',
                  );
          }).toList()),
        )));
  }
}
