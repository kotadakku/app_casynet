import 'package:app_casynet/app/data/data.dart';
import 'package:dio/dio.dart';
import 'package:app_casynet/app/config/config.dart';

class VoucherRepo{
  Future<Responses<Order>>  getVouchers({Map<String, dynamic>? queryParameters, Options? options }) async {
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