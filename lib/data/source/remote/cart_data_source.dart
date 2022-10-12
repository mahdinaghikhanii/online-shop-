import 'package:online_shop/data/entity/cart.dart';

abstract class ICartRemoteDataSource {
  Future<void> addToCart();
  Future<List<CartEntity>> getallCart();
}
