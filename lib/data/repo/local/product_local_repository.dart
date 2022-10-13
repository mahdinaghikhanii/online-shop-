import 'package:hive/hive.dart';
import 'package:online_shop/data/entity/product.dart';
import 'package:online_shop/data/source/local/product_local_data_source.dart';

final productLocalRepository = ProductLocalRepository(
    ProductLocalDataSource(Hive.box("product_cart_box")));

abstract class IProductLocalRepository<T> {
  Future<List<T>> getAllProduct();
  Future<T> addProducts(T productEntity);
  Future<void> deleteProduct(int idProduct);
}

class ProductLocalRepository implements IProductLocalRepository<ProductEntity> {
  ProductLocalDataSource dataSource;
  ProductLocalRepository(this.dataSource);

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
