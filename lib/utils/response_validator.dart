class HttpResponseValidator {
  static bool isValidateStatusCode(int statusCode) {
    if (statusCode >= 200 && statusCode < 300) {
      return true;
    } else {
      throw HttpExcception(statusCode: statusCode);
    }
  }
}

class HttpExcception implements Exception {
  final int statusCode;

  HttpExcception({required this.statusCode});

  @override
  String toString() {
    String message;

    switch (statusCode) {
      case 400:
        message = 'Bad request';
        break;
      case 401:
        message = 'UnAuthorized';
        break;
      case 403:
        message = 'Forbidden';
        break;
      case 409:
        message = 'Conflict';
        break;

      case 500:
        message = 'Internal Server Error!';
        break;
      default:
        message = 'Unknown Error';
    }
    return 'HttpException Status Code : $statusCode , Message : $message';
  }
}
