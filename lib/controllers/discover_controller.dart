import 'package:get/get.dart';
import 'package:xiaoyishi/apis/post.dart';
import 'package:xiaoyishi/models/ApiResponse.dart';
import 'package:xiaoyishi/models/post/PostModel.dart';

import '../../constants/release_way.dart';
import '../../routes/app_routes.dart';

class DiscoverController extends GetxController {
  RxList<PostModel> postList = <PostModel>[].obs;

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    getPostList();
  }

  void toRelease() {
    Get.toNamed(Routes.RELEASE, arguments: {'way': ReleaseWay.post});
  }

  void changePostList(List<PostModel> list) {
    postList.value = list;
    update();
  }

  void getPostList() async{
    var res = await PostApi.getPostList();
    ApiResponse apiResponse = ApiResponse.fromJson(res.data);
    if(apiResponse.code == 1){
      List<PostModel> list = PostModel.fromJsonList(apiResponse.data);
      print("帖子列表----$list");
      changePostList(list);
    }
  }
}
