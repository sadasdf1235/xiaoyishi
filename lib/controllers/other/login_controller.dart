import 'dart:async';
import 'package:dio/dio.dart';

import 'package:get/get.dart';

import '../../controllers/user_controller.dart';
import '../../utils/https_client.dart';

enum LoginMode { oneKey, password, verificationCode }

class LoginController extends GetxController {
  UserController userController = Get.put(UserController());

  RxString phone = ''.obs;
  RxBool isAgree = false.obs;
  Rx<LoginMode> loginMode = LoginMode.verificationCode.obs;
  RxBool isShowPassword = false.obs;
  RxInt count = 60.obs;
  RxBool isShowCode = true.obs;
  late Timer _timer;
  HttpsClient httpsClient = HttpsClient();

  void changePhone(value){
    phone.value = value.toString();
    update();
  }

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
      var res = await httpsClient.get(url: '/api/sms/sendCode',query: {
        'phone' : phone.value
      });
      print('验证码$res');
  }

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
  }
}
