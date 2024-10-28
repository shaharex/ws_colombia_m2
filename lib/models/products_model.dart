class ProductsModel {
  List<Product>? productsList;

  ProductsModel.fromJson(Map<String, dynamic> json) {
    productsList = [];
    for (var product in json['products']) {
      productsList!.add(Product.fromJson(product));
    }
  }
}



class Product {
  final int id;
  final String title;
  final String description;
  final String category;
  final double price;
  final double rating;
  final String thumbnail;

  Product({
    required this.id,
    required this.title,
    required this.description,
    required this.category,
    required this.price,
    required this.rating,
    required this.thumbnail,
  });

  static Product fromJson(Map<String, dynamic> json) => Product(
        id: json['id'],
        title:  json['title'],
        description: json['description'],
        category: json['category'],
        price: json['price'],
        rating: json['rating'],
        thumbnail: json['thumbnail'],
      );
}
