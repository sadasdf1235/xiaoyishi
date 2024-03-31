import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../constants/I18n_content.dart';

class ReleaseIdleController extends GetxController {

  final TextEditingController textEditingController = TextEditingController();

  RxString describe = ''.obs;
  RxString price = '0.00'.obs;

  void cleanInput(){
    describe.value = '';
    textEditingController.clear();
    update();
  }
  void updateDescribe(value){
    describe.value = value;
    update();
  }
  void updatePrice(value){
    price.value = value;
    update();
  }

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
  }
}