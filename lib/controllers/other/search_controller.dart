import 'package:get/get.dart';

class SearchController extends GetxController{
  RxString searchValue = ''.obs;
  RxList homeSearchHistory = [].obs;
  RxList messageSearchHistory = [].obs;
  void changeSearchValue(value){
    searchValue.value = value;
    update();
  }
  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
  }
  @override
  void onReady() {
    // TODO: implement onReady
    super.onReady();
  }
}