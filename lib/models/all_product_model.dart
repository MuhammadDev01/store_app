class ProductModel {
  final int id;
   String title;
   String price;
   String description;
   String? category;
   String? image;
   RatingModel rating;

  ProductModel({
    required this.id,
    required this.title,
    required this.price,
    required this.description,
    this.category,
    this.image,
    required this.rating,
  });
  factory ProductModel.fromjson(jsonData) {
    return ProductModel(
      id: jsonData['id'],
      title: jsonData['title'],
      price: jsonData['price'].toString(),
      description: jsonData['description'],
      category: jsonData['category'],
      image: jsonData['image'],
      rating: RatingModel.fromjson(jsonData['rating']),
    );
  }
}

class RatingModel {
  final String rate;
  final String count;
  RatingModel({
    required this.rate,
    required this.count,
  });
  factory RatingModel.fromjson(jsonData) {
    return RatingModel(
      rate: jsonData['rate'].toString(),
      count: jsonData['count'].toString(),
    );
  }
}
