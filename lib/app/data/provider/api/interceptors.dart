import 'package:dio/dio.dart';
import '../../../config/api_config.dart';
import '../get_storage_provider.dart';
import 'api_provider.dart';

class LoggingInterceptors extends Interceptor {


  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    print("--> ${options.method != null ? options.method.toUpperCase() : 'METHOD'} ${"" + (options.baseUrl ) + (options.path)}");

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
    print("<-- ${dioError.message} ${(dioError.response?.requestOptions != null ?
    dioError.response?.requestOptions.path : 'URL')}");
    print(
        "${dioError.response != null ? dioError.response?.data : 'Unknown Error'}");
    print("<-- End error");
    if(dioError.response?.statusCode == 401 && dioError.response?.data['message'] == 'The consumer isn\'t authorized to access %resources.'){

      final response = await ApiRequest().post(
          data: {
            "username": "admin",
            "password": "admin12345",
          },
          path: ApiConfig.baseUrl +'/rest/V1/integration/admin/token');
      if (response.statusCode == 200) {
        dioError.requestOptions.headers['Authorization'] = 'Bearer ${response.data}';
        await GetStorageProvider().save(key: CacheManagerKey.TOKEN_ADMIN.toString(), value: response.data);
        return handler.resolve(await _retry(dioError.requestOptions));
      }

    }
    return handler.next(dioError);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    print(
        "<-- ${response.statusCode} ${(response.redirects != null ? response.requestOptions.path : 'URL')}");
    if(response.headers != null){
      print("Headers:");
      response.headers.forEach((k, v) => print('$k: $v'));
    }
    print("Response: ${response.data}");
    print("<-- END HTTP");
    return super.onResponse(response, handler);
  }

  Future<Response<dynamic>> _retry(RequestOptions requestOptions) async {
    final options = Options(
      method: requestOptions.method,
      headers: requestOptions.headers,
    );
    return ApiRequest().request(path:requestOptions.path,
        data: requestOptions.data,
        queryParameters: requestOptions.queryParameters,
        options: options);
  }
}
