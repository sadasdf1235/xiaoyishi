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
      'image' : [
        'https://2.qn.img-space.com/g1/M00/05/59/Cg-4rFZ20OSIPXxOAAM6l7BwrhIAAOdVgI6y-wAAzqv009.jpg?imageView2/2/w/740/h/500/q/75/ignore-error/1/',
        'https://2.qn.img-space.com/g1/M00/05/59/Cg-4q1Z20OSIBHKbAAGguQh5uJkAAOdVgI-BpsAAaDR867.jpg?imageView2/2/w/740/h/500/q/75/ignore-error/1/',
        'https://2.qn.img-space.com/g1/M00/05/59/Cg-4rFZ20OSIdiG1AAHvqlZ6un0AAOdVgI_p2wAAe_C851.jpg?imageView2/2/w/740/h/500/q/75/ignore-error/1/',
      ],
      'title' : '26寸山地车型电动自行车',
      'describe' : '外观拉风的山地车型电动自行车，也可以比较好的骑行。本人去年7月购入，只是用于上学，本人懒于收拾，所以电镀外观稍旧。前挡泥板脱落，所以只要800，原价2000多，参见链接。本车极其适合于自己动手能力强且善于收拾的人。只能自取。',
      'price' : '800',
      'userName': 'cameralens2007',
      'avatar' : 'https://ts1.cn.mm.bing.net/th?id=OIP-C.P7koAmn-WlSykrqOQNSYVAAAAA&w=250&h=250&c=8&rs=1&qlt=90&o=6&dpr=1.3&pid=3.1&rm=2',
    },
    {
      'image' : [
        'https://2.qn.img-space.com/g3/M00/04/03/Cg-77VhuUd2IN4n5AAKc5Mmke2cAAGPGgCaxYUAApz8421.jpg?imageView2/2/w/740/h/500/q/75/ignore-error/1/',
        'https://2.qn.img-space.com/g3/M00/04/03/Cg-40lhuUeCIQWQ5AAKrHhKkPaQAAGPGgET1psAAqs2969.jpg?imageView2/2/w/740/h/500/q/75/ignore-error/1/',
        'https://2.qn.img-space.com/g3/M00/04/03/Cg-40lhuUeaIAXhwAANTfOpvu1kAAGPGgGcjJkAA1OU759.jpg?imageView2/2/w/740/h/500/q/75/ignore-error/1/',
        'https://2.qn.img-space.com/g3/M00/04/03/Cg-77VhuUfCIG7u3AATFzW9h9fMAAGPGgK8ExIABMXl234.jpg?imageView2/2/w/740/h/500/q/75/ignore-error/1/'
      ],
      'title' : '苹果原装手机壳',
      'describe' : '''配件市场上其实一直都水深，官方硅胶套也是这样子，基本上大多数市面上都是半原的硅胶套在流通，外壳是原装加工的，内衬里边是假的后加工上去的，这种便宜，手感也不错，成本在48元人民币左右，但是我是不做这个的，向来的原则是只卖好货正货，坏了这个规矩我这淘宝店其实也不用做了。苦于一直没有好的渠道，所以暂时搁浅了，也就是在今年（2016年）4月初的时候，从一个渠道流出一小批的官方硅胶套，我试着拿了一个，拆了一个，真的是惊喜到了，没的说，原厂硅胶，内衬也原厂，手感简直炸裂，跟摸女票的腿一样~
官网介绍：此系列硅胶保护壳专为 iPhone 量身打造，外形与音量按钮、睡眠/唤醒按钮契合得丝丝入扣，并能紧贴机身线条，丝毫不显赘余。此外，超细纤维制成的柔软内衬，尽可呵护你的 iPhone。而外部的硅胶材质，则给人一种如丝般柔滑的出色手感。''',
      'price' : '18',
      'userName': '新一族',
      'avatar' : '',
    },
    {
      'image' : [
        'https://2.qn.img-space.com/201908/8/75dbe75b620898a5028b423793a99ffd.jpg?imageView2/2/w/740/h/500/q/75/ignore-error/1/',
        'https://2.qn.img-space.com/201908/8/f51652bda49ea0ed5db8ad2f95f303a6.jpg?imageView2/2/w/740/h/500/q/75/ignore-error/1/',
        'https://2.qn.img-space.com/201908/8/ba648e828e3c700b4064dc67a0de8de2.jpg?imageView2/2/w/740/h/500/q/75/ignore-error/1/',
        'https://2.qn.img-space.com/201908/8/85af9e88e8d243bf30111967ea527293.jpg?imageView2/2/w/740/h/500/q/75/ignore-error/1/',
      ],
      'title' : '芬达的电吉他＋蜘蛛15的音箱',
      'describe' : '''1.型号要求：芬达的电吉他＋蜘蛛15的音箱
2.到手时间/使用时长：一年左右
3.成色描述：基本上买回来就没碰过。
4.器材情况：跟新的一样，没怎么见过太阳。
5.包含配件：琴弦，拨片，调音器等待
6.其他说明：想学来的，一直没有时间。现在有时间了没有心情学了。现在转手卖了便宜了。''',
      'price' : '1000',
      'userName': 'nemoran',
      'avatar' : '',
    },
    {
      'image' : [
        'https://img7.youlu.net/bookpic/l/003/12050036406ef.jpg-n'
      ],
      'title' : '追风筝的人',
      'describe' : '''''',
      'price' : '8.9',
      'userName': 'wqeqwemd',
      'avatar' : '',
    },
    {
      'image' : [
        'https://www0.kfzimg.com/sw/kfz-cos/kfzimg/bfcdddae/a87a789ad6229001_n.jpg',
        'https://www0.kfzimg.com/sw/kfz-cos/kfzimg/ebdcfcfc/f5c16f446ab1069e_n.jpg',
        'https://www0.kfzimg.com/sw/kfz-cos/kfzimg/faedbccf/44dc1197bfe19a26_n.jpg'
      ],
      'title' : '三体全集：地球往事三部曲（全套三册合售）',
      'describe' : '''实物拍摄 请仔细看图下单 《死神永生》该册书脊的金字体有些脱落较模糊 无划写 自然旧 微黄''',
      'price' : '268',
      'userName': '喜鹤书屋',
      'avatar' : '',
    },
    {
      'image' : [
        'https://2.qn.img-space.com/202112/8/0eb485f690a4a2e406d0fb2543b3f668.jpg?imageView2/2/w/740/h/500/q/75/ignore-error/1/',
        'https://2.qn.img-space.com/202112/8/81f3f5314445ca237c2785d9d7757620.jpg?imageView2/2/w/740/h/500/q/75/ignore-error/1/',
        'https://2.qn.img-space.com/202112/8/98cc1921ff72215bc773b33ee58960c6.jpg?imageView2/2/w/740/h/500/q/75/ignore-error/1/',
        'https://2.qn.img-space.com/202112/8/d57d5783f4d76f363bbc00e975805edb.jpg?imageView2/2/w/740/h/500/q/75/ignore-error/1/',
      ],
      'title' : '自用华米手表2，出掉回血',
      'describe' : '''自用花米手表2 18年10月京东上购买，原价899买来跑马拉松的，平时训练也带，GPS精度很高，定位好再跑一般不会飘(高楼遮挡，深山老林会没信号)因为更新所以出掉这款老的，有需要的可以及时联系我谢谢''',
      'price' : '240',
      'userName': 'FNYX11158127',
      'avatar' : 'https://image3.fengniao.com/head/11159/source/11158127_3.jpg?imageView2/1/w/180/h/180/q/75/ignore-error/1/',
    },
    {
      'image' : [
        'https://2.qn.img-space.com/g1/M00/07/B1/Cg-4rFc1h6CIWVPrAAChUMDmb8cAASEHgJ4nFkAAKFo581.jpg?imageView2/2/w/740/h/500/q/75/ignore-error/1/',
        'https://2.qn.img-space.com/g1/M00/07/B1/Cg-4q1c1h6CIWlXkAAC7Ix9w1sIAASEHgJ8FYUAALs7507.jpg?imageView2/2/w/740/h/500/q/75/ignore-error/1/',
        'https://2.qn.img-space.com/g1/M00/07/B1/Cg-4rFc1h6GIeygwAACsstnBulAAASEHgJ89jAAAKzK188.jpg?imageView2/2/w/740/h/500/q/75/ignore-error/1/',
        'https://2.qn.img-space.com/g1/M00/07/B1/Cg-4rFc1h6GIC8_CAAChU0XaQ7YAASEHgKDeJ0AAKFr957.jpg?imageView2/2/w/740/h/500/q/75/ignore-error/1/',
        'https://2.qn.img-space.com/g1/M00/07/B1/Cg-4q1c1h6GIfR3NAAC7bGKENAwAASEHgKENY8AALuE054.jpg?imageView2/2/w/740/h/500/q/75/ignore-error/1/'
      ],
      'title' : '马田摄影双肩包，可装2机4镜，面料结实，背负舒服',
      'describe' : '''99新，购于2016年1月，只用过一次，肩带厚实，背部中空透气，背负超级舒服。比乐摄宝，曼富图的好太多了，机身接小白兔可直接放入。本次出售只有摄影包，不包含图片内的其他。''',
      'price' : '230',
      'userName': 'shai',
      'avatar' : '',
    },
    {
      'image' : [
        'https://2.qn.img-space.com/g2/M00/03/DF/Cg-4k1Z22iaIYdR2AAIBkla4xBEAAGCXAL1r8kAAgGq963.jpg?imageView2/2/w/740/h/500/q/75/ignore-error/1/',
        'https://2.qn.img-space.com/g2/M00/03/DF/Cg-4klZ22iaIaviGAAIurYVumJEAAGCXAL3sXMAAi7F312.jpg?imageView2/2/w/740/h/500/q/75/ignore-error/1/'
      ],
      'title' : 'benro包，内胆包',
      'describe' : '''benro包100元，蓝包50元，因为用手机拍的光线不好有些偏色，蓝包是天蓝色，benro包外面是黑色，内胆是灰色。''',
      'price' : '100',
      'userName': 'rjyfei',
      'avatar' : '',
    },
    {
      'image' : [
        'https://2.qn.img-space.com/g3/M00/03/4D/Cg-40lhRAvuIUVyoACWZUJ8hk3MAAFIHwAAAAAAJZlo487.jpg?imageView2/2/w/740/h/500/q/75/ignore-error/1/',
        'https://2.qn.img-space.com/g2/M00/06/28/Cg-4k1hRAoKIc8lVADH0M1pNxXcAAJjoAH4gcYAMfRL329.jpg?imageView2/2/w/740/h/500/q/75/ignore-error/1/',
        'https://2.qn.img-space.com/g3/M00/03/4D/Cg-40lhRApeIB1iOADhlT0etujoAAFIHgFw9pUAOGVn312.jpg?imageView2/2/w/740/h/500/q/75/ignore-error/1/',
        'https://2.qn.img-space.com/g3/M00/03/4D/Cg-40lhRAqiIBSb1ADJx7c2QEtsAAFIHgIOEjUAMnIF356.jpg?imageView2/2/w/740/h/500/q/75/ignore-error/1/',
        'https://2.qn.img-space.com/g3/M00/03/4D/Cg-77VhRArmIVWpwADAz7pZIy9IAAFIHgJayN4AMDQG506.jpg?imageView2/2/w/740/h/500/q/75/ignore-error/1/',
        'https://2.qn.img-space.com/g2/M00/06/28/Cg-4k1hRAsyIfUyRADExkqKZEa4AAJjoAJNGUgAMTGq570.jpg?imageView2/2/w/740/h/500/q/75/ignore-error/1/',
        'https://2.qn.img-space.com/g3/M00/03/4D/Cg-77VhRAt2IVkEFADHFW9nvv9YAAFIHgLpuN8AMcVz230.jpg?imageView2/2/w/740/h/500/q/75/ignore-error/1/'
      ],
      'title' : '闲置相机包',
      'describe' : '''处理一批个人闲置用品：
佳能快门线是原装的，型号RS 80N3,只用过几次,100元；
两个相机包使用频率极低，内外完好；背包80元，单肩包50元。
镜头筒当时是买错了尺寸，所以全新未用，内里有一块1米*1米的绒布，''',
      'price' : '80',
      'userName': 'zzxmarco',
      'avatar' : 'https://image3.fengniao.com/head/681/source/680966_3.jpg?imageView2/1/w/180/h/180/q/75/ignore-error/1/',
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
