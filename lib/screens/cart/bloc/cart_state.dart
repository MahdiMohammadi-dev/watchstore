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
  final UserCartModel userCartModel;

  CartSuccessLoaded({
    required this.userCartModel,
  });
  @override
  // TODO: implement props
  List<Object> get props => [userCartModel];
}

class CartItemDeleteState extends CartState {
  final UserCartModel userCartModel;

  CartItemDeleteState({required this.userCartModel});
  @override
  // TODO: implement props
  List<Object> get props => [userCartModel];
}

class CartItemRemovedState extends CartState {
  final UserCartModel userCartModel;

  CartItemRemovedState({required this.userCartModel});
  @override
  // TODO: implement props
  List<Object> get props => [userCartModel];
}

class CartItemAddedState extends CartState {
  final UserCartModel userCartModel;

  CartItemAddedState({required this.userCartModel});
  @override
  // TODO: implement props
  List<Object> get props => [userCartModel];
}

class CartCountState extends CartState {}

class paymentState extends CartState {
  final String url;

  paymentState({required this.url});

  @override
  // TODO: implement props
  List<Object> get props => [url];
}
