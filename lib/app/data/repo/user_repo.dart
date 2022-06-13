import 'dart:convert';
import 'package:app_casynet/app/data/data.dart';
import 'package:app_casynet/app/config/config.dart';
import 'package:dio/dio.dart';

class UserRepo{
  Future<Responses<String>> getTokenUser(data) async {
    try{
      final response = await ApiRequest().post(
          path: ApiConfig.baseUrl + '/rest/V1/integration/customer/token',
          data: data
      );
      if(response != null){
        String token = response.data;
        return Responses<String>(isSuccess: true, objects: token);
      }
      return Responses<String>(statusCode: CODE_RESPONSE_NULL, msg: "");
    } catch (error){
      final errorMessage = DioExceptions.fromDioError(error);
      return Responses<String>(statusCode: CODE_ERROR, msg: errorMessage.toString());
    }
  }
  Future<Responses<User>> getUser(Options options) async {
    try{
      final response = await ApiRequest().get(
          path: ApiConfig.baseUrl + '/rest/default/V1/customers/me',
          options: options
      );
      if(response != null){
        await GetStorageProvider().save(key: CacheManagerKey.USER.toString(), value: json.encode(response.data));
        User user = User.successLogin(response.data);
        return Responses<User>(isSuccess: true, objects: user);
      }
      return Responses<User>(statusCode: CODE_RESPONSE_NULL, msg: "");
    } catch (error){
      final errorMessage = DioExceptions.fromDioError(error);
      return Responses<User>(statusCode: CODE_ERROR, msg: errorMessage.toString());
    }
  }
  Future<Responses<User>> createUser(data) async {
    try{
      final response = await ApiRequest().post(
          path: ApiConfig.baseUrl + '/rest/V1/customers/',
          data: data
      );
      if(response != null){
        User user = User.successLogin(response.data);
        return Responses<User>(isSuccess: true, objects: user);
      }
      return Responses<User>(statusCode: CODE_RESPONSE_NULL, msg: "");

    } catch (error){
      final errorMessage = DioExceptions.fromDioError(error);
      return Responses<User>(statusCode: CODE_ERROR, msg: errorMessage.toString());
    }
  }
  Future<Responses<User>> updateAddress({data, Options? options}) async{
    try{
      final response = await ApiRequest().put(
          path: ApiConfig.baseUrl + '/rest/V1/customers/me',
          data: data,
          options: options
      );
      if(response != null){
        User user = User.successLogin(response.data);
        return Responses<User>(isSuccess: true, statusCode: CODE_SUCCESS, objects: user);
      }
      return Responses<User>(statusCode: CODE_RESPONSE_NULL, msg: '');
    } catch(error){
      final errorMessage = DioExceptions.fromDioError(error);
      return Responses<User>(statusCode: CODE_ERROR, msg: errorMessage.toString());
    }
  }
  Future<Responses<User>> updateUserAccount({data, Options? options}) async {
    try{
      final response = await ApiRequest().put(
          path: ApiConfig.baseUrl + '/rest/V1/customers/me',
          data: data,
          options: options
      );
      if(response!=null){
        User user = User.successLogin(response.data);
        return Responses<User>(isSuccess: true, objects: user);
      }
      return Responses<User>(statusCode: CODE_RESPONSE_NULL, msg: '');
    }catch(error){
      final errorMessage = DioExceptions.fromDioError(error);
      return Responses<User>(statusCode: CODE_ERROR, msg: errorMessage.toString());
    }
  }

  Future<Responses<bool>> isFollowSeller({Options? options, Map<String, dynamic>? queryParameters}) async {
    try{
      final response = await ApiRequest().put(
        path: ApiConfig.baseUrl + '/rest/V1/customers/me',
        options: options,
        queryParameters: queryParameters
      );
      if(response!=null){
        bool isLiked = response.data;
        return Responses<bool>(isSuccess: true, statusCode: CODE_SUCCESS, objects: isLiked);
      }
      return Responses<bool>(statusCode: CODE_RESPONSE_NULL, msg: '');
    }catch(error){
      final errorMessage = DioExceptions.fromDioError(error);
      return Responses<bool>(statusCode: CODE_ERROR, msg: errorMessage.toString());
    }
  }

  Future<Responses<bool>> followSeller({Options? options, Map<String, dynamic>? queryParameters}) async {
    try{
      final response = await ApiRequest().put(
          path: ApiConfig.baseUrl + '/rest/V1/customers/me',
          options: options,
          queryParameters: queryParameters
      );
      if(response!=null){
        bool isLiked = response.data;
        return Responses<bool>(isSuccess: true, statusCode: CODE_SUCCESS, objects: isLiked);
      }
      return Responses<bool>(statusCode: CODE_RESPONSE_NULL, msg: '');
    }catch(error){
      final errorMessage = DioExceptions.fromDioError(error);
      return Responses<bool>(statusCode: CODE_ERROR, msg: errorMessage.toString());
    }
  }

  Future<Responses<bool>> addVoucher({required int id, Options? options, Map<String, dynamic>? queryParameters}) async {
    try{
      final response = await ApiRequest().put(
          path: ApiConfig.baseUrl + '/rest/V1/customers/me',
          options: options,
          queryParameters: queryParameters
      );
      if(response!=null){
        bool isLiked = response.data;
        return Responses<bool>(isSuccess: true, statusCode: CODE_SUCCESS, objects: isLiked);
      }
      return Responses<bool>(statusCode: CODE_RESPONSE_NULL, msg: '');
    }catch(error){
      final errorMessage = DioExceptions.fromDioError(error);
      return Responses<bool>(statusCode: CODE_ERROR, msg: errorMessage.toString());
    }
  }
}