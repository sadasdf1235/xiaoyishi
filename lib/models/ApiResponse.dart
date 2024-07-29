class ApiResponse {
  int code;
  String? msg;
  dynamic data; // 可以根据具体的 data 结构定义更具体的类型

  ApiResponse({
    required this.code,
    required this.msg,
    this.data,
  });

  // fromJson: 创建 ApiResponse 对象从 JSON
  factory ApiResponse.fromJson(Map<String, dynamic> json) {
    return ApiResponse(
      code: json['code'],
      msg: json['msg'],
      data: json['data'],
    );
  }

  // toJson: 将 ApiResponse 对象转换为 JSON
  Map<String, dynamic> toJson() {
    return {
      'code': code,
      'msg': msg,
      'data': data,
    };
  }
}
