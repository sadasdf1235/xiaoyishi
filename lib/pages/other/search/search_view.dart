import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

import '../../../constants/I18n_content.dart';

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
        ConstrainedBox(
          constraints: BoxConstraints(
            maxHeight: MediaQuery.of(context).size.height,
          ),
          child: MasonryGridView.count(
              itemCount: list.length,
              padding: EdgeInsets.fromLTRB(16.w, 0, 16.w, 16.h),
              crossAxisCount: 5,
              mainAxisSpacing: 10.w,
              crossAxisSpacing: 10.h,
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemBuilder: (context, index) {
                return Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(10.r)),
                    border: Border.all(width: 1, color: Colors.grey),
                    color: Colors.white,
                  ),
                  child: Row(
                    children: [
                      Icon(iconData),
                      SizedBox(
                        width: 5.w,
                      ),
                      Expanded(
                          child: Text(
                        list[index],
                        maxLines: 2,
                        softWrap: true,
                      ))
                    ],
                  ),
                );
              }),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
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
                hintText: I18nContent.SEARCHFAVORITES.tr,
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
        child: Column(
          children: [
            _searchModule(context,
                title: I18nContent.RECENTSEARCH.tr,
                iconData: Icons.query_builder,
                list: []),
          ],
        ),
      ),
    );
  }
}
