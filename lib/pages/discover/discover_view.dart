import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:xiaoyishi/constants/I18n_content.dart';

import '../../widgets/space_around.dart';

class DiscoverView extends GetView {
  const DiscoverView({super.key});

  Widget _card() {
    return Padding(
      padding: EdgeInsets.all(10.w),
      child: Card(
        child: Column(
          children: [
            SpaceAround(
                leftChild: Row(
                  children: [
                    ClipOval(
                      child: Image.network(
                        "https://c-ssl.dtstatic.com/uploads/blog/202208/01/20220801204303_cef03.thumb.400_0.jpeg",
                        fit: BoxFit.cover,
                        width: 50.w,
                        height: 50.h,
                      ),
                    ),
                    SizedBox(width: 5.w,),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        /// 用户名
                        Text("大佬"),
                        Row(
                          children: [
                            Text(I18nContent.PERSONTAG.tr),
                            SizedBox(
                              width: 10.w,
                            ),
                            /// 粉丝
                            Text("234粉丝"),
                          ],
                        )
                      ],
                    )
                  ],
                ),
                rightChild: ElevatedButton(
                  onPressed: () {},
                  child: Row(
                    children: [Icon(Icons.add,color: Colors.grey,), Text(I18nContent.ATTENTION.tr,style: TextStyle(color: Colors.grey),)],
                  ),
                ),
                height: 50.h),
            SizedBox(
              height: 10.h,
            ),
            Container(
              color: Colors.white,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '这是标题哦！',
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  Text(
                    "xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx",
                    maxLines: 4,
                    overflow: TextOverflow.ellipsis,
                  ),
                  SizedBox(
                    width: double.infinity,
                    height: 100.h,
                    child: GridView.builder(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 3,
                            mainAxisSpacing: 5.w,
                            crossAxisSpacing: 5.w,
                            childAspectRatio: 1.0),
                        itemBuilder: (context, index) {
                          return Image.network(
                            "https://c-ssl.dtstatic.com/uploads/blog/202208/01/20220801204309_f6dd8.thumb.400_0.jpeg",
                            fit: BoxFit.cover,
                          );
                        }),
                  ),
                  SizedBox(
                    height: 10.h,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      TextButton.icon(
                          onPressed: () {},
                          icon: const Icon(
                            Icons.share,
                            color: Colors.black38,
                          ),
                          label: Text(
                            "分享",
                            style: TextStyle(
                              color: Colors.black38,
                            ),
                          )),
                      TextButton.icon(
                          onPressed: () {},
                          icon: const Icon(
                            Icons.message,
                            color: Colors.black38,
                          ),
                          label: Text(
                            "消息",
                            style: TextStyle(
                              color: Colors.black38,
                            ),
                          )),
                      TextButton.icon(
                          onPressed: () {},
                          icon: const Icon(
                            Icons.thumb_up,
                            color: Colors.black38,
                          ),
                          label: Text(
                            "点赞",
                            style: TextStyle(
                              color: Colors.black38,
                            ),
                          )),
                    ],
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        itemCount: 10,
        itemBuilder: (context, index) {
          return _card();
        },
      ),
    );
  }
}
