import 'package:get/get.dart';

import '../routes/app_routes.dart';
class MessageController extends GetxController{

  List messageList = [
    // {
    //   "avatar" : 'https://ts1.cn.mm.bing.net/th?id=OIP-C._YFRagbOM8FbGUSUJy-m6QAAAA&w=250&h=250&c=8&rs=1&qlt=90&o=6&dpr=1.3&pid=3.1&rm=2',
    //   "userName" : 'zzz_y',
    //   "message" : '可以小刀吗？',
    //   "lastMessageTime" : '04/12 09:32',
    //   "unreadNum" : '2',
    // },
    // {
    //   "avatar" : 'https://ts2.cn.mm.bing.net/th?id=OIP-C.ebDwpQ8AJ8ykQbZ-2VDoUwAAAA&w=250&h=250&c=8&rs=1&qlt=90&o=6&dpr=1.3&pid=3.1&rm=2',
    //   "userName" : '至幸',
    //   "message" : '产品细节怎么样',
    //   "lastMessageTime" : '04/13 11:52',
    //   "unreadNum" : '1',
    // },
  ];

  // 是否展示删除图标
  RxBool isShowDeleteIcon = false.obs;

  void updateIconShow(){
    isShowDeleteIcon.value = !isShowDeleteIcon.value;
    update();
  }
  void _hideDeleteIcon(){
    isShowDeleteIcon.value = false;
    update();
  }
  /// 无效的点击 隐藏图标
  void invalidClick(){
    if(isShowDeleteIcon.value){
      _hideDeleteIcon();
    }
    return;
  }

  void toSearch(){
    Get.toNamed(Routes.SEARCH,arguments: {
      'come' : 'message'
    });
  }

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
  }
}