import 'package:hive/hive.dart';

import '../../../main.dart';
import '../../entity/product_entity.dart';

abstract class IFavoriteProductLocalDataSource<T> {
  Future<List<T>> getAllProduct();
  Future<T> addProducts(T productEntity);
  Future<void> deleteProduct(int idProduct);
}

class FavoriteProductLocalDataSource
    implements IFavoriteProductLocalDataSource<ProductEntity> {
  final Box<ProductEntity> box;
  FavoriteProductLocalDataSource(this.box);

  @override
  Future<void> deleteProduct(int idProduct) {
    return box.delete(idProduct);
  }

  @override
  Future<List<ProductEntity>> getAllProduct() async {
    Future.delayed(const Duration(seconds: 2));
    return box.values.toList();
  }

  @override
  Future<ProductEntity> addProducts(ProductEntity productEntity) async {
    if (box.containsKey(productEntity.id)) {
      await box.delete(producBoxName);
    } else {
      await box.add(productEntity);
    }
    return productEntity;
  }
}