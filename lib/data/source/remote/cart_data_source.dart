import 'package:dio/dio.dart';
import 'package:online_shop/data/common/http_validate_respone.dart';
import 'package:online_shop/data/entity/cart.dart';

abstract class ICartRemoteDataSource {
  Future<void> addToCart();
  Future<List<CartEntity>> getallCart();
}

class CartRemoteDataSource
    with HttpValidateRespone
    implements ICartRemoteDataSource {
  final Dio httpClient;
  CartRemoteDataSource(this.httpClient);
  @override
  Future<void> addToCart() {
    throw UnimplementedError();
  }

  @override
  Future<List<CartEntity>> getallCart() async {
    final respone = await httpClient.get('carts');
    validateRespone(respone.data);

    List<CartEntity> cart = [];
    return cart;
  }
}
