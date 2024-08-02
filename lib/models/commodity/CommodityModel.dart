import 'dart:convert';

class CommodityModel {
  final int commodityId;
  final int userId;
  final int categoryId;
  final String userName;
  final String avatar;
  final String title;
  final String description;
  final String? location; // 假设 location 可能为 null
  final double price;
  final String createTime;
  final String updateTime;
  final List<String> images;

  CommodityModel({
    required this.commodityId,
    required this.userId,
    required this.categoryId,
    required this.userName,
    required this.title,
    required this.description,
    this.location,
    required this.price,
    required this.createTime,
    required this.updateTime,
    required this.images,
    required this.avatar,
  });

  // 从 Json Map 构造 ItemModel 对象
  factory CommodityModel.fromJson(Map<String, dynamic> json) {
    return CommodityModel(
      avatar: json['avatar'] as String,
      commodityId: json['commodityId'] as int,
      userId: json['userId'] as int,
      categoryId: json['categoryId'] as int,
      userName: json['userName'] as String,
      title: json['title'] as String,
      description: json['description'] as String,
      location: json['location'] as String?, // 显式地处理 null
      price: (json['price'] as num).toDouble(), // 假设 price 总是有效的 double
      createTime: json['createTime'] as String,
      updateTime: json['updateTime'] as String,
      images: List<String>.from(json['images'] as List), // 将 List<dynamic> 转换为 List<String>
    );
  }

  static List<CommodityModel> fromJsonList(List<dynamic> jsonList) {
    return jsonList.map((json) => CommodityModel.fromJson(json as Map<String, dynamic>)).toList();
  }

  // 将 ItemModel 对象转换为 Json Map
  Map<String, dynamic> toMap() {
    return {
      'commodityId': commodityId,
      'userId': userId,
      'categoryId': categoryId,
      'userName': userName,
      'title': title,
      'description': description,
      'location': location,
      'price': price,
      'createTime': createTime,
      'updateTime': updateTime,
      'images': images,
      'avatar': avatar,
    };
  }
}