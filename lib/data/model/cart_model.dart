class CartModel {
  int id;
  int productId;
  bool deleteLoading;
  String product;
  int count;
  final image;
  final price;
  final discountPrice;
  bool cartLoading = false;
  CartModel(
      {required this.id,
      required this.productId,
      required this.image,
      required this.price,
      required this.discountPrice,
      required this.product,
      this.deleteLoading = false,
      this.cartLoading = false,
      required this.count});

  factory CartModel.fromJson(Map<String, dynamic> json) {
    return CartModel(
      discountPrice: json['discount_price'],
      id: json['id'],
      image: json['image'],
      price: json['price'],
      productId: json['product_id'],
      product: json['product'],
      count: json['count'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['product_id'] = productId;
    data['product'] = product;
    data['count'] = count;
    return data;
  }
}
