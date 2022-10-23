import 'package:online_shop/data/entity/cart_item.dart';

class CartEntity {
  int id;
  int userId;
  String date;
  List<CartItemEntity> products;

  CartEntity.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        userId = json['userId'],
        date = json['date'],
        products = CartItemEntity.parsJsonArray(json['products']);
}
