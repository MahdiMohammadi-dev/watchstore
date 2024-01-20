import 'package:dio/dio.dart';
import 'package:watchstore/component/exception.dart';

validateResposne(Response response) {
  if (response.statusCode != 200) {
    throw AppException();
  }
}
