import 'package:online_shop/data/entity/product_entity.dart';

class CartItem {
  final ProductEntity productEntity;
  final int quantity;

  CartItem.fromJson(Map<String, dynamic> json)
      : productEntity = ProductEntity.fromJson(json['products']),
        quantity = json['quantity'];
}
