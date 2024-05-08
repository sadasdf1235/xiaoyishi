import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../controllers/other/collect_controller.dart';
import '../../../constants/I18n_content.dart';
import '../../../constants/common_colors.dart';
import '../../../widgets/space_around.dart';
import '../../../widgets/empty_status.dart';

class CollectView extends GetView<CollectController> {
  const CollectView({super.key});
  Widget _collectItem(
      String title, double price, int collectNum, String userName) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Flexible(
          flex: 1,
          child: Image.network(
            'https://ts4.cn.mm.bing.net/th?id=ORMS.ac019718083042ab8aa8fca020cb844a&pid=Wdp&w=300&h=156&qlt=90&c=1&rs=1&dpr=1.25&p=0',
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
                      child: const CircleAvatar(
                        backgroundImage: NetworkImage(
                            'https://ts4.cn.mm.bing.net/th?id=ORMS.3af8d76331742cd252fee1303325377e&pid=Wdp&w=612&h=304&qlt=90&c=1&rs=1&dpr=1.25&p=0'),
                      ),
                    ),
                    Text(userName)
                  ],
                )
              ],
            ),
          ),
        )
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    CollectController controller = Get.put(CollectController());
    return DefaultTabController(
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
              ),
            ),
          ),
        ),
        body: controller.collectList.isNotEmpty ? TabBarView(children: [
          ListView.builder(
            itemCount: 10,
            itemBuilder: (context, index) {
              return Padding(
                padding: EdgeInsets.only(top: 10.h),
                child: _collectItem('dasdasdasd', 20, 54, 'sdaad'),
              );
            },
          ),
        ]) : EmptyStatus(
            img: 'assets/images/no_matches.png',
            title: I18nContent.NOCOLLECT.tr,
            des: ''),
      ),
    );
  }
}
