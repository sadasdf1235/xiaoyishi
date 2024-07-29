import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:xiaoyishi/apis/follow.dart';
import 'package:xiaoyishi/models/follow/FollowCountModel.dart';

import '../apis/user.dart';
import '../constants/I18n_content.dart';
import '../constants/constants.dart';
import '../models/ApiResponse.dart';
import '../models/user/UserModel.dart';
import '../utils/storage.dart';
import '../widgets/ld_icon.dart';
import '../../routes/app_routes.dart';
import '../../constants/release_way.dart';
import '../models/user/UserModel.dart';

class UserController extends GetxController{
  String defaultAvatar = 'assets/images/avatar.png';
  String defaultRelease = 'assets/images/user_bk.png';
  List<Map<String,dynamic>> recordItemList = [
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
  ];
  RxBool isLogin =  false.obs;
  RxInt id = 0.obs;
  Rxn<UserModel> userInfo = Rxn<UserModel>();
  Rx<FollowCountModel> followCount = Rx<FollowCountModel>(FollowCountModel(follows: 0, beans: 0));

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
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

  void changeId(value){
    id.value = value;
    update();
  }

  void changeUserInfo(value){
    userInfo.value = value;
    update();
  }

  void getUserInfo(int id) async {
    try {
      var res = await UserApi.getUserInfo(userId: id);
      ApiResponse response = ApiResponse.fromJson(res.data);
      if(response.code == 1){
        UserModel userModel = UserModel.fromJson(response.data);
        changeUserInfo(userModel);
        print('用户信息----${userModel}');
        Get.snackbar(I18nContent.HINT.tr, response.msg ?? '获取用户信息成功');
      }
      Get.snackbar(I18nContent.HINT.tr, response.msg ?? '获取用户信息失败');
    } catch (e) {
      print('获取用户信息失败$e');
    }
  }

  void getUserFollowCount(int id) async {
    try {
      var res = await FollowApi.getFollowCount(userId: id);
      ApiResponse response = ApiResponse.fromJson(res.data);
      if(response.code == 1){
        followCount.value = FollowCountModel.fromJson(response.data);
      }
    }catch(e) {
      print('获取用户关注数失败');
    }
  }
}