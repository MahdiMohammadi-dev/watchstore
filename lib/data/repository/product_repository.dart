import 'package:watchstore/data/model/product_model.dart';
import 'package:watchstore/data/source/product_datasource.dart';

abstract class IProductRepository {
  Future<List<ProductModel>>? getAllByCategory(int id);
  Future<List<ProductModel>>? getAllByBrand(int id);
  Future<List<ProductModel>>? getSorted(String routeParameters);
  Future<List<ProductModel>>? searchProduct(String search);
}

class ProductRemoteRepository implements IProductRepository {
  final IProductDataSource dataSource;

  ProductRemoteRepository({required this.dataSource});
  @override
  Future<List<ProductModel>>? getAllByBrand(int id) =>
      dataSource.getAllByBrand(id);

  @override
  Future<List<ProductModel>>? getAllByCategory(int id) =>
      dataSource.getAllByCategory(id);

  @override
  Future<List<ProductModel>>? getSorted(String routeParameters) =>
      dataSource.getSorted(routeParameters);

  @override
  Future<List<ProductModel>>? searchProduct(String search) =>
      dataSource.searchProduct(search);
}
