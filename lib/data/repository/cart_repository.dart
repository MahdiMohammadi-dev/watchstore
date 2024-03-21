import 'package:flutter/material.dart';
import 'package:watchstore/data/config/remote_config.dart';
import 'package:watchstore/data/model/user_cart.dart';
import 'package:watchstore/data/source/cart_datasource.dart';

final cartRepository = CartRepository(
    iCartDataSource: CartRemoteDataSource(httpClient: DioManager.dio));

abstract class ICartRepository {
  Future<List<CartModel>> userCart();
  Future<int> addToCart({required int productId});
  Future<void> removeFromCart({required int productId});
  Future<int> deleteFromCart({required int productId});
  Future<int> countCartItemInit();
}

class CartRepository implements ICartRepository {
  final ICartDataSource iCartDataSource;

  ValueNotifier<int> cartCount = ValueNotifier(0);

  CartRepository({required this.iCartDataSource});
  @override
  Future<int> addToCart({required int productId}) => iCartDataSource
      .addToCart(productId: productId)
      .then((value) => cartCount.value = value);

  @override
  Future<int> deleteFromCart({required int productId}) => iCartDataSource
      .deleteFromCart(productId: productId)
      .then((value) => cartCount.value = value);

  @override
  Future<void> removeFromCart({required int productId}) =>
      iCartDataSource.removeFromCart(productId: productId);

  @override
  Future<List<CartModel>> userCart() => iCartDataSource.userCart();

  @override
  Future<int> countCartItemInit() => cartRepository
      .countCartItemInit()
      .then((value) => cartCount.value = value);
}
