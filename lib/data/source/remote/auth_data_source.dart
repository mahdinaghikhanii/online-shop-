import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/widgets.dart';
import '../../common/http_validate_respone.dart';
import '../../entity/auth.dart';

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
    Map<String, dynamic> body = {
      "username": email,
      "password": password,
    };
    final respone = await httpClient.post("auth/login", data: jsonEncode(body));
    debugPrint(respone.toString());

    validateRespone(respone);
    return AuthEntity(respone.data.toString());
  }

  @override
  Future<AuthEntity> signUp(String email, String password) {
    throw UnimplementedError();
  }
}
