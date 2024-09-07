import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../controllers/other/purchased_controller.dart';
import '../../../constants/I18n_content.dart';
import '../../../constants/common_colors.dart';
import '../../../widgets/order_item.dart';
import '../../../widgets/empty_status.dart';

class PurchasedView extends StatelessWidget {
  const PurchasedView({super.key});

  @override
  Widget build(BuildContext context) {
    PurchasedController controller = Get.put(PurchasedController());
    // UserController userController = Get.find<UserController>();
    return DefaultTabController(
      length: controller.tabs.length,
      child: Scaffold(
        appBar: AppBar(
          leading: IconButton(
            onPressed: () {
              Get.back();
            },
            icon: const Icon(Icons.navigate_before),
          ),
          title: Text(I18nContent.POSTED.tr),
          bottom: TabBar(
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
                      ))),
        ),
        body: controller.orderList.isNotEmpty
            ? TabBarView(
                children: List.generate(
                    controller.tabs.length,
                    (index) => ListView.builder(
                          itemBuilder: (context, index) => OrderItem(
                              avatarUrl:
                                  'https://ts4.cn.mm.bing.net/th?id=ORMS.3af8d76331742cd252fee1303325377e&pid=Wdp&w=612&h=304&qlt=90&c=1&rs=1&dpr=1.25&p=0',
                              userName: 'dasda',
                              payStatus: '交易成功',
                              coverImaUrl:
                                  'https://ts4.cn.mm.bing.net/th?id=ORMS.2dfb39909aba12fd8b6924e6be5e2288&pid=Wdp&w=612&h=304&qlt=90&c=1&rs=1&dpr=1.25&p=0',
                              price: 23.5,
                              title: 'weqeqe',
                              leftBtnText: '联系买家',
                              rightBtnText: '去评价',
                              leftPressed: () {},
                              rightPressed: () {}),
                          itemCount: 10,
                        )),
              )
            : EmptyStatus(
                img: 'assets/images/no_purchased.png',
                title: I18nContent.NOPURCHASED.tr,
                des: I18nContent.NOPURCHASEDHINT.tr),
      ),
    );
  }
}
