import 'package:get/get.dart';

class SearchController extends GetxController{
  RxString searchValue = ''.obs;
  void changeSearchValue(value){
    searchValue.value = value;
    update();
  }
  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
  }
}