import 'package:dio/dio.dart';
import 'package:watchstore/data/api_links.dart';
import 'package:watchstore/data/model/cart_model.dart';
import 'package:watchstore/utils/response_validator.dart';

abstract class ICartDataSource {
  Future<List<CartModel>> userCart();
  Future<List<CartModel>> addToCart({required int productId});
  Future<List<CartModel>> removeFromCart({required int productId});
  Future<List<CartModel>> deleteFromCart({required int productId});
  Future<int> countCartItemInit();
}

class CartRemoteDataSource implements ICartDataSource {
  final Dio httpClient;

  CartRemoteDataSource({required this.httpClient});

  //* add to cart method
  @override
  Future<List<CartModel>> addToCart({required int productId}) async =>
      await httpClient.post(ApisLink.baseUrl + ApisLink.addToCart,
          data: {'product_id': productId}).then((value) {
        final List<CartModel> cartModel = <CartModel>[];
        HttpResponseValidator.isValidateStatusCode(value.statusCode ?? 0);
        for (var element in (value.data['data']['user_cart'] as List)) {
          cartModel.add(CartModel.fromJson(element));
        }

        return cartModel;
      });

//* delete from cart method

  @override
  Future<List<CartModel>> deleteFromCart({required int productId}) async =>
      await httpClient.post(ApisLink.baseUrl + ApisLink.deleteFromCart,
          data: {'product_id': productId}).then((value) {
        final List<CartModel> cartModel = <CartModel>[];
        HttpResponseValidator.isValidateStatusCode(value.statusCode ?? 0);
        for (var element in (value.data['data']['user_cart'] as List)) {
          cartModel.add(CartModel.fromJson(element));
        }
        return cartModel;
      });

//* reomve from cart method
  @override
  Future<List<CartModel>> removeFromCart({required int productId}) async =>
      await httpClient.post(ApisLink.baseUrl + ApisLink.removeFromCart,
          data: {'product_id': productId}).then((value) {
        final List<CartModel> cartModel = <CartModel>[];
        HttpResponseValidator.isValidateStatusCode(value.statusCode ?? 0);
        for (var element in (value.data['data']['user_cart'] as List)) {
          cartModel.add(CartModel.fromJson(element));
        }
        return cartModel;
      });

//* get user cart method
  @override
  Future<List<CartModel>> userCart() async {
    final List<CartModel> cartModel = <CartModel>[];
    var response = await httpClient.post(ApisLink.baseUrl + ApisLink.userCart);
    HttpResponseValidator.isValidateStatusCode(response.statusCode ?? 0);
    for (var element in (response.data['data']['user_cart'] as List)) {
      cartModel.add(CartModel.fromJson(element));
    }
    print('THis is ALLLLL List ${cartModel.toString()}');
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
