import 'package:dio/dio.dart';

import '../../config/api_config.dart';
import '../../config/api_params.dart';
import '../model/gift.dart';
import '../provider/api/api_provider.dart';
import '../provider/api/exceptions.dart';
import '../provider/api/responses.dart';

class GiftRepo{
  Future<Responses<Gift>> getGifts({Options? options, Map<String, dynamic>? queryParameters}) async{
    try{
      final response = await ApiRequest().get(
        path: ApiConfig.baseUrl + '/rest/V1/orders',
        options: options,
        queryParameters: queryParameters,

      );
      if(response != null){
        List<Gift> gifts = List<Gift>.from(
            (response.data['items'] as List).map((e)=> Gift.fromJson(e)
            ));
        return Responses<Gift>(statusCode: CODE_SUCCESS, listObjects: gifts);
      }
      return Responses<Gift>(statusCode: CODE_RESPONSE_NULL, msg: '');
    } catch(error){
      final errorMessage = DioExceptions.fromDioError(error);
      return Responses<Gift>(statusCode: CODE_ERROR, msg: errorMessage.toString());
    }
  }

  Future<Responses<Gift>> getGift({Options? options, Map<String, dynamic>? queryParameters}) async{
    try{
      final response = await ApiRequest().get(
        path: ApiConfig.baseUrl + '/rest/V1/orders',
        options: options,
        queryParameters: queryParameters,

      );
      if(response != null){
        Gift gift = Gift.fromJson(response.data);
        return Responses<Gift>(statusCode: CODE_SUCCESS, objects: gift);
      }
      return Responses<Gift>(statusCode: CODE_RESPONSE_NULL, msg: '');
    } catch(error){
      final errorMessage = DioExceptions.fromDioError(error);
      return Responses<Gift>(statusCode: CODE_ERROR, msg: errorMessage.toString());
    }
  }

  Future<Responses<Gift>> createGift({data, Options? options, Map<String, dynamic>? queryParameters}) async{
    try{
      final response = await ApiRequest().post(
        path: ApiConfig.baseUrl + '/rest/V1/orders',
        options: options,
        queryParameters: queryParameters,
        data: data

      );
      if(response != null){
        Gift gift = Gift.fromJson(response.data);
        return Responses<Gift>(statusCode: CODE_SUCCESS, objects: gift);
      }
      return Responses<Gift>(statusCode: CODE_RESPONSE_NULL, msg: '');
    } catch(error){
      final errorMessage = DioExceptions.fromDioError(error);
      return Responses<Gift>(statusCode: CODE_ERROR, msg: errorMessage.toString());
    }
  }

  Future<Responses<Gift>> updateGift({data, required int id, Options? options, Map<String, dynamic>? queryParameters}) async{
    try{
      final response = await ApiRequest().put(
        path: ApiConfig.baseUrl + '/rest/V1/orders',
        options: options,
        queryParameters: queryParameters,
        data: data

      );
      if(response != null){
        Gift gift = Gift.fromJson(response.data);
        return Responses<Gift>(statusCode: CODE_SUCCESS, objects: gift);
      }
      return Responses<Gift>(statusCode: CODE_RESPONSE_NULL, msg: '');
    } catch(error){
      final errorMessage = DioExceptions.fromDioError(error);
      return Responses<Gift>(statusCode: CODE_ERROR, msg: errorMessage.toString());
    }
  }

  Future<Responses<String>> deleteGift({required int id, Options? options, Map<String, dynamic>? queryParameters}) async{
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

  Future<Responses<String>> deleteAllGift({Options? options, Map<String, dynamic>? queryParameters}) async{
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