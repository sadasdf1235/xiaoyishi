import 'package:get/get.dart';
import 'package:xiaoyishi/apis/collect.dart';
import 'package:xiaoyishi/constants/constants.dart';
import 'package:xiaoyishi/models/post/PostModel.dart';
import 'package:xiaoyishi/utils/storage.dart';

import '../../constants/I18n_content.dart';
import '../../models/ApiResponse.dart';
import '../../models/commodity/CommodityModel.dart';

class CollectController extends GetxController{

  List tabs = [I18nContent.COWRY.tr,I18nContent.POST.tr];
  RxList collectList = [].obs;
  RxList<PostModel> postList = <PostModel>[].obs;
  RxList<CommodityModel> commodityList = <CommodityModel>[].obs;

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    tabChange(0);
  }

  void changeCollectList(value){
    collectList.value = value;
    update();
  }

  void changePostList(value){
    postList.value = value;
  }

  void changeCommodityList(value){
    commodityList.value = value;
  }

  void tabChange(value){
    collectList.clear();
    if(value == 0){
      getCollectList("commodity");
    }else if(value == 1){
      getCollectList("post");
    }
    update();
  }

  void getCollectList(String type) async{
    try {
      Map<String,dynamic> userInfo = await Storage.getMapData(Constants.USER_INFO);
      int id = userInfo['userId'];
      var res = await CollectApi.getCollectList(id: id, type: type);
      ApiResponse response = ApiResponse.fromJson(res.data);
      if(response.code == 1){
        print('获取收藏列表成功${response.data}');
        if(type == 'post'){
          List<PostModel> list = PostModel.fromJsonList(response.data);
          changePostList(list);
        }else if(type == 'commodity'){
          List<CommodityModel> list = CommodityModel.fromJsonList(response.data);
          changeCommodityList(list);
        }
        return;
      }
      Get.snackbar(I18nContent.HINT.tr, response.msg ?? '获取收藏列表失败');
    } catch (e) {
      print('获取收藏列表失败$e');
    }
  }
}