import 'package:dio/dio.dart';
import 'package:online_shop/data/entity/category.dart';

abstract class IRemoteProductCategoryDataSource {
  Future<List<CategoryEntity>> getAllProductCategory();
}

class RemoteProductCategoryDataSource
    implements IRemoteProductCategoryDataSource {
  final Dio httpClient;

  RemoteProductCategoryDataSource(this.httpClient);

  @override
  Future<List<CategoryEntity>> getAllProductCategory() async {
    final respone = await httpClient.get("products/categories");

    List<CategoryEntity> category = [];

    for (var data in (respone.data as List)) {
      category.add(CategoryEntity(data));
    }

    return category;
  }
}
