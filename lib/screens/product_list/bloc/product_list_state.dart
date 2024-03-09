part of 'product_list_bloc.dart';

sealed class ProductListState extends Equatable {
  const ProductListState();

  @override
  List<Object> get props => [];
}

class ProductListLoading extends ProductListState {}

class ProductListSuccess extends ProductListState {
  final List<ProductModel> productList;

  ProductListSuccess(this.productList);
}

class ProductListError extends ProductListState {
  final AppException appException;

  ProductListError({required this.appException});

  @override
  List<Object> get props => [appException];
}
