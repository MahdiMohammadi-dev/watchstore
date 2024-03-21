import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:watchstore/component/exception.dart';
import 'package:watchstore/data/model/user_cart.dart';
import 'package:watchstore/data/repository/cart_repository.dart';

part 'cart_event.dart';
part 'cart_state.dart';

class CartBloc extends Bloc<CartEvent, CartState> {
  final ICartRepository iCartRepository;
  CartBloc(this.iCartRepository) : super(CartInitialState()) {
    on<CartEvent>((event, emit) async {
      try {
        if (event is CartInitEvent) {
          emit(CartLoadingState());
          var cartList = await iCartRepository.userCart();
          emit(CartSuccessLoaded(cartList: cartList));
        } else if (event is AddToCartEvent) {
          emit(CartLoadingState());
          var response =
              await iCartRepository.addToCart(productId: event.productId);
          emit(CartItemAddedState());
        } else if (event is RemoveFromCart) {
          var response =
              await iCartRepository.removeFromCart(productId: event.productId);
          emit(CartItemRemovedState());
        } else if (event is deleteFromCart) {
          var response =
              await iCartRepository.deleteFromCart(productId: event.productId);
          emit(CartItemDeleteState());
        } else if (event is CartCountEvent) {
          var response = await iCartRepository.countCartItemInit;
          emit(CartCountState());
        }
      } catch (e) {
        debugPrint('EXCEPTION===>${e.toString()}');
        emit(CartErrorState(appException: AppException()));
      }
    });
  }
}
