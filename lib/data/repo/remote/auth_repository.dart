import 'package:flutter/widgets.dart';
import '../../../common/http_client.dart';
import '../../entity/auth.dart';

import '../../source/remote/auth_data_source.dart';
import 'package:shared_preferences/shared_preferences.dart';

final authRepository = AuthRepository(RemoteAuthDataSource(httpClients));

abstract class IAuthRepository {
  Future<void> login(String emial, String password);
  Future<void> signUp(String email, String password);
  Future<void> singOut();
}

class AuthRepository implements IAuthRepository {
  static final ValueNotifier<AuthEntity?> authChangeNotifire =
      ValueNotifier(null);
  final IRemoteAuthDataSource dataSource;
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

  Future<void> _persisAuthTokens(AuthEntity authEntity) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    sharedPreferences.setString("acces_token", authEntity.token);
    await loadInfo();
  }

  Future<void> loadInfo() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    final String accessToken = sharedPreferences.getString("acces_token") ?? "";
    if (accessToken.isNotEmpty) {
      authChangeNotifire.value = AuthEntity(accessToken);
    }
  }

  @override
  Future<void> singOut() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    sharedPreferences.clear();
    sharedPreferences.remove("acces_token");
  }
}
