import 'package:app_casynet/app/config/config.dart';
import 'package:dio/dio.dart';

import 'package:app_casynet/app/data/data.dart';

class ProductRepo{
  Future<Responses<Product>> getProduct({data, required String sku, Options? options, Map<String, dynamic>? queryParameters}) async {
    try{
      final response = await ApiRequest().get(
        path: ApiConfig.baseUrl + ApiConfig.product + sku +".json",
        data: data,
        options: options,
        queryParameters: queryParameters
      );
      if(response!= null){
        Product product = Product.fromJson(response.data);
        return Responses<Product>(isSuccess: true, objects: product);
      }
      return Responses<Product>(statusCode: CODE_RESPONSE_NULL, msg: '');
    } catch(error){
      final errorMessage = DioExceptions.fromDioError(error);
      return Responses<Product>(statusCode: CODE_ERROR, msg: errorMessage.toString());
    }
  }

  Future<Responses<Product>> createProduct({data, required int sellerId, Options? options, Map<String, dynamic>? queryParameters}) async {
    try{
      final response = await ApiRequest().post(
          path: ApiConfig.baseUrl2 + '/api/v1/seller/${sellerId}/products',
          data: data,
          options: options,
          queryParameters: queryParameters
      );
      if(response!= null){
        // Product product = Product.fromJson(response.data);
        Product product = Product();
        return Responses<Product>(isSuccess: true, statusCode: CODE_SUCCESS, objects: product);
      }
      return Responses<Product>(statusCode: CODE_RESPONSE_NULL, msg: '');
    } catch(error){
      final errorMessage = DioExceptions.fromDioError(error);
      return Responses<Product>(statusCode: CODE_ERROR, msg: errorMessage.toString());
    }
  }
}