import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../constants/I18n_content.dart';
import '../../../widgets/space_around.dart';

class SearchView extends GetView {
  const SearchView({super.key});

  Widget _searchModule(context,
      {required String title, required List list, required IconData iconData}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(title),
        SizedBox(
          height: 15.h,
        ),
        Wrap(
          spacing: 8.w, // 横向间距
          runSpacing: 8.h, // 纵向间距
          children: List.generate(
            list.length,
            (index) => IntrinsicWidth(
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(10.r)),
                  border: Border.all(width: 1, color: Colors.grey),
                  color: Colors.white,
                ),
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 5.w, vertical: 2.h),
                  child: Row(
                    children: [
                      Icon(iconData),
                      SizedBox(
                        width: 5.w,
                      ),
                      Flexible(
                        child: Text(
                          list[index],
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          // softWrap: true,
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    bool isHome = Get.arguments['come'] == 'home';
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {
              Get.back();
            },
            icon: const Icon(Icons.arrow_back_ios)),
        actions: [
          Container(
            width: MediaQuery.of(context).size.width * 2 / 3,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(20.r)),
              border: Border.all(width: 1, color: Colors.grey),
              color: Colors.white,
            ),
            child: TextField(
              decoration: InputDecoration(
                prefixIcon: const Icon(Icons.search),
                hintText: isHome ? I18nContent.SEARCHFAVORITES.tr : I18nContent.SEARCHHINT.tr,
                border: InputBorder.none,
                counterText: '',
                // contentPadding: EdgeInsets.symmetric(horizontal: 10.w),
              ),
            ),
          )
        ],
      ),
      body: Container(
        width: double.infinity,
        color: const Color(0xFFf6f6f6),
        padding: EdgeInsets.symmetric(horizontal: 10.w),
        child: ListView(
          children: [
            // 最近搜素
            Padding(
              padding: EdgeInsets.only(top: 10.h),
              child: _searchModule(context,
                  title: I18nContent.RECENTSEARCH.tr,
                  iconData: Icons.query_builder,
                  list: ['追风筝的人', '房屋出租', '自行车']),
            ),
            // 流行搜素
            false ? Padding(
              padding: EdgeInsets.only(top: 20.h),
              child: _searchModule(context,
                  title: I18nContent.POPULAREARCH.tr,
                  iconData: Icons.show_chart,
                  list: ['dasasd1231213321312313132', 'dasdadqwe', 'eqerqweq']),
            ) : const Text(''),
            // 推荐
            false ? Padding(
              padding: EdgeInsets.only(top: 20.h),
              child: Column(
                children: [
                  SpaceAround(
                    leftChild: Text(I18nContent.RECOMMEND.tr),
                    rightChild: TextButton(
                      onPressed: () {},
                      child: Row(
                        children: [
                          Text(
                            I18nContent.SEEALL.tr,
                          ),
                          SizedBox(
                            width: 5.w,
                          ),
                          const Icon(Icons.navigate_next)
                        ],
                      ),
                    ),
                    height: 30.h,
                    color: Colors.transparent,
                  ),
                  SizedBox(height: 10.h,),
                  SizedBox(
                    height: 50.h,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: 20,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 8.0),
                          child: Text('Item $index'),
                        );
                      },
                    ),
                  ),
                ],
              ),
            ) : const Text(''),
          ],
        ),
      ),
    );
  }
}
