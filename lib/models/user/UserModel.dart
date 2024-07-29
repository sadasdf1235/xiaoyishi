class UserModel {
  int userId;
  String username;
  String phone;
  String email;
  int gender;
  String address;
  String password;
  String currentLocation;
  String avatarUrl;
  int status;
  int onlineStatus;
  int? createUser;
  int? updateUser;
  String createTime;
  String updateTime;
  int isDeleted;

  UserModel({
    required this.userId,
    required this.username,
    required this.phone,
    required this.email,
    required this.gender,
    required this.address,
    required this.password,
    required this.currentLocation,
    required this.avatarUrl,
    required this.status,
    required this.onlineStatus,
    this.createUser,
    this.updateUser,
    required this.createTime,
    required this.updateTime,
    required this.isDeleted,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      userId: json['userId'],
      username: json['username'],
      phone: json['phone'],
      email: json['email'],
      gender: json['gender'],
      address: json['address'],
      password: json['password'],
      currentLocation: json['currentLocation'],
      avatarUrl: json['avatarUrl'],
      status: json['status'],
      onlineStatus: json['onlineStatus'],
      createUser: json['createUser'],
      updateUser: json['updateUser'],
      createTime: json['createTime'],
      updateTime: json['updateTime'],
      isDeleted: json['isDeleted'],
    );
  }

  @override
  String toString() {
    return 'UserModel{userId: $userId, username: $username, phone: $phone, email: $email, gender: $gender, address: $address, password: $password, currentLocation: $currentLocation, avatarUrl: $avatarUrl, status: $status, onlineStatus: $onlineStatus, createUser: $createUser, updateUser: $updateUser, createTime: $createTime, updateTime: $updateTime, isDeleted: $isDeleted}';
  }

  Map<String, dynamic> toJson() {
    return {
      'userId': userId,
      'username': username,
      'phone': phone,
      'email': email,
      'gender': gender,
      'address': address,
      'password': password,
      'currentLocation': currentLocation,
      'avatarUrl': avatarUrl,
      'status': status,
      'onlineStatus': onlineStatus,
      'createUser': createUser,
      'updateUser': updateUser,
      'createTime': createTime,
      'updateTime': updateTime,
      'isDeleted': isDeleted,
    };
  }
}
