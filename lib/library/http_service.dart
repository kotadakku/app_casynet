import 'package:dio/dio.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';

class ApiRequest {
  final String url;
  final Map<String, dynamic>? data;

  ApiRequest({ required this.url, this.data});

  Dio _dio(){
    return Dio(
      BaseOptions(
        headers: {
          'Authorization': 'token'
        },
        // baseUrl: '',
      )
    );
  }

  void get({Function()? beforeSend,
    Function(dynamic data)? onSuccess,
    Function(dynamic error)? onError,
  }){
    _dio().get(this.url, queryParameters: null).then((res){
      if(onSuccess != null) onSuccess(res.data);
    }).catchError((error){
      if(onError != null) onError(error);
    });

  }
  void post( {Function()? beforePost,
    Function(dynamic data)? onSuccess,
    Function(dynamic error)? onError,
    required Map<String, dynamic> data,
  }){
    _dio().post(this.url, queryParameters: null, data: data).then((value){
      if(onSuccess != null) onSuccess(value.data);
    }).catchError((error){
      if(onError != null ) onError(error);
    });
  }

  void put( {Function()? beforePut,
    Function(dynamic data)? onSuccess,
    Function(dynamic error)? onError,
    required Map<String, dynamic> data,

  }){
    _dio().post(this.url, queryParameters: null, data: data).then((value){
      if(onSuccess != null) onSuccess(value.data);
    }).catchError((error){
      if(onError != null ) onError(error);
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