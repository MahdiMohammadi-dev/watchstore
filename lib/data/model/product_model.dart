class ProductModel {
  final int id;
  final String title;
  final int price;
  final int discount;
  final String special_expiration;
  final int discount_price;
  final int product_count;
  final String category;
  final String brand;
  final String image;

  ProductModel(
      {required this.id,
      required this.title,
      required this.price,
      required this.discount,
      required this.special_expiration,
      required this.discount_price,
      required this.product_count,
      required this.category,
      required this.brand,
      required this.image});

  factory ProductModel.fromJson(Map<String, dynamic> json) => ProductModel(
      id: json['id'],
      title: json['title'],
      price: json['price'],
      discount: json['discount'],
      special_expiration: json['special_expiration'],
      discount_price: json['discount_price'],
      product_count: json['product_count'],
      category: json['category'],
      brand: json['brand'],
      image: json['image']);
}
