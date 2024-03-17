class CartModel {
  int id;
  int productId;
  String product;
  int count;

  CartModel(
      {required this.id,
      required this.productId,
      required this.product,
      required this.count});

  factory CartModel.fromJson(Map<String, dynamic> json) => CartModel(
        id: json['id'],
        productId: json['product_id'],
        product: json['product'],
        count: json['count'],
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'product_id': productId,
        'product': product,
        'count': count,
      };
}
