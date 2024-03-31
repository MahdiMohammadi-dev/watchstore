import 'package:watchstore/data/model/cart_model.dart';

class UserCartModel {
  List<CartModel> cartList;
  int cartTotalPrice;
  int totalWithoutDiscountPrice;

  UserCartModel({
    required this.cartList,
    required this.cartTotalPrice,
    required this.totalWithoutDiscountPrice,
  });

  factory UserCartModel.fromJson(Map<String, dynamic> json) {
    var userCartList = json['user_cart'] as List;
    List<CartModel> cartItems =
        userCartList.map((item) => CartModel.fromJson(item)).toList();

    return UserCartModel(
      cartList: cartItems,
      cartTotalPrice: json['cart_total_price'],
      totalWithoutDiscountPrice: json['total_without_discount_price'],
    );
  }
}
