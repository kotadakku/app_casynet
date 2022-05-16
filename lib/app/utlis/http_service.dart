import 'package:dio/dio.dart';

class ApiRequest {
  final String url;
  final Map<String, dynamic>? data;
  final String? token;

  ApiRequest({ required this.url, this.data, this.token});

  Dio _dio(){
    return Dio(
      BaseOptions(
        headers: {
          'Authorization': token == null ? '' : 'Bearer $token'
        },
        baseUrl: 'https://client.casynet.com',
        // connectTimeout: 5000,
        // receiveTimeout: 5000,
      )
    )..interceptors.add(LoggingInterceptors());


  }

  Future<void> get({Function()? beforeSend,
    Function(dynamic data)? onSuccess,
    Function(dynamic error)? onError,
  }) async {
    await _dio().get(this.url, queryParameters: data).then((res){
      if(beforeSend != null) beforeSend();
      if(onSuccess != null) onSuccess(res.data);
    }).catchError((error){
      // final errorMessage = DioExceptions.fromDioError(error).toString();
      if(onError != null) onError(error.toString());
    });
  }


  Future<void> post( {Function()? beforePost,
    Function(dynamic data)? onSuccess,
    Function(dynamic error)? onError,
    required Map<String, dynamic> data,
  }) async {
    if(beforePost != null) beforePost();
    await _dio().post(this.url, queryParameters: null, data: data).then((value){
      if(onSuccess != null) onSuccess(value.data);
    }).catchError((error){
      final errorMessage = DioExceptions.fromDioError(error).toString();
      if(onError != null ) onError(errorMessage);
    });;
  }

  void put( {Function()? beforePut,
    Function(dynamic data)? onSuccess,
    Function(dynamic error)? onError,
    required Map<String, dynamic> data,

  }){
    _dio().put(this.url, queryParameters: null, data: data).then((value){
      if(onSuccess != null) onSuccess(value.data);
    }).catchError((error){
      final errorMessage = DioExceptions.fromDioError(error).toString();
      if(onError != null ) onError(errorMessage);
    });
  }

  void delete( {Function()? beforeDelete,
    Function(dynamic data)? onSuccess,
    Function(dynamic error)? onError,
  }){
    _dio().post(this.url, queryParameters: null).then((value){
      if(onSuccess != null) onSuccess(value.data);
    }).catchError((error){
      if(onError != null ) onError(error);
    });
  }

}

class DioExceptions implements Exception {

  late String message;

  DioExceptions.fromDioError(DioError dioError) {
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
        message =
            _handleError(dioError.response?.statusCode, dioError.response?.data);
        break;
      // case DioErrorType.DioErrorType:
      //   message = "Send timeout in connection with API server";
      //   break;
      default:
        message = "Something went wrong";
        break;
    }
  }

  String _handleError(int? statusCode, dynamic error) {
    switch (statusCode) {
      case 401:
        return '${error["message"]}';
      case 400:
        return '400 ${error["message"]}';
      case 404:
        return error["message"];
      case 500:
        return 'Internal server error';
      default:
        return 'Hệ thống bị lỗi. vui lòng thử lại sau!';
    }
  }
  @override
  String toString() => message;
}


class DioInterceptor extends Interceptor{

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    if(!options.path.contains("open")){
      options.queryParameters["usersId"] = "xxx";
    }
    options.headers["token"] = "xxx";

    if(options.headers["refreshToken"] == null){
     // DioClient.dio.lock();
      Dio _tokenDIo = Dio();
      _tokenDIo.get('/token').then((data){
        options.headers['refreshToken'] = data.data['data']['token'];
        handler.next(options);
      }).catchError((error, stackTrace){
        handler.reject(error, true);
    }).whenComplete((){
      //DioClient.dio.unlock();
    });
    }
    return super.onRequest(options, handler);

  }

  @override
  void onError(DioError err, ErrorInterceptorHandler handler) {

  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    if(response.statusCode == 200){

    }else {

    }
  }
}

class LoggingInterceptors extends Interceptor {


  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    // options.path = options.baseUrl+options.path;
    print(
        "--> ${options.method != null ? options.method.toUpperCase() : 'METHOD'} ${"" + (options.baseUrl ) + (options.path)}");

    if(options.headers != null){
      print("Headers:");
      options.headers.forEach((k, v) => print('$k: $v'));
    }
    if (options.queryParameters != null) {
      print("queryParameters:");
      options.queryParameters.forEach((k, v) => print('$k: $v'));
    }
    if (options.data != null) {
      print("Body: ${options.data}");
    }
    print(
        "--> END ${options.method != null ? options.method.toUpperCase() : 'METHOD'}");

    return super.onRequest(options, handler);
  }

  @override
  void onError(DioError dioError, ErrorInterceptorHandler handler) async {
    // print(
    //     "<-- ${dioError.message} ${(dioError.response?.requestOptions != null ? (dioError.response?.requestOptions.baseUrl! + dioError.response?.requestOptions.path!) : 'URL')}");
    print(
        "${dioError.response != null ? dioError.response?.data : 'Unknown Error'}");
    print("<-- End error");

    // if(dioError.response?.statusCode == 401){
    //   if(dioError.response?.data['message'] == 'The consumer isn\'t authorized to access %resources.'){
    //     await ApiRequest(url: '${dioError.response?.requestOptions.baseUrl}/rest/V1/integration/admin/token').post(data: {
    //     "username": "admin",
    //     "password": "admin12345",
    //     }, onSuccess: (value) async {
    //       if(value != null) {
    //         dioError.requestOptions.headers['Authorization'] = value;
    //         final opts = Options(
    //           method: dioError.requestOptions.method,
    //           headers: dioError.requestOptions.headers
    //         );
    //         // var cloneReq = await Dio().request(dioError.requestOptions.path,
    //         //   options: opts,
    //         //   data: dioError.requestOptions.data,
    //         //   queryParameters: dioError.requestOptions.queryParameters
    //         // );
    //         Dio dio = Dio();
    //         await dio.get(dioError.requestOptions.path, options: opts, queryParameters: dioError.requestOptions.queryParameters)
    //             .then((value) async {
    //               print(value);
    //               return handler.resolve(value);
    //         }
    //         ).catchError((error) => print(error));
    //       }
    //     },
    //     onError: (error){
    //       print(error['message']);
    //     }
    //     );
    //   }
    // }
    return super.onError(dioError, handler);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    print(
        "<-- ${response.statusCode} ${(response.redirects != null ? (response.requestOptions.baseUrl + response.requestOptions.path) : 'URL')}");
    if(response.headers != null){
      print("Headers:");
      response.headers.forEach((k, v) => print('$k: $v'));
    }
    print("Response: ${response.data}");
    print("<-- END HTTP");
    return super.onResponse(response, handler);
  }
}
