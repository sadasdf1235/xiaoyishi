import 'package:get/get.dart';

import '../../constants/release_way.dart';
import '../../routes/app_routes.dart';
class DiscoverController extends GetxController{
    List postList = [
      {
        "avatar" : 'https://ts1.cn.mm.bing.net/th?id=OIP-C.NWVtO_WUCFq--lyEwswV_AAAAA&w=166&h=166&c=8&rs=1&qlt=90&o=6&dpr=1.3&pid=3.1&rm=2',
        "userName" : 'zasda',
        "fansNum" : '234', // double
        "title" : '金智媛《眼泪女王》8集换了82套造型！',
        "textPart" : '金秀贤、金智媛 爱心四连拍释出，真的莎疯了啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊！！！',
        "images" : ['https://wx4.sinaimg.cn/orj480/0084dfgcly1hofrdkai65j30mh0u0di2.jpg'],
      },
      {
        "avatar" : 'https://ts1.cn.mm.bing.net/th?id=OIP-C.D34PjxR7ud-vxeTDvs5Z8gAAAA&w=150&h=150&c=8&rs=1&qlt=90&o=6&dpr=1.3&pid=3.1&rm=2',
        "userName" : 'qwzcac_ww',
        "fansNum" : '223',
        "title" : '李沁✖️千金回国妆',
        "textPart" : '''是沈近真，也是李沁✨
      今今天的追风者见面会 给千金沈近真化了一个千金回国妆~～
      妆容整体哑光质感 只保留了皮肤自身微微的光泽感 眼妆使用低饱和度的大地色 突出沁沁自身的轮廓 唇部使用了一个肉桂色''',
        "images" : ['https://wx2.sinaimg.cn/orj360/001YscZNly1hogvvdvwfej61jk14awjg02.jpg','https://wx1.sinaimg.cn/orj360/001YscZNly1hogvzb3gs0j60sh11z42h02.jpg',
        'https://wx3.sinaimg.cn/orj360/001YscZNly1hogvvfdak4j61401z4tcp02.jpg'],
      },
      {
        "avatar" : 'https://ts1.cn.mm.bing.net/th?id=OIP-C.C5EJocDSwakveV6CeOCe0wAAAA&w=166&h=168&c=8&rs=1&qlt=90&o=6&dpr=1.3&pid=3.1&rm=2',
        "userName" : 'mdjaj',
        "fansNum" : '656',
        "title" : '小米SU7 首批车主浮出',
        "textPart" : '''小米SU7首批交付仪式4月3日在小米汽车工厂总装车间举行。据北京林达集团投资建设的哈尔滨世界欢乐城公众号介绍，小米SU7首位车主为第十三届全国人大代表、双林汇商务俱乐部主席、林达集团董事局主席李晓林。交付仪式上，雷军为李晓林颁发小米SU7首位车主NO.0001号证书。

李晓林表示：“20年前的今天，劳斯莱斯汽车为我颁发‘全新豪华版劳斯莱斯汽车首位车主证书’；20年后的今天，小米新能源汽车给我颁发‘小米SU7 NO.0001号车主’证书。''',
        "images" : [],
      },
      {
        "avatar" : 'https://ts1.cn.mm.bing.net/th?id=OIP-C.beAa_Q4WmXiu-UAinuLB3gAAAA&w=250&h=250&c=8&rs=1&qlt=90&o=6&dpr=1.3&pid=3.1&rm=2',
        "userName" : 'zxcxzca',
        "fansNum" : '1234',
        "title" : '爱奇艺涨超4%',
        "textPart" : '财联社4月6日电，热门中概股涨跌不一，纳斯达克中国金龙指数跌0.18%，本周累涨0.37%。爱奇艺涨超4%，腾讯音乐涨超3%，满帮、富途控股涨超1%，网易、理想汽车、拼多多小幅上涨。',
        "images" : [],
      },
    ];

    void toRelease(){
      Get.toNamed(Routes.RELEASE,arguments: {
        'way' : ReleaseWay.post
      });
    }
    @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
  }
}
