class OrderModel {
  int id;
  int code;
  String status;
  List<OrderDetail> orderDetails;

  OrderModel({
    required this.id,
    required this.code,
    required this.status,
    required this.orderDetails,
  });

  factory OrderModel.fromJson(Map<String, dynamic> json) {
    return OrderModel(
      id: json['id'],
      code: json['code'],
      status: json['status'],
      orderDetails: (json['order_details'])
          .map((detail) => OrderDetail.fromJson(detail))
          .toList(),
    );
  }
}

class OrderDetail {
  int id;
  String product;
  int count;
  int price;
  int discountPrice;
  String status;

  OrderDetail({
    required this.id,
    required this.product,
    required this.count,
    required this.price,
    required this.discountPrice,
    required this.status,
  });

  factory OrderDetail.fromJson(Map<String, dynamic> json) {
    return OrderDetail(
      id: json['id'] as int,
      product: json['product'] as String,
      count: json['count'] as int,
      price: json['price'] as int,
      discountPrice: json['discount_price'] as int,
      status: json['status'] as String,
    );
  }
}
