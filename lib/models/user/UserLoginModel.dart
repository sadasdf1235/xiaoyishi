class UserLoginModel {
  int id;
  String token;

  UserLoginModel({
    required this.id,
    required this.token,
  });

  // fromJson: 创建 User 对象从 JSON
  factory UserLoginModel.fromJson(Map<String, dynamic> json) {
    return UserLoginModel(
      id: json['id'],
      token: json['token'],
    );
  }

  // toJson: 将 User 对象转换为 JSON
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'token': token,
    };
  }
}
