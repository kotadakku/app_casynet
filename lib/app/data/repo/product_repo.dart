import 'package:app_casynet/app/data/model/product.dart';
import 'package:dio/dio.dart';
import '../../config/api_config.dart';
import '../../config/api_params.dart';
import '../model/responses.dart';
import '../provider/api/api_provider.dart';
import '../provider/api/exceptions.dart';

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
}