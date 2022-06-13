import 'package:dio/dio.dart';
import 'package:app_casynet/app/data/data.dart';
import 'package:app_casynet/app/config/config.dart';

class OrderRepo{

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
  Future<Responses<Order>> getOrders({data, Options? options, Map<String, dynamic>? queryParameters}) async{
    try{
      final response = await ApiRequest().get(
        path: ApiConfig.baseUrl + '/rest/V1/orders',
        options: options,
        queryParameters: queryParameters,

      );
      if(response != null){
        List<Order> orders = List<Order>.from(
            (response.data['items'] as List).map((e)=> Order.fromJson(e)
            ));
        return Responses<Order>(isSuccess: true, listObjects: orders);
      }
      return Responses<Order>(statusCode: CODE_RESPONSE_NULL, msg: '');
    } catch(error){
      final errorMessage = DioExceptions.fromDioError(error);
      return Responses<Order>(statusCode: CODE_ERROR, msg: errorMessage.toString());
    }
  }
}