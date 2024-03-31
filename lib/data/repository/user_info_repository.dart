import 'package:watchstore/data/config/remote_config.dart';
import 'package:watchstore/data/model/order_model.dart';
import 'package:watchstore/data/model/user_info_model/address_model.dart';
import 'package:watchstore/data/model/user_info_model/user_info_model.dart';
import 'package:watchstore/data/source/user_info_data_source.dart';

final userRepository = UserInfoRemoteRepository(
    iUserInfoDataSource: UserInfoRemoteDataSource(httpClient: DioManager.dio));

abstract class IUserInfoRepository {
  Future<UserInfoModelTotal> getUserInfo();
  Future<AddressModel> getUserAddresses();
  Future<OrderModel> userReceivedOrders();
  Future<OrderModel> userCancelledOrders();
  Future<OrderModel> userProcessingOrders();
}

class UserInfoRemoteRepository implements IUserInfoRepository {
  final IUserInfoDataSource iUserInfoDataSource;

  UserInfoRemoteRepository({required this.iUserInfoDataSource});
  @override
  Future<UserInfoModelTotal> getUserInfo() => iUserInfoDataSource.getUserInfo();

  @override
  Future<AddressModel> getUserAddresses() =>
      iUserInfoDataSource.getUserAddresses();

  @override
  Future<OrderModel> userCancelledOrders() =>
      iUserInfoDataSource.userCancelledOrders();

  @override
  Future<OrderModel> userProcessingOrders() =>
      iUserInfoDataSource.userProcessingOrders();
  @override
  Future<OrderModel> userReceivedOrders() =>
      iUserInfoDataSource.userReceivedOrders();
}
