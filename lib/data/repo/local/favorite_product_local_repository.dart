import 'package:hive/hive.dart';
import '../../entity/product_entity.dart';
import '../../source/local/favorite_product_local_data_source.dart';

final favoriteproductLocalRepository = FavoriteProductLocalRepository(
    FavoriteProductLocalDataSource(Hive.box("product_cart_box")));

abstract class IFavoriteProductLocalRepository<T> {
  Future<List<T>> getAllProduct();
  Future<T> addProducts(T productEntity);
  Future<void> deleteProduct(int idProduct);
}

class FavoriteProductLocalRepository
    implements IFavoriteProductLocalRepository<ProductEntity> {
  FavoriteProductLocalDataSource dataSource;
  FavoriteProductLocalRepository(this.dataSource);

  @override
  Future<ProductEntity> addProducts(ProductEntity productEntity) {
    return dataSource.addProducts(productEntity);
  }

  @override
  Future<void> deleteProduct(int idProduct) {
    return dataSource.deleteProduct(idProduct);
  }

  @override
  Future<List<ProductEntity>> getAllProduct() {
    return dataSource.getAllProduct();
  }
}
