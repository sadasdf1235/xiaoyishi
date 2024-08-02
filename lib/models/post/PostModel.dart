import 'dart:convert';

// 假设您想将时间字符串转换为Dart的DateTime对象
// 您可以添加一个自定义的fromJson和toJson方法来处理这些字段

class PostModel {
  final int postId;
  final int userId;
  final String userName;
  final String avatar;
  final String title;
  final String description;
  final int likes;
  final int fans;
  final List<dynamic> images; // 这里假设images可以包含不同类型的图片数据，如果是具体类型，请替换dynamic
  final DateTime createTime;
  final DateTime updateTime;

  // 构造函数
  PostModel({
    required this.postId,
    required this.userId,
    required this.userName,
    required this.avatar,
    required this.title,
    required this.description,
    required this.likes,
    required this.images,
    required this.createTime,
    required this.updateTime,
    required this.fans,
  });

  // 从Json字符串构造Post对象

  // 从Json Map构造Post对象
  factory PostModel.fromJson(Map<String, dynamic> json) {
    // 这里假设时间字符串格式为 "yyyy-MM-dd HH:mm"
    var createTimeStr = json['createTime'] as String;
    var updateTimeStr = json['updateTime'] as String;
    var createTime = DateTime.parse(createTimeStr);
    var updateTime = DateTime.parse(updateTimeStr);

    return PostModel(
      postId: json['postId'] as int,
      userId: json['userId'] as int,
      userName: json['userName'] as String,
      avatar: json['avatar'] as String,
      title: json['title'] as String,
      description: json['description'] as String,
      likes: json['likes'] as int,
      images: json['images'] as List<dynamic>, // 根据实际情况可能需要进一步处理
      createTime: createTime,
      updateTime: updateTime,
      fans: json['fans'] as int,
    );
  }

  // 将Post对象转换为Json字符串
  String toJson() => jsonEncode(toMap());

  static List<PostModel> fromJsonList(List<dynamic> jsonList) {
    return jsonList.map((json) => PostModel.fromJson(json as Map<String, dynamic>)).toList();
  }

  @override
  String toString() {
    return 'PostModel{postId: $postId, userId: $userId, userName: $userName, avatar: $avatar, title: $title, description: $description, likes: $likes, images: $images, createTime: $createTime, updateTime: $updateTime}';
  } // 将Post对象转换为Json Map
  Map<String, dynamic> toMap() {
    // 这里假设时间需要转换回字符串
    var createTimeStr = createTime.toIso8601String().substring(0, 16); // 根据需要调整时间格式
    var updateTimeStr = updateTime.toIso8601String().substring(0, 16); // 根据需要调整时间格式

    return {
      'postId': postId,
      'userId': userId,
      'userName': userName,
      'avatar': avatar,
      'title': title,
      'description': description,
      'likes': likes,
      'images': images, // 假设images已经是正确的Json格式
      'createTime': createTimeStr,
      'updateTime': updateTimeStr,
      'fans': fans,
    };
  }
}