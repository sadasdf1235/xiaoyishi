import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:roundcheckbox/roundcheckbox.dart';

import '../../../controllers/other/login_controller.dart';
import '../../../widgets/ld_icon.dart';
import '../../../constants/I18n_content.dart';
import '../../../widgets/space_around.dart';

class LoginView extends GetView<LoginController> {
  const LoginView({super.key});

  Widget _checkBox() {
    return RoundCheckBox(
        size: 20,
        checkedWidget: const Icon(
          Icons.check,
          color: Colors.white,
          size: 10,
        ),
        checkedColor: const Color(0xFF3C78FF),
        uncheckedColor: const Color(0x003C78FF),
        border: Border.all(
            color: controller.isAgree.value
                ? const Color(0xFF3C78FF)
                : const Color(0xFFD1D1D1),
            width: 1),
        isChecked: controller.isAgree.value,
        onTap: (selected) {
          controller.changeAgree();
        });
  }

  Widget _oneKeyBody() {
    return Padding(
      padding: EdgeInsets.only(top: 100.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            '13487546321',
            style: TextStyle(fontSize: 32.sp, fontWeight: FontWeight.bold),
          ),
          Text(
            '${I18nContent.TELECOM.tr}${I18nContent.PROVIDESERVICE.tr}',
            textAlign: TextAlign.center,
            style: TextStyle(color: const Color(0xFF969799), fontSize: 13.sp),
          ),
          SizedBox(
            height: 157.h,
          ),
          Text(
            I18nContent.AUTHLOGINHINT.tr,
            textAlign: TextAlign.center,
          ),
          SizedBox(
            height: 16.h,
          ),
          ElevatedButton(
              onPressed: () {}, child: Text(I18nContent.ONEKEYLOGIN.tr)),
          TextButton(
              onPressed: () {
                controller.changeLoginMode(LoginMode.password);
              },
              child: Text(I18nContent.OTHERLOGIN.tr)),
        ],
      ),
    );
  }

  Widget _otherModeBody(context) {
    bool showPas = controller.loginMode.value == LoginMode.password;
    return Obx(() => SizedBox(
          width: MediaQuery.of(context).size.width,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // title
              Text(
                controller.loginMode.value == LoginMode.password
                    ? I18nContent.ACCPASLOGIN.tr
                    : I18nContent.CODELOGIN.tr,
                style: TextStyle(fontSize: 32.sp, fontWeight: FontWeight.bold),
                textAlign: TextAlign.center,
              ),
              SizedBox(
                height: 32.h,
              ),
              // 手机号
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(100.r)),
                  border: Border.all(width: 1, color: Colors.grey),
                  color: Colors.white,
                ),
                child: TextField(
                  keyboardType: TextInputType.phone,
                  decoration: InputDecoration(
                    prefixIcon: const Icon(Icons.phone_iphone),
                    hintText: I18nContent.INPUTPHONE.tr,
                    border: InputBorder.none,
                    counterText: '',
                    // contentPadding: EdgeInsets.symmetric(horizontal: 10.w),
                  ),
                  onChanged: (value) {
                    controller.changePhone(value);
                  },
                ),
              ),
              SizedBox(
                height: 24.h,
              ),
              // 密码 验证码
              showPas
                  ? Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(100.r)),
                        border: Border.all(width: 1, color: Colors.grey),
                        color: Colors.white,
                      ),
                      child: TextField(
                          obscureText: true,
                          decoration: InputDecoration(
                            prefixIcon: const Icon(Icons.lock_outline),
                            suffixIcon: IconButton(
                              onPressed: () {
                                controller.changePasswordShow();
                              },
                              icon: controller.isShowPassword.value
                                  ? const Icon(Icons.visibility)
                                  : const Icon(Icons.visibility_off),
                            ),
                            hintText: I18nContent.INPUTPASSWORD.tr,
                            border: InputBorder.none,
                            counterText: '',
                          ),
                          onChanged: (value) {
                            controller.changePassword(value);
                          }),
                    )
                  : Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(100.r)),
                        border: Border.all(width: 1, color: Colors.grey),
                        color: Colors.white,
                      ),
                      child: TextField(
                        keyboardType: TextInputType.number,
                        obscureText: true,
                        decoration: InputDecoration(
                          prefixIcon: const Icon(Icons.verified_user),
                          suffixIcon: controller.isShowCode.value
                              ? ElevatedButton(
                                  onPressed: () {
                                    // 开始60秒倒计时
                                    controller.countDown();
                                    controller.getCode();
                                  },
                                  child: Text(I18nContent.GETCODE.tr),
                                )
                              : ElevatedButton(
                                  onPressed: () {},
                                  child: Text('${controller.count}'),
                                ),
                          hintText: I18nContent.INPUTCODE.tr,
                          border: InputBorder.none,
                          counterText: '',
                        ),
                        onChanged: (value) {
                          controller.changeCode(value);
                        },
                      ),
                    ),
              showPas
                  ? SizedBox(
                      height: 12.h,
                    )
                  : const Text(''),
              // 记住密码 忘记密码
              showPas
                  ? SpaceAround(
                      leftChild: Row(
                        children: [
                          _checkBox(),
                          SizedBox(
                            width: 8.w,
                          ),
                          Text(I18nContent.REMEMMBERPASSWORD.tr),
                        ],
                      ),
                      rightChild: TextButton(
                        onPressed: () {},
                        child: Text(
                          I18nContent.FORGETPASSWORD.tr,
                          style: const TextStyle(color: Color(0xFF165DFF)),
                        ),
                      ),
                      height: 20.h)
                  : const Text(''),
              SizedBox(
                height: showPas ? 56.h : 24.h,
              ),
              // 协议
              ConstrainedBox(
                constraints:
                    BoxConstraints(maxWidth: MediaQuery.of(context).size.width),
                child: Row(
                  children: [
                    _checkBox(),
                    SizedBox(
                      width: 5.w,
                    ),
                    Expanded(
                        child: RichText(
                            softWrap: true,
                            // overflow: TextOverflow.ellipsis,
                            text: TextSpan(children: [
                              TextSpan(
                                text: I18nContent.AGREE.tr,
                                style: const TextStyle(color: Colors.black),
                              ),
                              TextSpan(
                                text: '《${I18nContent.PLATFORMSERVER.tr}》',
                                style:
                                    const TextStyle(color: Color(0xFF7da4fd)),
                              ),
                              TextSpan(
                                text: I18nContent.AND.tr,
                                style: const TextStyle(color: Colors.black),
                              ),
                              TextSpan(
                                text: '《${I18nContent.PRIVACYPOLICY.tr}》',
                                style:
                                    const TextStyle(color: Color(0xFF7da4fd)),
                              ),
                            ])))
                  ],
                ),
              ),
              SizedBox(
                height: 10.h,
              ),
              // 登录
              ElevatedButton(
                onPressed: () {
                  if (controller.isAgree.value) {
                    controller.login();
                  } else {
                    Get.snackbar(
                      I18nContent.HINT.tr,
                      I18nContent.AGREEPRO.tr,
                      backgroundColor: Colors.white,
                    );
                  }
                },
                child: Text(I18nContent.SIGNUP.tr),
              ),
              SizedBox(
                height: 10.h,
              ),
              TextButton(
                  onPressed: () {
                    controller.changeLoginMode(showPas
                        ? LoginMode.verificationCode
                        : LoginMode.password);
                  },
                  child: Text(showPas
                      ? I18nContent.CODELOGIN.tr
                      : I18nContent.ACCPASLOGIN.tr)),
            ],
          ),
        ));
  }

  Widget _oneKeyBottom(context) {
    return ConstrainedBox(
      constraints: BoxConstraints(maxWidth: MediaQuery.of(context).size.width),
      child: Row(
        children: [
          _checkBox(),
          SizedBox(
            width: 5.w,
          ),
          Flexible(
            child: RichText(
              text: TextSpan(children: [
                TextSpan(
                    text: I18nContent.AGREE.tr,
                    style: TextStyle(color: Colors.black, fontSize: 10.sp)),
                TextSpan(
                    text: I18nContent.AGREEMENT.tr,
                    style: TextStyle(
                        color: const Color(0xFF437cfe), fontSize: 10.sp)),
                TextSpan(
                    text: I18nContent.AUTHORIZATION.tr,
                    style: TextStyle(color: Colors.black, fontSize: 10.sp)),
              ]),
            ),
          )
        ],
      ),
    );
  }

  Widget _bottom(context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            I18nContent.OTHERLOGIN.tr,
            style: TextStyle(color: const Color(0xFF969799), fontSize: 12.sp),
          ),
          SizedBox(
            height: 24.h,
          ),
          SizedBox(
            width: 168.w,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                InkWell(
                  onTap: () {},
                  child: Image.asset('assets/images/QQ.png'),
                ),
                InkWell(
                  onTap: () {},
                  child: Image.asset('assets/images/weixin.png'),
                ),
                InkWell(
                  onTap: () {},
                  child: Image.asset('assets/images/apple_id.png'),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    LoginController controller = Get.put(LoginController());
    return Obx(() => Scaffold(
          resizeToAvoidBottomInset: false,
          appBar: AppBar(
            leading: IconButton(
                onPressed: () {
                  Get.back();
                },
                icon: const Icon(Icons.arrow_back_ios)),
            actions: [
              IconButton(onPressed: () {}, icon: Icon(LdIcon.service)),
            ],
          ),
          body: Container(
            padding: EdgeInsets.symmetric(horizontal: 16.w),
            child: Stack(
              // alignment: Alignment.center,
              children: [
                controller.loginMode.value == LoginMode.oneKey
                    ? _oneKeyBody()
                    : _otherModeBody(context),
                // 底部
                Positioned(
                  bottom: 30.h,
                  child: LoginMode.oneKey == controller.loginMode.value
                      ? _oneKeyBottom(context)
                      : _bottom(context),
                ),
              ],
            ),
          ),
        ));
  }
}
