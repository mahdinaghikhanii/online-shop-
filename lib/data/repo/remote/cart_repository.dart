import 'package:online_shop/common/http_client.dart';
import 'package:online_shop/data/entity/cart_respone.dart';
import 'package:online_shop/data/source/remote/cart_data_source.dart';

final cartRepository = CartRepository(CartRemoteDataSource(httpClients));

abstract class ICartRepository {
  Future<List<CartEntity>> getallCart();
}

class CartRepository extends ICartRepository {
  ICartRemoteDataSource cartRemoteDataSource;
  CartRepository(this.cartRemoteDataSource);

  @override
  Future<List<CartEntity>> getallCart() {
    return cartRemoteDataSource.getallCart();
  }
}
