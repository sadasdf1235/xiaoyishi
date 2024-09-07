import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:xiaoyishi/models/commodity/CommodityModel.dart';

import '../apis/commodity.dart';
import '../models/ApiResponse.dart';
import '../utils/amap_util.dart';
import '../constants/I18n_content.dart';

class HomeController extends GetxController {
  /// 滚动控制器
  final ScrollController scrollController = ScrollController();
  /// 定位
  RxString location = ''.obs;
  int flag = 1;
  List categoryList = [
    {
      'images': 'assets/images/phone.png',
      'name' : I18nContent.PHONE.tr,
    },
    {
      'images': 'assets/images/computer.png',
      'name' : I18nContent.COMPUTER.tr,
    },
    {
      'images': 'assets/images/car.png',
      'name' : I18nContent.CAR.tr,
    },
    {
      'images': 'assets/images/game.png',
      'name' : I18nContent.GAME.tr,
    },
    {
      'images': 'assets/images/book.png',
      'name' : I18nContent.BOOK.tr,
    },
    {
      'images': 'assets/images/jewelry.png',
      'name' : I18nContent.JEWELRY.tr,
    },
    {
      'images': 'assets/images/music.png',
      'name' : I18nContent.MUSICA.tr,
    },
    {
      'images': 'assets/images/',
      'name' : I18nContent.PHONE.tr,
    },
    {
      'images': 'assets/images/clothing.png',
      'name' : I18nContent.CLOTHING.tr,
    },
    {
      'images': 'assets/images/bed.png',
      'name' : I18nContent.BED.tr,
    },
    {
      'images': 'assets/images/food.png',
      'name' : I18nContent.FOOD.tr,
    },
    {
      'images': 'assets/images/renting.png',
      'name' : I18nContent.RENTING.tr,
    },
    {
      'images': 'assets/images/other.png',
      'name' : I18nContent.OTHER.tr,
    },
  ];
  RxList<CommodityModel> productList = <CommodityModel>[].obs;

  @override
  onInit() async{
    super.onInit();
    // 获取定位信息 只自动调用一次
    if(flag == 1){
      getLocation();
    }
    getCommodities();
    // 监听页面的滚动（给予按钮给用户返回上方）
    _listenScroll();
  }

  // 监听滚动
  void _listenScroll(){
    /// 为滚动控制器添加监听
    scrollController.addListener(() {
      /// _scrollController.position.pixels 是当前像素点位置
      /// _scrollController.position.maxScrollExtent 当前列表最大可滚动位置
      if (scrollController.position.pixels >=
          scrollController.position.maxScrollExtent - 80) {
        /// 触发上拉加载更多机制
      }
    });
  }

  // 获取定位
  void getLocation(){
    flag += (flag < 2) ? 1 : 0;

    final AmapUtil amapUtil = AmapUtil();
    amapUtil.getCurrentLocation((result){
      if(result['description'] != ''){
        location.value = result['description'];
        // Get.snackbar(I18nContent.HINT.tr, I18nContent.POSITIONLOADING.tr,);
      }else {
        Get.snackbar(I18nContent.HINT.tr, I18nContent.POSITIONLOADING.tr,backgroundColor: Colors.white,);
      }
    });
    amapUtil.cancel();
  }

  // 获取商品列表
  void getCommodities() async {
    try {
      var res = await CommodityApi.getCommodities();
      ApiResponse response = ApiResponse.fromJson(res.data);
      if(response.code == 1){
        productList.addAll(CommodityModel.fromJsonList(response.data));
        update();
      }
    } catch (e) {
      print('获取商品列表失败$e');
      Get.snackbar(I18nContent.HINT.tr, '获取商品列表失败');
    }
  }

  @override
  void onClose() {
    // TODO: implement onClose
    super.onClose();
  }
}
