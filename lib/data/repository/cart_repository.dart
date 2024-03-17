import 'package:watchstore/data/config/remote_config.dart';
import 'package:watchstore/data/model/user_cart.dart';
import 'package:watchstore/data/source/cart_datasource.dart';

final cartRepository = CartRepository(
    iCartDataSource: CartRemoteDataSource(httpClient: DioManager.dio));

abstract class ICartRepository {
  Future<List<CartModel>> userCart();
  Future<void> addToCart({required int productId});
  Future<void> removeFromCart({required int productId});
  Future<void> deleteFromCart({required int productId});
}

class CartRepository implements ICartRepository {
  final ICartDataSource iCartDataSource;

  CartRepository({required this.iCartDataSource});
  @override
  Future<void> addToCart({required int productId}) =>
      iCartDataSource.addToCart(productId: productId);

  @override
  Future<void> deleteFromCart({required int productId}) =>
      iCartDataSource.deleteFromCart(productId: productId);

  @override
  Future<void> removeFromCart({required int productId}) =>
      iCartDataSource.removeFromCart(productId: productId);

  @override
  Future<List<CartModel>> userCart() => iCartDataSource.userCart();
}
