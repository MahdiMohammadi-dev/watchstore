import 'package:dio/dio.dart';
import 'package:watchstore/data/model/home_model.dart';
import 'package:watchstore/data/source/home_data_source.dart';

final homeRepository =
    HomeRepositoryRemote(dataSource: HomeDataSourceRemote(httpClient: Dio()));

abstract class IHomeRepository {
  Future<HomeModel> getHome();
}

class HomeRepositoryRemote implements IHomeRepository {
  final IHomeDataSource dataSource;

  HomeRepositoryRemote({required this.dataSource});
  @override
  Future<HomeModel> getHome() => dataSource.getHome();
}
