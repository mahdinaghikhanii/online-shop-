import '../../../common/http_client.dart';
import '../../entity/product_entity.dart';

import '../../source/remote/product_data_source.dart';

final productRepository =
    ProductRepository(ProdcutRemoteDataSource(httpClients));

abstract class IProductRepository {
  Future<List<ProductEntity>> getAllProdcut();
  Future<List<ProductEntity>> getASingleProdcut(String category);
}

class ProductRepository implements IProductRepository {
  IProdcutRemoteDataSource prodcutRemoteDataSource;
  ProductRepository(this.prodcutRemoteDataSource);
  @override
  Future<List<ProductEntity>> getASingleProdcut(String category) async {
    return prodcutRemoteDataSource.getASingleProdcut(category);
  }

  @override
  Future<List<ProductEntity>> getAllProdcut() {
    return prodcutRemoteDataSource.getAllProduct();
  }
}
