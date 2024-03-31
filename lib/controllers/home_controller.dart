import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../utils/amap_util.dart';
import '../constants/I18n_content.dart';
import '../constants/common_colors.dart';

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
  List productList = [
    {
      'image' : 'https://img.alicdn.com/imgextra/i2/124709208/O1CN019UPiF02HtJtXTbjH6_!!0-saturn_solar.jpg_580x580q90.jpg_.webp',
      'title' : '分期免息/送豪华礼 HUAWEI/华为P60 Pro 12+256G 5G曲面屏手机快充游戏旗舰官网官方正品店鸿蒙80SE/70/90pro',
      'price' : '4566',
    },
    {
      'image' : 'https://img.alicdn.com/imgextra/i1/2074738186/O1CN011Dfhdh2ALF77wlK5Z_!!2074738186-0-alimamacc.jpg_580x580q90.jpg_.webp',
      'title' : '分期免息/顺丰速发 华为P50 Pro 12+512GB新款X50i + 5G智能手机1亿像素官方旗舰正品店官网华为手机mate60',
      'price' : '3266',
    },
    {
      'image' : 'https://g-search1.alicdn.com/img/bao/uploaded/i4/i2/909410026/O1CN01ddAfK11C3xBOqsYBu_!!0-item_pic.jpg_580x580q90.jpg_.webp',
      'title' : '新品速发!小米Note13Pro 16+512GB手机2亿像素拍照游戏5G旗舰 小米官方旗舰店官网正品可选note13',
      'price' : '2346',
    },
    {
      'image' : 'https://g-search1.alicdn.com/img/bao/uploaded/i4/i3/2616970884/O1CN01V10E0u1IOv34hjax0_!!0-item_pic.jpg_580x580q90.jpg_.webp',
      'title' : '【现货速发】Redmi Note 13 5G手机红米note手机小米手机小米官方旗舰店官网新品正品note13 2067',
      'price' : '999',
    },
    {
      'image' : 'https://g-search2.alicdn.com/img/bao/uploaded/i4/i4/2208778335564/O1CN01F9VvQw1qyMeLSdz44_!!0-item_pic.jpg_580x580q90.jpg_.webp',
      'title' : 'OPPO K10X oppok10x 智能手机5goppo手机全网通oppo官方旗舰店官网正品0ppo k9x k9pro k10 k11x',
      'price' : '999',
    },
    {
      'image' : 'https://g-search2.alicdn.com/img/bao/uploaded/i4/i2/745667243/O1CN01945WE923NLcOG6v9s_!!0-item_pic.jpg_580x580q90.jpg_.webp',
      'title' : '2024新款正品S23 ultra电竞游戏智能手机学生价256G大内存全网通可用5G卡百元官方备用机超大屏',
      'price' : '888',
    },
    {
      'image' : 'https://img.alicdn.com/imgextra/i3/538440058/O1CN012KLM1M1CIbouwWptb_!!0-saturn_solar.jpg_580x580q90.jpg_.webp',
      'title' : 'CEP 春夏专业跑步压缩裤女 轻薄透气紧身裤 高弹训练裤健身裤子',
      'price' : '499',
    },
    {
      'image' : 'https://img.alicdn.com/imgextra/i3/5305047099/O1CN01kIjtdw22JObP4Xjkd_!!0-saturn_solar.jpg_580x580q90.jpg_.webp',
      'title' : '佛伦斯FOLUNSI男装春夏潮流商务休闲裤男莫代尔微弹青年直筒裤',
      'price' : '399',
    },
    {
      'image' : 'https://gw.alicdn.com/imgextra/i1/866276081/O1CN01392ByW1un93gbpTGT_!!0-item_pic.jpg_Q75.jpg_.webp',
      'title' : '轻小说 青春猪头少年系列1-11卷 鸭志田一 台版轻小说 角川出版 动画漫画青春猪头不会梦到兔女郎学姐原著小说',
      'price' : '128',
    },
    {
      'image' : 'https://g-search3.alicdn.com/img/bao/uploaded/i4/i3/1800512501/O1CN01eLDefn1ULVUokrhR1_!!0-item_pic.jpg_580x580q90.jpg_.webp',
      'title' : '现货【外图台版漫画】我推的孩子 1-11 本命的孩子/ 赤坂アカ-作；横枪メンゴ-绘 青文 推しの子 推理之子',
      'price' : '98',
    },
    {
      'image' : 'https://g-search3.alicdn.com/img/bao/uploaded/i4/i2/2580421029/O1CN01qfBosI1JTKSUOvwW8_!!0-item_pic.jpg_580x580q90.jpg_.webp',
      'title' : '完结正版全18册【专享海量赠品】我的青春恋爱物语喜剧果然有问题小说1-14.5全套 新书春物小说渡航著漫画书14校园爱情',
      'price' : '328',
    },
  ];

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

  @override
  onInit() {
    super.onInit();
    // 获取定位信息 只自动调用一次
    if(flag == 1){
      getLocation();
    }
    // 监听页面的滚动（给予按钮给用户返回上方）
    _listenScroll();
  }
  @override
  void onClose() {
    // TODO: implement onClose
    super.onClose();
  }
}
