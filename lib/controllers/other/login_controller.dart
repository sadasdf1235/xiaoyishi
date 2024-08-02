import 'dart:async';

import 'package:get/get.dart';

import 'package:xiaoyishi/apis/user.dart';
import 'package:xiaoyishi/constants/constants.dart';
import 'package:xiaoyishi/controllers/user_controller.dart';
import 'package:xiaoyishi/models/ApiResponse.dart';
import 'package:xiaoyishi/models/user/UserLoginModel.dart';

import '../../constants/I18n_content.dart';
import '../../models/user/UserModel.dart';
import '../../routes/app_routes.dart';
import '../../utils/storage.dart';
import '../tabs_controller.dart';

enum LoginMode { oneKey, password, verificationCode }

class LoginController extends GetxController {
  UserController userController = Get.put(UserController());

  RxString phone = ''.obs;
  RxString password = ''.obs;
  RxString code = ''.obs;
  RxBool isAgree = false.obs;
  // 默认验证码登录
  Rx<LoginMode> loginMode = LoginMode.verificationCode.obs;
  RxBool isShowPassword = false.obs;
  // 验证码倒计时
  RxInt count = 60.obs;
  RxBool isShowCode = true.obs;
  late Timer _timer;

  void changePhone(value){
    phone.value = value.toString();
    update();
  }
  void changePassword(value){
    password.value = value.toString();
    update();
  }
  void changeCode(value){
    code.value = value.toString();
    update();
  }

  // 验证码倒计时
  void countDown(){
    _timer = Timer.periodic(const Duration(seconds: 1), (Timer t) {
      isShowCode.value = false;
      if(count.value > 0){
        count--;
      }else {
        t.cancel();
        count.value = 60;
        isShowCode.value = true;
      }
    });
  }

  void changeAgree() {
    isAgree.value = !isAgree.value;
    update();
  }

  // 切换登录方式
  void changeLoginMode(value) {
    loginMode.value = value;
    // 切换登录方式，就默认不同意协议
    isAgree.value = false;
    update();
  }

  void changePasswordShow(){
    isShowPassword.value = !isShowPassword.value;
    update();
  }

  void getCode() async{

  }

  void login() async {
    try {
      var res = await UserApi.login(phone: phone.value,password: password.value, code: code.value);
      ApiResponse response = ApiResponse.fromJson(res.data);
      if(response.code == 1){
        UserLoginModel userLoginModel = UserLoginModel.fromJson(response.data);
        await Storage.setStringData(Constants.TOKEN, userLoginModel.token);
        Get.back();

        userController.getUserInfo(userLoginModel.id);

        Get.snackbar(I18nContent.HINT.tr, response.msg ?? '登录成功');
        update();
        return;
      }
      Get.snackbar(I18nContent.HINT.tr, response.msg ?? '登录失败');
    } catch (e) {
      print('登录失败$e');
    }
  }

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
  }
}
