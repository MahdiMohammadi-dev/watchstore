import 'package:dio/dio.dart';
import 'package:watchstore/data/model/home_model.dart';
import 'package:watchstore/utils/response_validator.dart';

abstract class IHomeDataSource {
  Future<HomeModel> getHome();
}

class HomeDataSourceRemote implements IHomeDataSource {
  final Dio httpClient;

  HomeDataSourceRemote({required this.httpClient});
  @override
  Future<HomeModel> getHome() async {
    final HomeModel homeModel;
    final response = await httpClient
        .get('https://watchstore.sasansafari.com/public/api/v1/home');
    print('status code==> ${response.statusCode}');
    HttpResponseValidator.isValidateStatusCode(response.statusCode ?? 0);
    homeModel = HomeModel.fromJson(response.data['data']);
    print('Home Model Data ==>${response.data['data']['sliders']}');
    return homeModel;
  }
}
