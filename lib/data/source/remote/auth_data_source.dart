import 'package:dio/dio.dart';
import 'package:flutter/widgets.dart';
import 'package:online_shop/data/common/http_validate_respone.dart';
import 'package:online_shop/data/entity/auth.dart';

abstract class IRemoteAuthDataSource {
  Future<AuthEntity> login(String email, String password);
  Future<AuthEntity> signUp(String email, String password);
  Future<AuthEntity> signOut();
}

class RemoteAuthDataSource
    with HttpValidateRespone
    implements IRemoteAuthDataSource {
  final Dio httpClient;
  RemoteAuthDataSource(this.httpClient);

  @override
  Future<AuthEntity> signOut() {
    throw UnimplementedError();
  }

  @override
  Future<AuthEntity> login(String email, String password) async {
    final respone = await httpClient
        .post("auth/login", data: {"username": email, "password": password});
    debugPrint(respone.data);

    validateRespone(respone);
    return AuthEntity(respone.data["token"]);
  }

  @override
  Future<AuthEntity> signUp(String email, String password) {
    throw UnimplementedError();
  }
}
