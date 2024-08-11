import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_pickers/pickers.dart';

import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:xiaoyishi/apis/commodity.dart';

import 'package:xiaoyishi/apis/common.dart';
import 'package:xiaoyishi/constants/constants.dart';
import 'package:xiaoyishi/controllers/other/category_controller.dart';
import 'package:xiaoyishi/models/ApiResponse.dart';
import 'package:xiaoyishi/models/commodity/CommodityForm.dart';
import 'package:xiaoyishi/utils/storage.dart';

import '../../models/category/CategoryModel.dart';

class ReleaseIdleController extends GetxController {
  final TextEditingController textEditingController = TextEditingController();
  final TextEditingController textEditingControllerTitle =
      TextEditingController();

  CategoryController categoryController = Get.find<CategoryController>();

  Rxn<CategoryModel> category = Rxn<CategoryModel>(null);
  RxString title = ''.obs;
  RxString description = ''.obs;
  RxDouble price = 0.00.obs;
  RxString location = ''.obs;
  RxList<String> imageList = <String>[].obs;
  Rx<CategoryModel> secCategory = CategoryModel(id: 0, name: '').obs;

  final ImagePicker _imagePicker = ImagePicker();

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    categoryController.categoryList();
  }

  void cleanInput() {
    title.value = '';
    description.value = '';
    textEditingController.clear();
    update();
  }

  void cleanTitleInput() {
    title.value = '';
    textEditingControllerTitle.clear();
    update();
  }

  void updateTitle(value) {
    title.value = value;
  }

  void updateDescription(value) {
    description.value = value;
  }

  void updatePrice(value) {
    price.value = value;
  }

  void updateLocation(value) {
    location.value = value;
  }

  void updateSecCategory(value) {
    secCategory.value = value;
  }

  void updateCategory(value) {
    category.value = value;
    secCategory.value = CategoryModel(id: 0, name: '');
  }

  void showPicker(context) {
    List<String> data =
        categoryController.categoryList.map((v) => v.name).toList();
    Pickers.showSinglePicker(
      context,
      data: data,
      selectData: data[0],
      onConfirm: (p, i) {
        updateCategory(categoryController.categoryList[i]);
        categoryController.getSecondCategory(category.value?.id ?? 1);
      },
    );
  }

  void showSecPicker(context) {
    List<String> data =
        categoryController.secCategoryList.map((v) => v.name).toList();
    Pickers.showSinglePicker(
      context,
      data: data,
      selectData: data[0],
      onConfirm: (p, i) {
        updateSecCategory(categoryController.secCategoryList[i]);
      },
    );
  }

  //  上传多张图片
  void selectMultiImage() async {
    List<XFile>? images = await _imagePicker.pickMultiImage();
    if (images != null) {
      List<String> imagePaths = images.map((image) => image.path).toList();
      for (var image in imagePaths) {
        var res = await CommonApi.upload(file: File(image));
        imageList.add(res.data['data']);
        update();
      }
    }
  }

  void addCommodity() async {
    try{
      Map<String,dynamic> userInfo = await Storage.getMapData(Constants.USER_INFO);
      int id = userInfo['userId'];
      var res = await CommodityApi.addCommodity(
          commodityForm: CommodityForm(
              title: title.value,
              description: description.value,
              price: price.value,
              location: location.value,
              categoryId: secCategory.value.id,
              userId: id,
              images: imageList.value));
      ApiResponse apiResponse = ApiResponse.fromJson(res.data);
      if (apiResponse.code == 1) {
        Get.back();
        Get.snackbar('发布成功', '发布成功');
      }
    }catch(e){
      Get.snackbar('发布失败', e.toString());
    }

  }
}
