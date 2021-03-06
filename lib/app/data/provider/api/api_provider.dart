import 'package:dio/dio.dart';
import 'package:app_casynet/app/config/config.dart';
import 'interceptors.dart';

class ApiRequest{
  Dio _dio(){
    return Dio(
        BaseOptions(
          baseUrl: ApiConfig.baseUrl,
          // connectTimeout: 100000,
          // receiveTimeout: 10000,
        )
    )..interceptors.add(LoggingInterceptors());
  }
  Future<Response> get({required String path, Map<String, dynamic>? queryParameters, Options? options, data }) async {
    var response =  await _dio().get(path, queryParameters: queryParameters, options: options);
    return response;
  }

  Future<Response> post({required String path, data, Map<String, dynamic>? queryParameters, Options? options }) async {
    var response =  await _dio().post(path, data: data, queryParameters: queryParameters, options: options);
    return response;
  }

  Future<Response> request({required String path, data, Map<String, dynamic>? queryParameters, Options? options}) async {
    var response = await _dio().request(path, data: data, queryParameters: queryParameters, options: options);
    return response;
  }

  Future<Response> put({required String path, data, Map<String, dynamic>? queryParameters, Options? options}) async {
    var response = await _dio().put(path, data: data, queryParameters: queryParameters, options: options);
    return response;
  }
  Future<Response> delete({required String path, Map<String, dynamic>? queryParameters, Options? options}) async {
    var response = await _dio().delete(path, queryParameters: queryParameters, options: options);
    return response;
  }
}