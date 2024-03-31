import 'package:flutter/material.dart';
import 'package:watchstore/data/config/remote_config.dart';
import 'package:watchstore/data/model/user_cart_model.dart';
import 'package:watchstore/data/source/cart_datasource.dart';

final cartRepository = CartRepository(
    iCartDataSource: CartRemoteDataSource(httpClient: DioManager.dio));

abstract class ICartRepository {
  Future<UserCartModel> userCart();
  Future<UserCartModel> addToCart({required int productId});
  Future<UserCartModel> removeFromCart({required int productId});
  Future<UserCartModel> deleteFromCart({required int productId});
  Future<int> countCartItemInit();
  Future<String> payment();
}

class CartRepository implements ICartRepository {
  final ICartDataSource iCartDataSource;

  ValueNotifier<int> cartCount = ValueNotifier(0);

  CartRepository({required this.iCartDataSource});
  @override
  Future<UserCartModel> addToCart({required int productId}) =>
      iCartDataSource.addToCart(productId: productId).then((value) {
        cartCount.value = value.cartList.length;
        return value;
      });

  @override
  Future<UserCartModel> deleteFromCart({required int productId}) =>
      iCartDataSource.deleteFromCart(productId: productId).then((value) {
        cartCount.value = value.cartList.length;
        return value;
      });

  @override
  Future<UserCartModel> removeFromCart({required int productId}) =>
      iCartDataSource.removeFromCart(productId: productId);

  @override
  Future<UserCartModel> userCart() => iCartDataSource.userCart();

  @override
  Future<int> countCartItemInit() => cartRepository
      .countCartItemInit()
      .then((value) => cartCount.value = value);

  @override
  Future<String> payment() => iCartDataSource.payment();
}
