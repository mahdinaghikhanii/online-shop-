import 'dart:ffi';

import 'package:flutter/widgets.dart';
import 'package:online_shop/common/http_client.dart';
import 'package:online_shop/data/entity/auth.dart';

import 'package:online_shop/data/source/remote/auth_data_source.dart';
import 'package:shared_preferences/shared_preferences.dart';

final authRepository = AuthRepository(RemoteAuthDataSource(httpClients));

abstract class IAuthRepository {
  Future<void> login(String emial, String password);
  Future<void> signUp(String email, String password);
  Future<Void> singOut(String email, String password);
}

class AuthRepository implements IAuthRepository {
  static final ValueNotifier<AuthEntity?> authChangeNotifire =
      ValueNotifier(null);
  IRemoteAuthDataSource dataSource;
  AuthRepository(this.dataSource);
  @override
  Future<void> login(String email, String password) async {
    final AuthEntity authEntity = await dataSource.login(email, password);
    _persisAuthTokens(authEntity);
  }

  @override
  Future<void> signUp(String email, String password) {
    throw UnimplementedError();
  }

  @override
  Future<Void> singOut(String email, String password) {
    throw UnimplementedError();
  }

  Future<void> _persisAuthTokens(AuthEntity authEntity) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    sharedPreferences.setString("acces_token", authEntity.token);
    loadInfo();
  }

  Future<void> loadInfo() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    final String accessToken = sharedPreferences.getString("key") ?? "";
    if (accessToken.isNotEmpty) {
      authChangeNotifire.value = AuthEntity(accessToken);
    }
  }
}
