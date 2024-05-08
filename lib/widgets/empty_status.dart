import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../constants/I18n_content.dart';

class EmptyStatus extends StatelessWidget {
  final String img;
  final String title;
  final String des;
  const EmptyStatus(
      {required this.img, required this.title, required this.des, super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 67.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            height: 50.h,
          ),
          Image.asset(
            img,
            fit: BoxFit.cover,
          ),
          SizedBox(
            height: 72.h,
          ),
          Text(
            title,
            style: TextStyle(
                fontSize: 16.sp,
                color: Colors.black,
                fontWeight: FontWeight.bold),
          ),
          SizedBox(
            height: 33.h,
          ),
          Text(
            des,
            style: TextStyle(fontSize: 13.sp, color: const Color(0xFF9C9C9C)),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
