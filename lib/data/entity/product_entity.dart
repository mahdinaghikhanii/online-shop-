import 'package:hive/hive.dart';

part 'product_entity.g.dart';

class ProdcutSort {
  final String electronics = "electronics";
  final String jewelery = "jewelery";
  final String mensclothing = "men's clothing";
  final String womensclothing = "women's clothing";
  final String allProduct = "products";
  final String allCart = "carts";
}

@HiveType(typeId: 5)
class ProductEntity extends HiveObject {
  @HiveField(0)
  int id;
  @HiveField(1)
  String title;
  @HiveField(2)
  double price;
  @HiveField(3)
  String description;
  @HiveField(4)
  String category;
  @HiveField(5)
  String image;
  @HiveField(6)
  RatingEntity ratingEntity;

  bool addtoCartLoading = false;

  ProductEntity(this.category, this.description, this.id, this.image,
      this.price, this.ratingEntity, this.title);

  ProductEntity.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        title = json['title'],
        price = json['price'] == null ? 0.0 : json['price'].toDouble(),
        description = json['description'],
        category = json['category'],
        image = json['image'],
        ratingEntity = RatingEntity.formJson(json["rating"]);
}

@HiveType(typeId: 6)
class RatingEntity extends HiveObject {
  @HiveField(0)
  double rate;
  @HiveField(1)
  int count;

  RatingEntity(this.count, this.rate);

  RatingEntity.formJson(Map<String, dynamic> json)
      : rate = json['rate'].toDouble(),
        count = json['count'];
}
