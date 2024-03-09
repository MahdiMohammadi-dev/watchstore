import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:watchstore/component/exception.dart';
import 'package:watchstore/data/model/product_model.dart';
import 'package:watchstore/data/repository/product_repository.dart';

part 'product_list_event.dart';
part 'product_list_state.dart';

class ProductListBloc extends Bloc<ProductListEvent, ProductListState> {
  final IProductRepository iProductRepository;
  ProductListBloc(this.iProductRepository) : super(ProductListLoading()) {
    on<ProductListEvent>((event, emit) async {
      if (event is ProductListInit) {
        try {
          emit(ProductListLoading());
          final productList =
              await iProductRepository.getAllByCategory(event.params);
          emit(ProductListSuccess(productList!));
        } catch (e) {
          debugPrint('This is Bug ==>$e');
        }
      }
    });
  }
}
