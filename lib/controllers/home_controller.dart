import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeController extends GetxController{
  /// 滚动控制器
  final ScrollController _scrollController = ScrollController();

  @override
  onInit(){
    /// 为滚动控制器添加监听
    _scrollController.addListener(() {
      /// _scrollController.position.pixels 是当前像素点位置
      /// _scrollController.position.maxScrollExtent 当前列表最大可滚动位置
      if (_scrollController.position.pixels >=
          _scrollController.position.maxScrollExtent - 80) {
        /// 触发上拉加载更多机制

      }
    });

  }

}