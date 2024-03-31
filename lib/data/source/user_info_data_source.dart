import 'package:dio/dio.dart';
import 'package:watchstore/data/api_links.dart';
import 'package:watchstore/data/model/order_model.dart';
import 'package:watchstore/data/model/user_info_model/address_model.dart';
import 'package:watchstore/data/model/user_info_model/user_info.dart';
import 'package:watchstore/data/model/user_info_model/user_info_model.dart';
import 'package:watchstore/utils/response_validator.dart';

abstract class IUserInfoDataSource {
  Future<UserInfoModelTotal> getUserInfo();
  Future<AddressModel> getUserAddresses();
  Future<OrderModel> userReceivedOrders();
  Future<OrderModel> userCancelledOrders();
  Future<OrderModel> userProcessingOrders();
}

class UserInfoRemoteDataSource implements IUserInfoDataSource {
  final Dio httpClient;

  UserInfoRemoteDataSource({required this.httpClient});
  @override
  Future<UserInfoModelTotal> getUserInfo() async {
    UserInfoModelTotal userInfoModel;
    var response = await httpClient.post(ApisLink.baseUrl + ApisLink.profile);
    HttpResponseValidator.isValidateStatusCode(response.statusCode ?? 0);
    userInfoModel = UserInfoModelTotal.fromJson(response.data["data"]);

    return userInfoModel;
  }

  @override
  Future<AddressModel> getUserAddresses() {
    // TODO: implement getUserAddresses
    throw UnimplementedError();
  }

  @override
  Future<OrderModel> userCancelledOrders() {
    // TODO: implement userCancelledOrders
    throw UnimplementedError();
  }

  @override
  Future<OrderModel> userProcessingOrders() {
    // TODO: implement userProcessingOrders
    throw UnimplementedError();
  }

  @override
  Future<OrderModel> userReceivedOrders() {
    // TODO: implement userReceivedOrders
    throw UnimplementedError();
  }
}
