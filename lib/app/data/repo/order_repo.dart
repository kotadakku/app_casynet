import 'package:dio/dio.dart';

import '../../config/api_config.dart';
import '../../config/api_params.dart';
import '../model/order.dart';
import '../provider/api/api_provider.dart';
import '../provider/api/exceptions.dart';
import '../provider/api/responses.dart';

class OrderRepo{

  Future<Responses<Order>>  getOrders({Map<String, dynamic>? queryParameters, Options? options }) async {
    try{
      final response = await ApiRequest().get(
          path: ApiConfig.baseUrl2 + ApiConfig.origin,
          options: options,
          queryParameters: queryParameters
      );
      if(response != null){
        List<Order> orders = List<Order>.from(
            (response.data as List).map((e) => Order.fromJson(e))
        );
        return Responses<Order>(statusCode: CODE_SUCCESS, isSuccess: true,
            listObjects: orders);
      }
      else {
        return Responses<Order>(statusCode: CODE_RESPONSE_NULL, msg: '');
      }
    }
    catch (e){
      final errorMessage = DioExceptions.fromDioError(e);
      return Responses<Order>(statusCode: CODE_ERROR, msg: errorMessage.toString());
    }
  }
  Future<Responses<Order>>  getOrder({Map<String, dynamic>? queryParameters, Options? options }) async {
    try{
      final response = await ApiRequest().get(
          path: ApiConfig.baseUrl2 + ApiConfig.origin,
          options: options,
          queryParameters: queryParameters
      );
      if(response != null){
        Order order = Order.fromJson(response.data as List);
        return Responses<Order>(statusCode: CODE_SUCCESS, isSuccess: true,
            objects: order);
      }
      else {
        return Responses<Order>(statusCode: CODE_RESPONSE_NULL, msg: '');
      }
    }
    catch (e){
      final errorMessage = DioExceptions.fromDioError(e);
      return Responses<Order>(statusCode: CODE_ERROR, msg: errorMessage.toString());
    }
  }
}