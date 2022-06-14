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

  Future<Responses<bool>> ckeckUserLike({Options? options, Map<String, dynamic>? queryParameters}) async {
    try{
      final response = await ApiRequest().post(
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

  Future<Responses<bool>> likeProduct({Options? options, Map<String, dynamic>? queryParameters}) async {
    try{
      final response = await ApiRequest().post(
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

  Future<Responses<Product>> getFollowedSeller({Map<String, String>? queryParameters, Options? options}) async {
    try{
      final response = await ApiRequest().get(
          path: ApiConfig.baseUrl + '/rest/V1/customers/me',
          options: options,
          queryParameters: queryParameters
      );
      if(response!=null){
        List<Product> products = List.from(
            (response.data as List).map((e) => Product.fromJson(e))
        );
        return Responses<Product>(isSuccess: true, statusCode: CODE_SUCCESS, listObjects: products);
      }
      return Responses<Product>(statusCode: CODE_RESPONSE_NULL, msg: '');
    }catch(error){
      final errorMessage = DioExceptions.fromDioError(error);
      return Responses<Product>(statusCode: CODE_ERROR, msg: errorMessage.toString());
    }
  }

  Future<Responses<Product>> getViewedProduct({Map<String, String>? queryParameters, Options? options}) async {
    try{
      final response = await ApiRequest().get(
          path: ApiConfig.baseUrl + '/rest/V1/customers/me',
          options: options,
          queryParameters: queryParameters
      );
      if(response!=null){
        List<Product> products = List.from(
            (response.data as List).map((e) => Product.fromJson(e))
        );
        return Responses<Product>(isSuccess: true, statusCode: CODE_SUCCESS, listObjects: products);
      }
      return Responses<Product>(statusCode: CODE_RESPONSE_NULL, msg: '');
    }catch(error){
      final errorMessage = DioExceptions.fromDioError(error);
      return Responses<Product>(statusCode: CODE_ERROR, msg: errorMessage.toString());
    }
  }

  Future<Responses<Seller>> getFavoutiteProduct({Map<String, String>? queryParameters, Options? options}) async {
    try{
      final response = await ApiRequest().get(
          path: ApiConfig.baseUrl + '/rest/V1/customers/me',
          options: options,
          queryParameters: queryParameters
      );
      if(response!=null){
        List<Seller> sellers = List.from(
            (response.data as List).map((e) => Seller.fromJson(e))
        );
        return Responses<Seller>(isSuccess: true, statusCode: CODE_SUCCESS, listObjects: sellers);
      }
      return Responses<Seller>(statusCode: CODE_RESPONSE_NULL, msg: '');
    }catch(error){
      final errorMessage = DioExceptions.fromDioError(error);
      return Responses<Seller>(statusCode: CODE_ERROR, msg: errorMessage.toString());
    }
  }

  Future<Responses<bool>> resetPassword({required String email, Options? options}) async {
    try{
      final response = await ApiRequest().put(
          path: ApiConfig.baseUrl + '/rest/V1/customers/password',
          options: options,
          queryParameters: {
            "email": email,
            "template": "email_reset",
            "websiteId": 1
          }
      );
      if(response!=null){
        bool isSuccess = response.data;
        return Responses<bool>(statusCode: CODE_SUCCESS, objects: isSuccess);
      }
      return Responses<bool>(statusCode: CODE_RESPONSE_NULL, msg: '');
    }catch(error){
      final errorMessage = DioExceptions.fromDioError(error);
      return Responses<bool>(statusCode: CODE_ERROR, msg: errorMessage.toString());
    }
  }

  Future<Responses<bool>> changePassword({required String current_password, required new_password, Map<String, dynamic>? queryParameters, Options? options}) async {
    try{
      final response = await ApiRequest().put(
          path: ApiConfig.baseUrl + '/rest/V1/customers/me/password',
          options: options,
          queryParameters: {
            "currentPassword": current_password,
            "newPassword": new_password
          }
      );
      if(response!=null){
        bool isSuccess = response.data;
        return Responses<bool>(statusCode: CODE_SUCCESS, objects: isSuccess);
      }
      return Responses<bool>(statusCode: CODE_RESPONSE_NULL, msg: '');
    }catch(error){
      final errorMessage = DioExceptions.fromDioError(error);
      return Responses<bool>(statusCode: CODE_ERROR, msg: errorMessage.toString());
    }
  }
}