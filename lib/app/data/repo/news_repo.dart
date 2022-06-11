import 'package:dio/dio.dart';

import '../../config/api_config.dart';
import '../../config/api_params.dart';
import '../model/news.dart';
import '../provider/api/api_provider.dart';
import '../provider/api/exceptions.dart';
import '../provider/api/responses.dart';

class NewsRepo{
  Future<Responses<News>> getNews({Options? options, Map<String, dynamic>? queryParameters}) async{
    try{
      final response = await ApiRequest().get(
        path: ApiConfig.baseUrl + '/rest/V1/orders',
        options: options,
        queryParameters: queryParameters,

      );
      if(response != null){
        List<News> news = List<News>.from(
            (response.data['items'] as List).map((e)=> News.fromJson(e)
            ));
        return Responses<News>(statusCode: CODE_SUCCESS, listObjects: news);
      }
      return Responses<News>(statusCode: CODE_RESPONSE_NULL, msg: '');
    } catch(error){
      final errorMessage = DioExceptions.fromDioError(error);
      return Responses<News>(statusCode: CODE_ERROR, msg: errorMessage.toString());
    }
  }

  Future<Responses<News>> getNew({Options? options, Map<String, dynamic>? queryParameters}) async{
    try{
      final response = await ApiRequest().get(
        path: ApiConfig.baseUrl + '/rest/V1/orders',
        options: options,
        queryParameters: queryParameters,

      );
      if(response != null){
        News new_post = News.fromJson(response.data);
        return Responses<News>(statusCode: CODE_SUCCESS, objects: new_post);
      }
      return Responses<News>(statusCode: CODE_RESPONSE_NULL, msg: '');
    } catch(error){
      final errorMessage = DioExceptions.fromDioError(error);
      return Responses<News>(statusCode: CODE_ERROR, msg: errorMessage.toString());
    }
  }

  Future<Responses<News>> createNews({data, Options? options, Map<String, dynamic>? queryParameters}) async{
    try{
      final response = await ApiRequest().post(
          path: ApiConfig.baseUrl + '/rest/V1/orders',
          options: options,
          queryParameters: queryParameters,
          data: data

      );
      if(response != null){
        News new_post = News.fromJson(response.data);
        return Responses<News>(statusCode: CODE_SUCCESS, objects: new_post);
      }
      return Responses<News>(statusCode: CODE_RESPONSE_NULL, msg: '');
    } catch(error){
      final errorMessage = DioExceptions.fromDioError(error);
      return Responses<News>(statusCode: CODE_ERROR, msg: errorMessage.toString());
    }
  }

  Future<Responses<News>> updateNew({data, required int id, Options? options, Map<String, dynamic>? queryParameters}) async{
    try{
      final response = await ApiRequest().put(
          path: ApiConfig.baseUrl + '/rest/V1/orders',
          options: options,
          queryParameters: queryParameters,
          data: data

      );
      if(response != null){
        News new_post = News.fromJson(response.data);
        return Responses<News>(statusCode: CODE_SUCCESS, objects: new_post);
      }
      return Responses<News>(statusCode: CODE_RESPONSE_NULL, msg: '');
    } catch(error){
      final errorMessage = DioExceptions.fromDioError(error);
      return Responses<News>(statusCode: CODE_ERROR, msg: errorMessage.toString());
    }
  }

  Future<Responses<String>> deleteNews({required int id, Options? options, Map<String, dynamic>? queryParameters}) async{
    try{
      final response = await ApiRequest().delete(
        path: ApiConfig.baseUrl + '/rest/V1/orders',
        options: options,
        queryParameters: queryParameters,

      );
      if(response != null){

        return Responses<String>(statusCode: CODE_SUCCESS, msg: "");
      }
      return Responses<String>(statusCode: CODE_RESPONSE_NULL, msg: '');
    } catch(error){
      final errorMessage = DioExceptions.fromDioError(error);
      return Responses<String>(statusCode: CODE_ERROR, msg: errorMessage.toString());
    }
  }

  Future<Responses<String>> deleteAllNews({Options? options, Map<String, dynamic>? queryParameters}) async{
    try{
      final response = await ApiRequest().delete(
        path: ApiConfig.baseUrl + '/rest/V1/orders',
        options: options,
        queryParameters: queryParameters,

      );
      if(response != null){

        return Responses<String>(statusCode: CODE_SUCCESS, msg: "");
      }
      return Responses<String>(statusCode: CODE_RESPONSE_NULL, msg: '');
    } catch(error){
      final errorMessage = DioExceptions.fromDioError(error);
      return Responses<String>(statusCode: CODE_ERROR, msg: errorMessage.toString());
    }
  }
}