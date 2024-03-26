import 'package:flutter/material.dart';
import 'package:watchstore/data/config/remote_config.dart';
import 'package:watchstore/data/model/cart_model.dart';
import 'package:watchstore/data/source/cart_datasource.dart';

final cartRepository = CartRepository(
    iCartDataSource: CartRemoteDataSource(httpClient: DioManager.dio));

abstract class ICartRepository {
  Future<List<CartModel>> userCart();
  Future<List<CartModel>> addToCart({required int productId});
  Future<List<CartModel>> removeFromCart({required int productId});
  Future<List<CartModel>> deleteFromCart({required int productId});
  Future<int> countCartItemInit();
}

class CartRepository implements ICartRepository {
  final ICartDataSource iCartDataSource;

  ValueNotifier<int> cartCount = ValueNotifier(0);

  CartRepository({required this.iCartDataSource});
  @override
  Future<List<CartModel>> addToCart({required int productId}) =>
      iCartDataSource.addToCart(productId: productId).then((value) {
        cartCount.value = value.length;
        return value;
      });

  @override
  Future<List<CartModel>> deleteFromCart({required int productId}) =>
      iCartDataSource.deleteFromCart(productId: productId).then((value) {
        cartCount.value = value.length;
        return value;
      });

  @override
  Future<List<CartModel>> removeFromCart({required int productId}) =>
      iCartDataSource.removeFromCart(productId: productId);

  @override
  Future<List<CartModel>> userCart() => iCartDataSource.userCart();

  @override
  Future<int> countCartItemInit() => cartRepository
      .countCartItemInit()
      .then((value) => cartCount.value = value);
}
