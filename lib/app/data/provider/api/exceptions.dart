import 'package:dio/dio.dart';

class DioExceptions implements Exception {

  late String message;

  DioExceptions.fromDioError(dynamic dioError) {
    if(dioError is DioError){
      switch (dioError.type) {
        case DioErrorType.cancel:
          message = "Request to API server was cancelled";
          break;
        case DioErrorType.connectTimeout:
          message = "Connection timeout with API server";
          break;
        case DioErrorType.other:
          message = "Vui lòng kiểm tra kết nối Internet";
          break;
        case DioErrorType.receiveTimeout:
          message = "Receive timeout in connection with API server";
          break;
        case DioErrorType.response:
          message = _handleError(dioError.response?.statusCode, dioError.response?.data);
          break;
        default:
          message = "Something went wrong";
          break;
      }
    }
    else{
      message = dioError.toString();
    }
  }

  String _handleError(int? statusCode, dynamic error) {
    switch (statusCode) {
      case 401:
        return '${error["message"]}';
      case 400:
        return '${error["message"]}';
      case 404:
        return error["message"];
      case 500:
        return 'Hệ thống bị lỗi. vui lòng thử lại sau!';
      default:
        return 'Hệ thống bị lỗi. vui lòng thử lại sau!';
    }
  }
  @override
  String toString() => message;
}