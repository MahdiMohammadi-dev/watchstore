import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:watchstore/component/exception.dart';
import 'package:watchstore/data/model/cart_model.dart';
import 'package:watchstore/data/model/user_cart_model.dart';
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
          emit(CartSuccessLoaded(
            userCartModel: cartList,
          ));
        } else if (event is AddToCartEvent) {
          emit(CartLoadingState());
          var response = await iCartRepository
              .addToCart(productId: event.productId)
              .then((value) => emit(CartItemAddedState(userCartModel: value)));
        } else if (event is RemoveFromCart) {
          emit(CartLoadingState());
          var response = await iCartRepository
              .removeFromCart(productId: event.productId)
              .then(
                  (value) => emit(CartItemRemovedState(userCartModel: value)));
        } else if (event is DeleteFromCart) {
          emit(CartLoadingState());
          var response = await iCartRepository
              .deleteFromCart(productId: event.productId)
              .then((value) => emit(CartItemDeleteState(userCartModel: value)));
        } else if (event is CartCountEvent) {
          await iCartRepository
              .countCartItemInit()
              .then((value) => emit(CartCountState()));
        } else if (event is paymentEvent) {
          emit(CartLoadingState());
          var response = await iCartRepository.payment();
          emit(paymentState(url: response));
        }
      } catch (e) {
        debugPrint('EXCEPTION===>${e.toString()}');
        emit(CartErrorState(appException: AppException()));
      }
    });
  }
}
