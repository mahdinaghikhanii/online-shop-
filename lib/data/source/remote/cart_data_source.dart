import 'package:dio/dio.dart';
import 'package:online_shop/data/common/http_validate_respone.dart';
import 'package:online_shop/data/entity/cart_respone.dart';
import 'package:online_shop/data/entity/product_entity.dart';

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
    final respone = await httpClient.get(ProdcutSort().allCart);
    validateRespone(respone);
    List<CartEntity> cartRespone = [];

    for (var data in (respone.data as List)) {
      cartRespone.add(CartEntity.fromJson(data));
    }

    return cartRespone;
  }
}
