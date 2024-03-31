import 'package:dio/dio.dart';
import 'package:watchstore/data/api_links.dart';
import 'package:watchstore/data/model/cart_model.dart';
import 'package:watchstore/data/model/user_cart_model.dart';
import 'package:watchstore/utils/response_validator.dart';

abstract class ICartDataSource {
  Future<UserCartModel> userCart();
  Future<UserCartModel> addToCart({required int productId});
  Future<UserCartModel> removeFromCart({required int productId});
  Future<UserCartModel> deleteFromCart({required int productId});
  Future<int> countCartItemInit();
  Future<String> payment();
}

class CartRemoteDataSource implements ICartDataSource {
  final Dio httpClient;

  CartRemoteDataSource({required this.httpClient});

  //* add to cart method
  @override
  Future<UserCartModel> addToCart({required int productId}) async =>
      await httpClient.post(ApisLink.baseUrl + ApisLink.addToCart,
          data: {'product_id': productId}).then((value) {
        HttpResponseValidator.isValidateStatusCode(value.statusCode ?? 0);

        return UserCartModel.fromJson(value.data["data"]);
      });

//* delete from cart method

  @override
  Future<UserCartModel> deleteFromCart({required int productId}) async =>
      await httpClient.post(ApisLink.baseUrl + ApisLink.deleteFromCart,
          data: {'product_id': productId}).then((value) {
        HttpResponseValidator.isValidateStatusCode(value.statusCode ?? 0);
        return UserCartModel.fromJson(value.data["data"]);
      });

//* reomve from cart method
  @override
  Future<UserCartModel> removeFromCart({required int productId}) async =>
      await httpClient.post(ApisLink.baseUrl + ApisLink.removeFromCart,
          data: {'product_id': productId}).then((value) {
        HttpResponseValidator.isValidateStatusCode(value.statusCode ?? 0);

        return UserCartModel.fromJson(value.data["data"]);
      });

//* get user cart method
  @override
  Future<UserCartModel> userCart() async {
    var response = await httpClient.post(ApisLink.baseUrl + ApisLink.userCart);
    HttpResponseValidator.isValidateStatusCode(response.statusCode ?? 0);

    return UserCartModel.fromJson(response.data["data"]);
  }

  @override
  Future<int> countCartItemInit() async {
    final response =
        await httpClient.post(ApisLink.baseUrl + ApisLink.userCart);
    HttpResponseValidator.isValidateStatusCode(response.statusCode ?? 0);
    return (response.data['data']['user_cart'] as List).length;
  }

  @override
  Future<String> payment() async {
    final response = await httpClient.post(ApisLink.baseUrl + ApisLink.payment);
    HttpResponseValidator.isValidateStatusCode(response.statusCode ?? 0);
    return response.data['action'];
  }
}
