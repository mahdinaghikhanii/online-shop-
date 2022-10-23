import 'package:online_shop/data/entity/product_entity.dart';

class CartEntity {
  late int id;
  late int userId;
  late String date;
  late List<ProductEntity> products;
  late int iV;

  CartEntity.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    userId = json['userId'];
    date = json['date'];
    if (json['products'] != null) {
      products = <ProductEntity>[];
      json['products'].forEach((v) {
        products.add(ProductEntity.fromJson(v));
      });
    }
  }
}
