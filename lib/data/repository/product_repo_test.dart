import 'package:dio/dio.dart';
import 'package:watchstore/data/api_links.dart';
import 'package:watchstore/data/repository/product_repository.dart';
import 'package:watchstore/data/source/product_datasource.dart';

class ProductTestRepo {
  final repotest = ProductRemoteRepository(
      dataSource: RemoteProductDataSource(httpClient: Dio()));

  getproduct() async => await repotest.getSorted(ApisLink.newestProduct);
}
