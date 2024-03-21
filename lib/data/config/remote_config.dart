import 'package:dio/dio.dart';
import 'package:watchstore/utils/shared_prefrences_constant.dart';
import 'package:watchstore/utils/shared_prefrences_manager.dart';

//* this is class for authorization of Requests to server
class AuthenticationInterceptor extends Interceptor {
  @override
  void onRequest(
      RequestOptions options, RequestInterceptorHandler handler) async {
    String? token = SharedPrefrencesManager().getString("token");
    if (token != null) {
      options.headers['Authorization'] = 'Bearer $token';
    }

    super.onRequest(options, handler);
  }
}

class DioManager {
  static final Dio _dioInstance = Dio();
  static Dio get dio {
    _dioInstance.interceptors.add(AuthenticationInterceptor());

    return _dioInstance;
  }
}
