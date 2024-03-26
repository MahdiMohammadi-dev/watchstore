part of 'cart_bloc.dart';

sealed class CartState extends Equatable {
  const CartState();

  @override
  List<Object> get props => [];
}

final class CartInitialState extends CartState {}

class CartLoadingState extends CartState {}

class CartErrorState extends CartState {
  final AppException appException;

  CartErrorState({required this.appException});
}

class CartSuccessLoaded extends CartState {
  final List<CartModel> cartList;

  CartSuccessLoaded({required this.cartList});
}

class CartItemDeleteState extends CartState {
  final List<CartModel> cartList;

  CartItemDeleteState({required this.cartList});
}

class CartItemRemovedState extends CartState {
  final List<CartModel> cartList;

  CartItemRemovedState({required this.cartList});
}

class CartItemAddedState extends CartState {
  final List<CartModel> cartList;

  CartItemAddedState({required this.cartList});
}

class CartCountState extends CartState {}
