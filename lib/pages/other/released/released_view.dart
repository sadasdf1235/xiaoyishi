import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../controllers/other/released_controller.dart';
import '../../../constants/I18n_content.dart';
import '../../../widgets/empty_status.dart';

class ReleasedView extends StatelessWidget {
  const ReleasedView({super.key});
  Widget waterCard(double item) {
    return Container(
      height: item,
      decoration: BoxDecoration(
          border: Border.all(color: Colors.yellow, width: 1),
          borderRadius: BorderRadius.circular(10)),
      child: Center(
        child: Text(item.toStringAsFixed(0)),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    ReleasedController controller = Get.put(ReleasedController());
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Get.back();
          },
          icon: const Icon(Icons.arrow_back_ios),
        ),
        title: Text(I18nContent.POSTED.tr),
      ),
      body: controller.releasedList.isNotEmpty
          ? const Center(
              child: Text('我发布的'),
            )
          : EmptyStatus(
              img: 'assets/images/missing.png',
              title: I18nContent.NORELEASED.tr,
              des: I18nContent.NORELEASEDHINT.tr),
    );
  }
}
