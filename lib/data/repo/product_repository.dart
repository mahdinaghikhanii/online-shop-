import 'package:online_shop/common/http_client.dart';
import 'package:online_shop/data/entity/product.dart';
import 'package:online_shop/data/source/product_data_source.dart';

final productRepository =
    ProductRepository(ProdcutRemoteDataSource(httpClients));

abstract class IProductRepository {
  Future<List<ProductEntity>> getAllProdcut();
  Future<List<ProductEntity>> getASingleProdcut(int numberId);
}

class ProductRepository implements IProductRepository {
  IProdcutRemoteDataSource prodcutRemoteDataSource;
  ProductRepository(this.prodcutRemoteDataSource);
  @override
  Future<List<ProductEntity>> getASingleProdcut(int numberId) {
    throw UnimplementedError();
  }

  @override
  Future<List<ProductEntity>> getAllProdcut() {
    return prodcutRemoteDataSource.getAllProduct();
  }
}