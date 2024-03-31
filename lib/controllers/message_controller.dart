import 'package:get/get.dart';
class MessageController extends GetxController{

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

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
  }
}