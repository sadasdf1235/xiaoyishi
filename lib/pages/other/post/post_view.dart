import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

import '../../../controllers/other/post_controller.dart';
import '../../../constants/I18n_content.dart';
import '../../../widgets/empty_status.dart';

class PostView extends StatelessWidget {
  const PostView({super.key});

  @override
  Widget build(BuildContext context) {
    PostController controller = Get.put(PostController());
    return Scaffold(
        appBar: AppBar(
          leading: IconButton(
              onPressed: () {Get.back();}, icon: const Icon(Icons.arrow_back_ios)),
          title: Text(I18nContent.POST.tr),
        ),
        body: controller.postList.isNotEmpty ? MasonryGridView.count(
            crossAxisCount: 2, // 几列
            mainAxisSpacing: 20, // 间距
            crossAxisSpacing: 10,
            itemCount: 100,
            shrinkWrap: true, // 是否收缩
            // physics: const NeverScrollableScrollPhysics(), // 禁止左右滑动
            itemBuilder: (context, index) {
              return Column(
                  children: [
                    Image.network('https://ts1.cn.mm.bing.net/th?id=ORMS.c952ae66f14db89135a2b4562fe06832&pid=Wdp&w=300&h=156&qlt=90&c=1&rs=1&dpr=1.25&p=0',fit: BoxFit.cover,),
                    Text('1321313123131')
                  ],
              );
            }) : EmptyStatus(
            img: 'assets/images/no_matches.png',
            title: I18nContent.NOPOST.tr,
            des: ''),);
  }
}
