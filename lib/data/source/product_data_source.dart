import 'package:dio/dio.dart';
import 'package:online_shop/data/common/http_validate_respone.dart';
import 'package:online_shop/data/entity/product.dart';

abstract class IProdcutRemoteDataSource {
  Future<List<ProductEntity>> getAllProduct();
  Future<List<ProductEntity>> getASingleProdcut(int numberId);
}

class ProdcutRemoteDataSource
    with HttpValidateRespone
    implements IProdcutRemoteDataSource {
  final Dio httpClient;
  ProdcutRemoteDataSource(this.httpClient);
  @override
  Future<List<ProductEntity>> getASingleProdcut(int numberId) {
    throw UnimplementedError();
  }

  @override
  Future<List<ProductEntity>> getAllProduct() async {
    final respone = await httpClient.get("products");
    validateRespone(respone);

    List<ProductEntity> products = [];

    (respone.data as List).forEach((element) {
      products.add(ProductEntity.fromJson(element));
    });
    return products;
  }
}
