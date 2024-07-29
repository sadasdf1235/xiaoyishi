class FollowCountModel {
  final int follows;
  final int beans;

  FollowCountModel({required this.follows, required this.beans});

  // 从 JSON 创建 FollowCountModel 实例
  factory FollowCountModel.fromJson(Map<String, dynamic> json) {
    return FollowCountModel(
      follows: json['follows'],
      beans: json['beans'],
    );
  }

  // 将 FollowCountModel 实例转换为 JSON
  Map<String, dynamic> toJson() {
    return {
      'follows': follows,
      'beans': beans,
    };
  }
}
