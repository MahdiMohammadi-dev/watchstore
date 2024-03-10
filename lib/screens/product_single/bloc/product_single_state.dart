part of 'product_single_bloc.dart';

sealed class ProductSingleState extends Equatable {
  const ProductSingleState();

  @override
  List<Object> get props => [];
}

class ProductSingleLoading extends ProductSingleState {}

class ProductSingleLoaded extends ProductSingleState {
  final ProductDetailsModel productDetails;
  const ProductSingleLoaded(this.productDetails);
}

class ProductSingleError extends ProductSingleState {
  final String message;
  const ProductSingleError(this.message);
}
