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

class CartItemDeleteState extends CartState {}

class CartItemRemovedState extends CartState {}

class CartItemAddedState extends CartState {}

class CartCountState extends CartState {}
