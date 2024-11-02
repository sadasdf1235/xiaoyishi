import 'package:get/get.dart';

import '../../apis/collect.dart';
import '../../constants/constants.dart';
import '../../models/collect/CollectModel.dart';
import '../../models/post/PostModel.dart';
import '../../constants/I18n_content.dart';
import '../../models/ApiResponse.dart';
import '../../models/commodity/CommodityModel.dart';
import '../../utils/storage.dart';

class CollectController extends GetxController{

  List tabs = [I18nContent.ALL.tr,I18nContent.COMMODITY.tr,I18nContent.POST.tr];
  RxList<CollectModel> collectList = <CollectModel>[].obs;
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
    getCollectList(value);
    update();
  }

  void getCollectList(int type) async{
    try {
      Map<String,dynamic> userInfo = await Storage.getMapData(Constants.USER_INFO);
      int id = userInfo['userId'];
      var res = await CollectApi.getCollectList(id: id, type: type);
      ApiResponse response = ApiResponse.fromJson(res.data);
      if(response.code == 1){
        print('获取收藏列表成功${response.data}');
        // if(type == 2){
        //   List<PostModel> list = PostModel.fromJsonList(response.data);
        //   changePostList(list);
        // }else if(type == 1){
        //   List<CommodityModel> list = CommodityModel.fromJsonList(response.data);
        //   changeCommodityList(list);
        // }
        List<CollectModel> list  = CollectModel.fromJsonList(response.data);
        changeCollectList(list);
        return;
      }
      Get.snackbar(I18nContent.HINT.tr, response.msg ?? '获取收藏列表失败');
    } catch (e) {
      print('获取收藏列表失败$e');
    }
  }
}