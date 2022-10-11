class AuthEntity {
  final String token;
  AuthEntity.fromJson(Map<String, dynamic> json) : token = json['token'];
}
