part of 'cart_bloc.dart';

sealed class CartEvent extends Equatable {
  const CartEvent();

  @override
  List<Object> get props => [];
}

class CartInitEvent extends CartEvent {}

class CartCountEvent extends CartEvent {}

class AddToCartEvent extends CartEvent {
  final int productId;

  AddToCartEvent({required this.productId});
}

class RemoveFromCart extends CartEvent {
  final int productId;

  RemoveFromCart({required this.productId});
}

class DeleteFromCart extends CartEvent {
  final int productId;

  DeleteFromCart({required this.productId});
}

class paymentEvent extends CartEvent {}
