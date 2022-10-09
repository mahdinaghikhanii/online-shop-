import 'package:online_shop/common/http_client.dart';
import 'package:online_shop/data/entity/category.dart';
import 'package:online_shop/data/source/product_category_data_source.dart';

final productCategoryRepository =
    ProductCategoryRepository(RemoteProductCategoryDataSource(httpClients));

abstract class IProductCateGoryRepository {
  Future<List<CategoryEntity>> getAllProductCategory();
}

class ProductCategoryRepository implements IProductCateGoryRepository {
  IRemoteProductCategoryDataSource remoteProductCategoryDataSource;
  ProductCategoryRepository(this.remoteProductCategoryDataSource);
  @override
  Future<List<CategoryEntity>> getAllProductCategory() {
    return remoteProductCategoryDataSource.getAllProductCategory();
  }
}
