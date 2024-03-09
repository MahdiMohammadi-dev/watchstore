part of 'product_list_bloc.dart';

sealed class ProductListEvent extends Equatable {
  const ProductListEvent();

  @override
  List<Object> get props => [];
}

class ProductListInit extends ProductListEvent {
  final params;

  const ProductListInit({required this.params});
}
