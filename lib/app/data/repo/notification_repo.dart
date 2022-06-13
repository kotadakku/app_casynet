
import 'package:dio/dio.dart';
import 'package:app_casynet/app/data/data.dart';
import 'package:app_casynet/app/config/config.dart';

class NotificationRepo{
  Future<Responses<NotificationModel>> getNotificationModels({Options? options, Map<String, dynamic>? queryParameters}) async{
    try{
      final response = await ApiRequest().get(
        path: ApiConfig.baseUrl + '/rest/V1/',
        options: options,
        queryParameters: queryParameters,

      );
      if(response != null){
        List<NotificationModel> notificationModels = List<NotificationModel>.from(
            (response.data['items'] as List).map((e)=> NotificationModel.fromJson(e)
            ));
        return Responses<NotificationModel>(statusCode: CODE_SUCCESS, listObjects: notificationModels);
      }
      return Responses<NotificationModel>(statusCode: CODE_RESPONSE_NULL, msg: '');
    } catch(error){
      final errorMessage = DioExceptions.fromDioError(error);
      return Responses<NotificationModel>(statusCode: CODE_ERROR, msg: errorMessage.toString());
    }
  }

  Future<Responses<NotificationModel>> getNotificationModel({Options? options, Map<String, dynamic>? queryParameters}) async{
    try{
      final response = await ApiRequest().get(
        path: ApiConfig.baseUrl + '/rest/V1/',
        options: options,
        queryParameters: queryParameters,

      );
      if(response != null){
        NotificationModel notificationModel = NotificationModel.fromJson(response.data);
        return Responses<NotificationModel>(statusCode: CODE_SUCCESS, objects: notificationModel);
      }
      return Responses<NotificationModel>(statusCode: CODE_RESPONSE_NULL, msg: '');
    } catch(error){
      final errorMessage = DioExceptions.fromDioError(error);
      return Responses<NotificationModel>(statusCode: CODE_ERROR, msg: errorMessage.toString());
    }
  }

  Future<Responses<NotificationModel>> createNotificationModel({data, Options? options, Map<String, dynamic>? queryParameters}) async{
    try{
      final response = await ApiRequest().post(
          path: ApiConfig.baseUrl + '/rest/V1/',
          options: options,
          queryParameters: queryParameters,
          data: data

      );
      if(response != null){
        NotificationModel notificationModel = NotificationModel.fromJson(response.data);
        return Responses<NotificationModel>(statusCode: CODE_SUCCESS, objects: notificationModel);
      }
      return Responses<NotificationModel>(statusCode: CODE_RESPONSE_NULL, msg: '');
    } catch(error){
      final errorMessage = DioExceptions.fromDioError(error);
      return Responses<NotificationModel>(statusCode: CODE_ERROR, msg: errorMessage.toString());
    }
  }

  Future<Responses<NotificationModel>> updateNotificationModel({data, required int id, Options? options, Map<String, dynamic>? queryParameters}) async{
    try{
      final response = await ApiRequest().put(
          path: ApiConfig.baseUrl + '/rest/V1/',
          options: options,
          queryParameters: queryParameters,
          data: data

      );
      if(response != null){
        NotificationModel notificationModel = NotificationModel.fromJson(response.data);
        return Responses<NotificationModel>(statusCode: CODE_SUCCESS, objects: notificationModel);
      }
      return Responses<NotificationModel>(statusCode: CODE_RESPONSE_NULL, msg: '');
    } catch(error){
      final errorMessage = DioExceptions.fromDioError(error);
      return Responses<NotificationModel>(statusCode: CODE_ERROR, msg: errorMessage.toString());
    }
  }

  Future<Responses<String>> deleteNotificationModel({required int id, Options? options, Map<String, dynamic>? queryParameters}) async{
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

  Future<Responses<String>> deleteAllNotificationModel({Options? options, Map<String, dynamic>? queryParameters}) async{
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