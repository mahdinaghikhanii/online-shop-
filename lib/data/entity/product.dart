class ProductEntity {
  final int id;
  final String title;
  final String price;
  final String description;
  final String category;
  final String image;
  final RatingEntity ratingEntity;

  ProductEntity.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        title = json['title'],
        price = json['price'],
        description = json['description'],
        category = json['category'],
        image = json['image'],
        ratingEntity = json['rating'];
}

class RatingEntity {
  final String rate;
  final String count;

  RatingEntity.formJson(Map<String, dynamic> json)
      : rate = json['rate'],
        count = json['count'];
}
