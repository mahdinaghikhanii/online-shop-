import 'package:hive/hive.dart';

class ProdcutSort {
  final String electronics = "electronics";
  final String jewelery = "jewelery";
  final String mensclothing = "men's clothing";
  final String womensclothing = "women's clothing";
  final String allProduct = "products";
}

@HiveType(typeId: 0)
class ProductEntity {
  @HiveField(0)
  final int id;
  @HiveField(1)
  final String title;
  @HiveField(2)
  final double price;
  @HiveField(3)
  final String description;
  @HiveField(4)
  final String category;
  @HiveField(5)
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

@HiveType(typeId: 1)
class RatingEntity {
  @HiveField(0)
  final double rate;
  @HiveField(1)
  final int count;

  RatingEntity.formJson(Map<String, dynamic> json)
      : rate = json['rate'].toDouble(),
        count = json['count'];
}
