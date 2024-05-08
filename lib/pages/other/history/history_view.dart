import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

import '../../../controllers/other/history_controller.dart';
import '../../../constants/I18n_content.dart';
import '../../../widgets/empty_status.dart';

class HistoryView extends StatelessWidget {
  const HistoryView({super.key});

  @override
  Widget build(BuildContext context) {
    HistoryController controller = Get.put(HistoryController());
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Get.back();
          },
          icon: const Icon(Icons.arrow_back_ios),
        ),
        title: Text(I18nContent.HISTORY.tr),
      ),
      body: controller.historyList.isNotEmpty ? MasonryGridView.count(
          crossAxisCount: 3, // 几列
          mainAxisSpacing: 20.w, // 间距
          crossAxisSpacing: 10.h,
          itemCount: 10,
          shrinkWrap: true, // 是否收缩
          // physics: const NeverScrollableScrollPhysics(), // 禁止左右滑动
          itemBuilder: (context, index) {
            return Card(
              child: Column(
                children: [
                  Image.network('https://ts1.cn.mm.bing.net/th?id=ORMS.dbf8bfe141597e59e4c93c45fb903aa9&pid=Wdp&w=612&h=304&qlt=90&c=1&rs=1&dpr=1.25&p=0'),
                  const Text('${I18nContent.UNIT} 9999')
                ],
              ),
            );
          }) : EmptyStatus(
          img: 'assets/images/no_matches.png',
          title: I18nContent.NOHISTORY.tr,
          des: ''),
    );
  }
}
