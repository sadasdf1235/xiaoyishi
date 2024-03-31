import 'package:get/get.dart';

enum LoginMode { oneKey, password, verificationCode }

class LoginController extends GetxController {
  RxBool isAgree = false.obs;
  Rx<LoginMode> loginMode = LoginMode.oneKey.obs;
  RxBool isShowPassword = false.obs;

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

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
  }
}
