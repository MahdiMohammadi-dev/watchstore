import 'package:watchstore/data/model/user_info_model/address_model.dart';

class UserInfo {
  int id;
  String name;
  String mobile;
  String phone;
  AddressModel address;

  UserInfo({
    required this.id,
    required this.name,
    required this.mobile,
    required this.phone,
    required this.address,
  });

  factory UserInfo.fromJson(Map<String, dynamic> json) {
    return UserInfo(
      id: json['id'],
      name: json['name'],
      mobile: json['mobile'],
      phone: json['phone'],
      address: AddressModel.fromJson(json['address']),
    );
  }
}
