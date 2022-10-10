import 'package:dio/dio.dart';
import '../common/http_validate_respone.dart';
import '../entity/product.dart';

abstract class IProdcutRemoteDataSource {
  Future<List<ProductEntity>> getAllProduct();
  Future<List<ProductEntity>> getASingleProdcut(String category);
}

class ProdcutRemoteDataSource
    with HttpValidateRespone
    implements IProdcutRemoteDataSource {
  Dio httpClient;
  ProdcutRemoteDataSource(this.httpClient);
  @override
  Future<List<ProductEntity>> getASingleProdcut(String category) async {
    final respone = await httpClient
        .get("https://fakestoreapi.com/products/category/$category");
    validateRespone(respone);
    List<ProductEntity> singleProduct = [];
    for (var data in (respone.data as List)) {
      singleProduct.add(ProductEntity.fromJson(data));
    }
    return singleProduct;
  }

  @override
  Future<List<ProductEntity>> getAllProduct() async {
    final respone = await httpClient.get(ProdcutSort().allProduct);
    validateRespone(respone);
    List<ProductEntity> products = [];
    for (var element in (respone.data as List)) {
      products.add(ProductEntity.fromJson(element));
    }
    return products;
  }
}
