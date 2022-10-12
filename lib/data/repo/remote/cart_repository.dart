import 'package:online_shop/data/entity/cart.dart';

abstract class ICartRepository {
  Future<List<CartEntity>> getallEntity();
}
