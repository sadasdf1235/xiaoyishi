import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../constants/I18n_content.dart';

class ChatView extends GetView {
  const ChatView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(100.h),
        child: AppBar(
          backgroundColor: const Color(0xFFF7F8F9),
          flexibleSpace: Column(
            children: [
              SizedBox(height: AppBar().preferredSize.height),
              Row(
                children: [
                  IconButton(
                    onPressed: () {
                      Get.back();
                    },
                    icon: const Icon(Icons.arrow_back_ios),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      CircleAvatar(
                        backgroundImage: NetworkImage(
                            Get.arguments['avatar']),
                      ),
                      Text(
                        Get.arguments['userName'],
                        style: TextStyle(fontSize: 12.sp),
                      )
                    ],
                  )
                ],
              ),
            ],
          ),
          automaticallyImplyLeading: false,
        ),
      ),
      body: Stack(
        children: [
          Positioned(
            left: 0,
            bottom: 0,
            child: Container(
              color: const Color(0xFFF7F8F9),
              width: MediaQuery.of(context).size.width,
              height: 95.h,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                const Icon(Icons.sentiment_satisfied_alt),
                Container(
                  width: MediaQuery.of(context).size.width * (2 / 3),
                  height: 40.h,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(20.r)),
                    border: Border.all(width: 1, color: Colors.grey),
                    color: const Color(0xFFF7F8F9),
                  ),
                  child: TextField(
                    decoration: InputDecoration(
                      prefixIcon: const Icon(Icons.search),
                      hintText: I18nContent.MESSAGE.tr,
                      border: InputBorder.none,
                      counterText: '',
                      // contentPadding: EdgeInsets.symmetric(horizontal: 10.w),
                    ),
                  ),
                ),
                const Icon(Icons.keyboard_voice),
              ]),
            ),
          )
        ],
      ),
    );
  }
}
