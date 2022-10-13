import 'package:hive/hive.dart';
import 'package:online_shop/data/entity/product.dart';

abstract class IProductLocalDataSource<T> {
  Future<List<T>> getAllProduct();
  Future<T> addProducts(T productEntity);
  Future<void> deleteProduct(int idProduct);
}

class ProductLocalDataSource implements IProductLocalDataSource<ProductEntity> {
  final Box<ProductEntity> box;
  ProductLocalDataSource(this.box);

  @override
  Future<void> deleteProduct(int idProduct) {
    return box.delete(idProduct);
  }

  @override
  Future<List<ProductEntity>> getAllProduct() async {
    return box.values.toList();
  }

  @override
  Future<ProductEntity> addProducts(ProductEntity productEntity) async {
    if (box.containsKey(productEntity.id)) {
      await box.delete("prodcut_cart");
    } else {
      await box.add(productEntity);
    }
    return productEntity;
  }
}
