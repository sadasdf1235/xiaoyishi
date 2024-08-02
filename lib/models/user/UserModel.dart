class UserModel {
  int userId;
  String username;
  String phone;
  String email;
  int gender;
  String address;
  String currentLocation;
  String avatar;
  int status;
  int onlineStatus;
  String createTime;
  String updateTime;
  int follows;
  int beans;
  int collects;
  int histories;
  int posts;

  UserModel({
    required this.userId,
    required this.username,
    required this.phone,
    required this.email,
    required this.gender,
    required this.address,
    required this.currentLocation,
    required this.avatar,
    required this.status,
    required this.onlineStatus,
    required this.createTime,
    required this.updateTime,
    required this.follows,
    required this.beans,
    required this.collects,
    required this.histories,
    required this.posts,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      userId: json['userId'],
      username: json['username'],
      phone: json['phone'],
      email: json['email'],
      gender: json['gender'],
      address: json['address'],
      currentLocation: json['currentLocation'],
      avatar: json['avatar'],
      status: json['status'],
      onlineStatus: json['onlineStatus'],
      createTime: json['createTime'],
      updateTime: json['updateTime'],
      follows: json['follows'],
      beans: json['beans'],
      collects: json['collects'],
      histories: json['histories'],
      posts: json['posts'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'userId': userId,
      'username': username,
      'phone': phone,
      'email': email,
      'gender': gender,
      'address': address,
      'currentLocation': currentLocation,
      'avatar': avatar,
      'status': status,
      'onlineStatus': onlineStatus,
      'createTime': createTime,
      'updateTime': updateTime,
      'follows': follows,
      'beans': beans,
      'collects': collects,
      'histories': histories,
      'posts': posts,
    };
  }
}
