import 'package:get/get.dart';
import 'package:xiaoyishi/apis/category.dart';
import 'package:xiaoyishi/models/ApiResponse.dart';
import 'package:xiaoyishi/models/category/CategoryModel.dart';

class CategoryController extends GetxController {

  RxList<CategoryModel> categoryList = <CategoryModel>[].obs;
  RxList<CategoryModel> secCategoryList = <CategoryModel>[].obs;
  RxInt selectIndex = 0.obs;


  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    getFirstCategory();
  }

  void changeSelectIndex(int index) {
    selectIndex.value = index;
    getSecondCategory(categoryList.value[index].id);
    update();
  }

  void changeCategory(List<CategoryModel> list) async {
    categoryList.value = list;
    update();
  }

  void addSecondCategory(List<CategoryModel> list, int index){
    secCategoryList.value = list;
    update();
  }

  void getFirstCategory() async {
    var res = await CategoryApi.getFirstCategory();
    ApiResponse apiResponse = ApiResponse.fromJson(res.data);
    if(apiResponse.code == 1){
      List<CategoryModel> list = CategoryModel.fromJsonList(apiResponse.data);
      changeCategory(list);
      getSecondCategory(list[0].id);
    }
  }

  void getSecondCategory(int id) async {
    var res = await CategoryApi.getSecondCategory(id: id);
    ApiResponse apiResponse = ApiResponse.fromJson(res.data);
    if(apiResponse.code == 1){
      List<CategoryModel> list = CategoryModel.fromJsonList(apiResponse.data);
      addSecondCategory(list, selectIndex.value);
    }
  }
}