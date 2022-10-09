import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

abstract class IRemoteProductCategoryDataSource {
  Future<List<Category>> getAllProductCategory();
}

class RemoteProductCategoryDataSource
    implements IRemoteProductCategoryDataSource {
  final Dio httpClient;

  RemoteProductCategoryDataSource(this.httpClient);

  @override
  Future<List<Category>> getAllProductCategory() async {
    final respone = await httpClient.get("products/categories");

    List<Category> category = [];

    (respone.data as List).forEach((data) {
      category.add(data);
    });

    return category;
  }
}
