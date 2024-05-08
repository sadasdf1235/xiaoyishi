import 'dart:io';

import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

import '../../constants/I18n_content.dart';
import '../../utils/https_client.dart';

class ReleaseIdleController extends GetxController {

  final TextEditingController textEditingController = TextEditingController();
  HttpsClient httpsClient = HttpsClient();

  RxString describe = ''.obs;
  RxString price = '0.00'.obs;
  RxList imageList = [].obs;
  final ImagePicker _imagePicker  = ImagePicker();

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
  // 上传多张图片
  void selectMultiImage() async {
    List<XFile>? images = await _imagePicker.pickMultiImage();
    if (images != null){
      List<String> imagePaths = images.map((image) => image.path).toList();
      var res = await httpsClient.uploadFiles(url: '/api/oss/upload', files: imagePaths);
      print('dasdas $res');
    }
    update();
  }

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
  }
}