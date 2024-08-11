class CategoryModel {
  final int id;
  final int? parentId; // 使用可空类型来允许parentId为null
  final String name;

  CategoryModel({
    required this.id,
    this.parentId,
    required this.name,
  });

  // 从 Json Map 构造 ItemModel 对象
  factory CategoryModel.fromJson(Map<String, dynamic> json) {
    return CategoryModel(
        id: json['id'] as int,
        parentId: json['parentId'],
        name: json['name'],
    );
  }

  static List<CategoryModel> fromJsonList(List<dynamic> jsonList) {
    return jsonList.map((json) => CategoryModel.fromJson(json as Map<String, dynamic>)).toList();
  }

  // 将CategoryModel转换为Map，用于JSON编码
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'parentId': parentId,
      'name': name,
    };
  }

  @override
  String toString() {
    return 'CategoryModel{id: $id, parentId: $parentId, name: $name,}';
  }
}