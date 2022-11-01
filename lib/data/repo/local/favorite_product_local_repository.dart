import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import '../../entity/product_entity.dart';
import '../../source/local/favorite_product_local_data_source.dart';

final favoriteproductLocalRepository = FavoriteProductLocalRepository(
    FavoriteProductLocalDataSource(Hive.box("product_cart_box")));

abstract class IFavoriteProductLocalRepository<T> {
  Future<List<T>> getAllProduct();
  Future<T> addProducts(T productEntity);
  Future<void> deleteProduct();
}

class FavoriteProductLocalRepository
    implements IFavoriteProductLocalRepository<ProductEntity> {
  static final ValueNotifier<int> countFavorite = ValueNotifier(0);
  FavoriteProductLocalDataSource dataSource;
  FavoriteProductLocalRepository(this.dataSource);

  @override
  Future<ProductEntity> addProducts(ProductEntity productEntity) {
    return dataSource.addProducts(productEntity);
  }

  @override
  Future<void> deleteProduct() {
    return dataSource.deleteProduct();
  }

  @override
  Future<List<ProductEntity>> getAllProduct() async {
    final allProduct = await dataSource.getAllProduct();
    countFavorite.value = allProduct.length;
    return allProduct;
  }
}
