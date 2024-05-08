import 'package:flutter/material.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import 'space_around.dart';
import '../constants/I18n_content.dart';
import '../constants/common_colors.dart';

class OrderItem extends StatelessWidget {
  final String avatarUrl;
  final String userName;
  final String payStatus;
  final String coverImaUrl;
  final String title;
  final double price;
  final void Function()? leftPressed;
  final void Function()? rightPressed;
  final String leftBtnText;
  final String rightBtnText;
  const OrderItem(
      {required this.avatarUrl,
      required this.userName,
      required this.payStatus,
      required this.coverImaUrl,
      required this.price,
      required this.title,
      required this.leftBtnText,
      required this.rightBtnText,
      required this.leftPressed,
      required this.rightPressed,
      super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(10.w),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          SpaceAround(
              leftChild: Row(
                children: [
                  CircleAvatar(
                    backgroundImage: NetworkImage(avatarUrl),
                  ),
                  SizedBox(width: 2.w,),
                  Text(
                    userName,
                  ),
                ],
              ),
              rightChild: Text(
                payStatus,
                style: const TextStyle(color: CommonColors.themeColor),
              ),
              height: 30.h),
          SizedBox(height: 10.h,),
          SpaceAround(
              leftChild: Row(
                children: [
                  Image.network(coverImaUrl,fit: BoxFit.cover,width: 70.h,height: 70.h,),
                  SizedBox(width: 5.w,),
                  Text(title)
                ],
              ),
              rightChild: Text('${I18nContent.UNIT.tr} $price'),
              height: 70.h),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              ElevatedButton(
                onPressed: leftPressed,
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(Colors.grey),
                ),
                child: Text(
                  leftBtnText,
                  style: const TextStyle(color: Colors.black),
                ),
              ),
              SizedBox(width: 10.w,),
              ElevatedButton(
                onPressed: rightPressed,
                style: ButtonStyle(
                  backgroundColor:
                      MaterialStateProperty.all(Colors.red),
                ),
                child: Text(
                  rightBtnText,
                  style: const TextStyle(color: Colors.black),
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
