import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../constants/I18n_content.dart';
import '../../widgets/space_around.dart';
import '../../controllers/discover_controller.dart';
import '../../constants/release_way.dart';
import '../../routes/app_routes.dart';

class DiscoverView extends GetView<DiscoverController> {
  const DiscoverView({super.key});

  Widget _card(String avatar, String userName, int fansNum, String title,
      String textPart, List images) {
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
                        avatar,
                        fit: BoxFit.cover,
                        width: 50.w,
                        height: 50.h,
                      ),
                    ),
                    SizedBox(
                      width: 5.w,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        /// 用户名
                        Text(userName),
                        Row(
                          children: [
                            Text(I18nContent.PERSONTAG.tr),
                            SizedBox(
                              width: 10.w,
                            ),

                            /// 粉丝
                            Text("$fansNum ${I18nContent.FANS.tr}"),
                          ],
                        )
                      ],
                    )
                  ],
                ),
                rightChild: ElevatedButton(
                  onPressed: () {},
                  child: Row(
                    children: [
                      const Icon(
                        Icons.add,
                        color: Colors.grey,
                      ),
                      Text(
                        I18nContent.ATTENTION.tr,
                        style: const TextStyle(color: Colors.grey),
                      )
                    ],
                  ),
                ),
                height: 50.h),
            // SizedBox(
            //   height: 10.h,
            // ),
            Container(
              color: Colors.white,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  Text(
                    textPart,
                    maxLines: 4,
                    overflow: TextOverflow.ellipsis,
                  ),
                  images.isNotEmpty
                      ? SizedBox(
                          width: double.infinity,
                          height: 100.h,
                          child: GridView.builder(
                              shrinkWrap: true,
                              itemCount: images.length,
                              physics: const NeverScrollableScrollPhysics(),
                              gridDelegate:
                                  SliverGridDelegateWithFixedCrossAxisCount(
                                      crossAxisCount: 3,
                                      mainAxisSpacing: 5.w,
                                      crossAxisSpacing: 5.w,
                                      childAspectRatio: 1.0),
                              itemBuilder: (context, index) {
                                return Image.network(
                                  images[index],
                                  fit: BoxFit.cover,
                                );
                              }),
                        )
                      : const Text(''),
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
                            I18nContent.SHARE.tr,
                            style: const TextStyle(
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
                            I18nContent.MESSAGE.tr,
                            style: const TextStyle(
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
                            I18nContent.LIKE.tr,
                            style: const TextStyle(
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

  PreferredSizeWidget _appBar() {
    return PreferredSize(
        preferredSize: Size.fromHeight(40.h),
        child: AppBar(
              title: Row(
                crossAxisAlignment: CrossAxisAlignment.baseline,
                textBaseline: TextBaseline.alphabetic,
                children: [
                  Text(
                    I18nContent.ATTENTION.tr,
                    style: TextStyle(fontSize: 18.sp),
                  ),
                  SizedBox(width: 8.w),
                  Text(
                    I18nContent.FORUM.tr,
                    style: TextStyle(fontSize: 25.sp),
                  ),
                ],
              ),
              actions: [
                ElevatedButton(
                  onPressed: () {},
                  child: Text(I18nContent.RELEASE.tr),
                ),
              ],
            ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _appBar(),
      body: ListView.builder(
        itemCount: controller.postList.length,
        itemBuilder: (context, index) {
          var e = controller.postList[index];
          return _card(e['avatar'], e['userName'], int.parse(e['fansNum']),
              e['title'], e['textPart'], e['images']);
        },
      ),
    );
  }
}
