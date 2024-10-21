import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:xiaoyishi/models/commodity/CommodityModel.dart';

import '../../../controllers/other/collect_controller.dart';
import '../../../constants/I18n_content.dart';
import '../../../constants/common_colors.dart';
import '../../../models/post/PostModel.dart';
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
                  if(price > 0)RichText(
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

  Widget _collectAllItem(CollectModel collect
      ) {
    return SizedBox(
      height: 100.h,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Flexible(
            flex: 1,
            child: Image.network(
              collect.images[0],
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
                    collect.title??'',
                    style: const TextStyle(fontWeight: FontWeight.bold),
                    overflow: TextOverflow.ellipsis,
                  ),
                  if(collect.type > 0)RichText(
                    text: TextSpan(children: [
                      TextSpan(
                        text: '${I18nContent.PRICE.tr} ${collect?.price}',
                        style: const TextStyle(color: Colors.red),
                      ),
                      TextSpan(
                          text: ' 0 ${I18nContent.COLLECT.tr}',
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
              children:[
                controller.commodityList.isNotEmpty ? ListView.builder(
                  itemCount: controller.commodityList.length,
                  itemBuilder: (context, index) {
                    CommodityModel e = controller.commodityList[index];
                    return Padding(
                      padding: EdgeInsets.only(top: 10.h),
                      child: _collectItem(title: e.title, price: e.price, userName: e.userName, image: e.images[0], avatar: e.avatar),
                    );
                  },
                ): EmptyStatus(
                    img: 'assets/images/no_matches.png',
                    title: I18nContent.NOCOLLECT.tr,
                    des: ''),
              ]
          ),
        ));
  }
}

Widget _oldCollList(){
  return Colunm(
      children: [
        controller.commodityList.isNotEmpty ? ListView.builder(
          itemCount: controller.commodityList.length,
          itemBuilder: (context, index) {
            CommodityModel e = controller.commodityList[index];
            return Padding(
              padding: EdgeInsets.only(top: 10.h),
              child: _collectItem(title: e.title, price: e.price, userName: e.userName, image: e.images[0], avatar: e.avatar),
            );
          },
        ): EmptyStatus(
            img: 'assets/images/no_matches.png',
            title: I18nContent.NOCOLLECT.tr,
            des: ''),
        controller.postList.isNotEmpty ? ListView.builder(
          itemCount: controller.postList.length,
          itemBuilder: (context, index) {
            PostModel e = controller.postList[index];
            return Padding(
              padding: EdgeInsets.only(top: 10.h),
              child: _collectItem(title: e.title, userName: e.userName, image: e.images[0], avatar: e.avatar),
            );
          },
        ): EmptyStatus(
            img: 'assets/images/no_matches.png',
            title: I18nContent.NOCOLLECT.tr,
            des: ''),
      ])
  )
}
