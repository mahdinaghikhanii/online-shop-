import 'package:dio/dio.dart';
import '../../common/http_validate_respone.dart';
import '../../entity/category.dart';

abstract class IRemoteProductCategoryDataSource {
  Future<List<CategoryEntity>> getAllProductCategory();
}

class RemoteProductCategoryDataSource
    with HttpValidateRespone
    implements IRemoteProductCategoryDataSource {
  final Dio httpClient;

  RemoteProductCategoryDataSource(this.httpClient);

  @override
  Future<List<CategoryEntity>> getAllProductCategory() async {
    final respone = await httpClient.get("products/categories");
    validateRespone(respone);

    List<CategoryEntity> category = [];

    for (var data in (respone.data as List)) {
      category.add(CategoryEntity(data));
    }

    return category;
  }
}
