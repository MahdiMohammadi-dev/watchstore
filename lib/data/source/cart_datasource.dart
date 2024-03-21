import 'package:dio/dio.dart';
import 'package:flutter/rendering.dart';
import 'package:watchstore/data/api_links.dart';
import 'package:watchstore/data/model/user_cart.dart';
import 'package:watchstore/utils/response_validator.dart';

abstract class ICartDataSource {
  Future<List<CartModel>> userCart();
  Future<int> addToCart({required int productId});
  Future<void> removeFromCart({required int productId});
  Future<int> deleteFromCart({required int productId});
  Future<int> countCartItemInit();
}

class CartRemoteDataSource implements ICartDataSource {
  final Dio httpClient;

  CartRemoteDataSource({required this.httpClient});

  //* add to cart method
  @override
  Future<int> addToCart({required int productId}) =>
      httpClient.post(ApisLink.baseUrl + ApisLink.addToCart,
          data: {'product_id': productId}).then((value) {
        debugPrint('object==> ${value.data}');
        HttpResponseValidator.isValidateStatusCode(value.statusCode ?? 0);
        return (value.data['data']['user_cart'] as List).length;
      });

//* delete from cart method

  @override
  Future<int> deleteFromCart({required int productId}) =>
      httpClient.post(ApisLink.baseUrl + ApisLink.deleteFromCart,
          data: {'product_id': productId}).then((value) {
        HttpResponseValidator.isValidateStatusCode(value.statusCode ?? 0);
        return (value.data['data']['user_cart'] as List).length;
      });

//* reomve from cart method
  @override
  Future<void> removeFromCart({required int productId}) =>
      httpClient.post(ApisLink.baseUrl + ApisLink.removeFromCart, data: {
        'product_id': productId
      }).then((value) =>
          HttpResponseValidator.isValidateStatusCode(value.statusCode ?? 0));

//* get user cart method
  @override
  Future<List<CartModel>> userCart() async {
    final List<CartModel> cartModel = <CartModel>[];
    var response = await httpClient.post(ApisLink.baseUrl + ApisLink.userCart);
    HttpResponseValidator.isValidateStatusCode(response.statusCode ?? 0);
    for (var element in (response.data['data']['user_cart'] as List)) {
      cartModel.add(CartModel.fromJson(element));
    }
    return cartModel;
  }

  @override
  Future<int> countCartItemInit() async {
    final response =
        await httpClient.post(ApisLink.baseUrl + ApisLink.userCart);
    HttpResponseValidator.isValidateStatusCode(response.statusCode ?? 0);
    return (response.data['data']['user_cart'] as List).length;
  }
}
