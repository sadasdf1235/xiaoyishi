class CollectModel {
  int id;
  int userId;
  int? type;
  String? title;
  double? price;
  List<String>? images;
  String? avatar;
  String? username;

  factory CollectModel.fromJson(Map<String, dynamic> json) {
    return CollectModel(
      id: json['id'] as int,
      userId: json['userId'] as int,
      type: json['Type'] as int?,
      title: json['title'] as String?,
      price: json['price'] as double?,
      images: List<String>.from(json['images'] as List<dynamic>),
      avatar: json['avatar'] as String?,
      username: json['username'] as String?,
    );
  }

  static List<CollectModel> fromJsonList(List<dynamic> jsonList) {
    return jsonList.map((json) => CollectModel.fromJson(json as Map<String, dynamic>)).toList();
  }


  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'userId': userId,
      'Type': type,
      'title': title,
      'price': price,
      'images': images,
      'avatar': avatar,
      'username': username,
    };
  }

  CollectModel({
    required this.id,
    required this.userId,
    required this.type,
    this.title,
    this.price,
    this.images,
    this.avatar,
    this.username,
  });
}