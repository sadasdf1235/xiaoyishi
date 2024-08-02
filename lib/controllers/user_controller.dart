import 'package:get/get.dart';

import '../constants/constants.dart';
import '../utils/storage.dart';
import '../apis/user.dart';
import '../constants/I18n_content.dart';
import '../models/ApiResponse.dart';
import '../models/user/UserModel.dart';
import '../widgets/ld_icon.dart';
import '../../routes/app_routes.dart';
import '../../constants/release_way.dart';

class UserController extends GetxController{
  String defaultAvatar = 'assets/images/avatar.png';
  String defaultRelease = 'assets/images/user_bk.png';
  RxList<Map<String,dynamic>> recordItemList = [
    {
      'topText' : '0',
      'bottomText' : I18nContent.COLLECT.tr,
      'routerName' : Routes.COLLECT,
    },
    {
      'topText' : '0',
      'bottomText' : I18nContent.HISTORY.tr,
      'routerName' : Routes.HISTORY,
    },
    {
      'topText' : '0',
      'bottomText' : I18nContent.POST.tr,
      'routerName' : Routes.POST,
    },
    {
      'iconData' : LdIcon.posted,
      'bottomText' : I18nContent.POSTED.tr,
      'routerName' : Routes.RELEASED,
    },
    {
      'iconData' : LdIcon.sold,
      'bottomText' : I18nContent.SOLD.tr,
      'routerName' : Routes.SOLD,
    },
    {
      'iconData' : LdIcon.purchased,
      'bottomText' : I18nContent.PURCHASED.tr,
      'routerName' : Routes.PURCHASED,
    },
  ].obs;
  RxBool isLogin =  false.obs;
  Rxn<UserModel> userInfo = Rxn<UserModel>();

  @override
  void onInit() async{
    // TODO: implement onInit
    super.onInit();
    String token = await Storage.getStringData(Constants.TOKEN);
    Map<String,dynamic> userInfo = await Storage.getMapData(Constants.USER_INFO);
    if(token.isNotEmpty && userInfo.isNotEmpty){
      changeLoginStatus(true);
      changeUserInfo(UserModel.fromJson(userInfo));
    }
  }

  // 去发布页
  void toRelease(){
    if(!isLogin.value){
      Get.toNamed(Routes.LOGIN);
      return;
    }
    Get.toNamed(Routes.RELEASE,arguments: {
      'way' : ReleaseWay.idle
    });
  }

  void changeLoginStatus(status){
    isLogin.value = status;
    update();
  }

  void changeUserInfo(UserModel value){
    userInfo.value = value;
    Storage.setMapData(Constants.USER_INFO, value.toJson());
    update();
  }

  void getUserInfo(int id) async {
    try {
      var res = await UserApi.getUserInfo(userId: id);
      ApiResponse response = ApiResponse.fromJson(res.data);
      if(response.code == 1){
        UserModel userModel = UserModel.fromJson(response.data);

        recordItemList.value[0]['topText'] = userModel.collects.toString();
        recordItemList.value[1]['topText'] = userModel.histories.toString();
        recordItemList.value[2]['topText'] = userModel.posts.toString();

        changeUserInfo(userModel);
        changeLoginStatus(true);
        Get.snackbar(I18nContent.HINT.tr, response.msg ?? '获取用户信息成功');
      }
    } catch (e) {
      print('获取用户信息失败$e');
      Get.snackbar(I18nContent.HINT.tr, '获取用户信息失败');
    }
  }
}