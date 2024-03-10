import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:watchstore/data/model/product_details_model/product_details_model.dart';
import 'package:watchstore/data/repository/product_repository.dart';

part 'product_single_event.dart';
part 'product_single_state.dart';

class ProductSingleBloc extends Bloc<ProductSingleEvent, ProductSingleState> {
  final IProductRepository iProductRepository;

  ProductSingleBloc(this.iProductRepository) : super(ProductSingleLoading()) {
    on<ProductSingleEvent>((event, emit) async {
      if (event is ProductSingleInit) {
        try {
          emit(ProductSingleLoading());
          final response = await iProductRepository.getProductDetails(event.id);
          debugPrint('thhhhhhhh==$response');
          emit(ProductSingleLoaded(response!));
        } catch (e) {
          debugPrint(e.toString());
          emit(ProductSingleError(e.toString()));
        }
      }
    });
  }
}
