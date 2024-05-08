import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../controllers/other/sold_controller.dart';
import '../../../constants/I18n_content.dart';
import '../../../widgets/space_around.dart';
import '../../../widgets/order_item.dart';
import '../../../widgets/empty_status.dart';

class SoldView extends StatelessWidget {
  const SoldView({super.key});

  @override
  Widget build(BuildContext context) {
    SoldController controller = Get.put(SoldController());
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Get.back();
          },
          icon: const Icon(Icons.navigate_before),
        ),
        title: Text(I18nContent.SOLD.tr),
      ),
      body: controller.soldList.isNotEmpty
          ? ListView.builder(
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
            )
          : EmptyStatus(
              img: 'assets/images/no_wallet.png',
              title: I18nContent.NOSOLD.tr,
              des: I18nContent.NOSOLDHINT.tr),
    );
  }
}
