import '../../common/http_client.dart';
import '../entity/category.dart';
import '../source/product_category_data_source.dart';

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
