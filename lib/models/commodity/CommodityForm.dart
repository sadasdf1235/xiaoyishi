import '../category/CategoryModel.dart';
class CommodityForm {
  String title;
  String description;
  double price;
  String location;
  int categoryId;
  int userId;
  List<String> images;

  CommodityForm({
    required this.title,
    required this.description,
    required this.price,
    required this.location,
    required this.categoryId,
    required this.images,
    required this.userId
  });

  Map<String, dynamic> toJson() {
    return {
      'title': title,
      'description': description,
      'price':price,
      'location': location,
      'categoryId': categoryId,
      'userId': userId,
      'images': images,
    };
  }
}