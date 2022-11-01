import 'package:hive/hive.dart';

import '../../entity/product_entity.dart';

abstract class IFavoriteProductLocalDataSource<T> {
  Future<List<T>> getAllProduct();
  Future<T> addProducts(T productEntity);
  Future<void> deleteProduct();
}

class FavoriteProductLocalDataSource
    implements IFavoriteProductLocalDataSource<ProductEntity> {
  final Box<ProductEntity> box;
  FavoriteProductLocalDataSource(this.box);

  @override
  Future<void> deleteProduct() {
    return box.clear();
  }

  @override
  Future<List<ProductEntity>> getAllProduct() async {
    Future.delayed(const Duration(seconds: 2));
    return box.values.toList();
  }

  @override
  Future<ProductEntity> addProducts(ProductEntity productEntity) async {
    if (box.containsKey(productEntity.id)) {
      await box.delete(productEntity.id);
    } else {
      await box.put(productEntity.id, productEntity);
    }
    return productEntity;
  }
}
