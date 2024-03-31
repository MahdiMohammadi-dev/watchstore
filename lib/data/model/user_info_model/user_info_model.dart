import 'package:watchstore/data/model/user_info_model/user_info.dart';

class UserInfoModelTotal {
  UserInfo userInfo;
  int userProcessingCount;
  int userReceivedCount;
  int userCancelCount;

  UserInfoModelTotal({
    required this.userInfo,
    required this.userProcessingCount,
    required this.userReceivedCount,
    required this.userCancelCount,
  });

  factory UserInfoModelTotal.fromJson(Map<String, dynamic> json) {
    return UserInfoModelTotal(
      userInfo: UserInfo.fromJson(json['user_info']),
      userProcessingCount: json['user_processing_count'],
      userReceivedCount: json['user_received_count'],
      userCancelCount: json['user_cancel_count'],
    );
  }
}
