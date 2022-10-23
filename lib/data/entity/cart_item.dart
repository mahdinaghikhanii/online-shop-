class CartItemEntity {
  final int productId;
  final int quantity;

  CartItemEntity.fromJson(Map<String, dynamic> json)
      : productId = json["productId"],
        quantity = json['quantity'];

  static List<CartItemEntity> parsJsonArray(List<dynamic> jsonArray) {
    final List<CartItemEntity> cartJson = [];

    for (var element in jsonArray) {
      cartJson.add(CartItemEntity.fromJson(element));
    }
    return cartJson;
  }
}
