import 'package:dio/dio.dart';
import '../common/http_validate_respone.dart';
import '../entity/product.dart';

abstract class IProdcutRemoteDataSource {
  Future<List<ProductEntity>> getAllProduct();
  Future<List<ProductEntity>> getASingleProdcut(int numberId);
}

class ProdcutRemoteDataSource
    with HttpValidateRespone
    implements IProdcutRemoteDataSource {
  Dio httpClient;
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
    for (var element in (respone.data as List)) {
      products.add(ProductEntity.fromJson(element));
    }
    return products;
  }
}
