class ProdcutSort {
  final String electronics = "electronics";
  final String jewelery = "jewelery";
  final String mensclothing = "men's clothing";
  final String womensclothing = "women's clothing";
  final String allProduct = "products";
}

class ProductEntity {
  final int id;
  final String title;
  final double price;
  final String description;
  final String category;
  final String image;
  final RatingEntity ratingEntity;

  ProductEntity.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        title = json['title'],
        price = json['price'] == null ? 0.0 : json['price'].toDouble(),
        description = json['description'],
        category = json['category'],
        image = json['image'],
        ratingEntity = RatingEntity.formJson(json["rating"]);
}

class RatingEntity {
  final double rate;
  final int count;

  RatingEntity.formJson(Map<String, dynamic> json)
      : rate = json['rate'].toDouble(),
        count = json['count'];
}
