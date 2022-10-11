class CartEntity {
  final int id;
  final int userId;
  final String date;

  CartEntity.fromjson(Map<String, dynamic> json)
      : id = json['id'],
        userId = json['userId'],
        date = json['data'];
}
