import 'package:app_casynet/app/data/model/order.dart';
import 'package:app_casynet/app/data/model/product_cart.dart';

import 'package:dio/dio.dart';
import '../provider/api/api_provider.dart';
import '../../config/api_config.dart';
import '../../config/api_params.dart';
import '../model/responses.dart';
import '../provider/api/exceptions.dart';

class AccountRepo{
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
  Future<Responses<ProductCart>> getProductsCart({Options? options}) async {
    try{
      final response = await ApiRequest().get(
        path: ApiConfig.baseUrl + '/rest/V1/carts/mine/items',
        options: options
      );
      if(response!=null){
        List<ProductCart> productCart = List<ProductCart>.from(
            (response.data as List ).map((e) => ProductCart.fromJson(e))
        );
        return Responses<ProductCart>(isSuccess: true, listObjects: productCart);
      }
      return Responses<ProductCart>(statusCode: CODE_RESPONSE_NULL, msg: '');
    }catch(error){
      final errorMessage = DioExceptions.fromDioError(error);
      return Responses<ProductCart>(statusCode: CODE_ERROR, msg: errorMessage.toString());
    }
  }
  Future<Responses<ProductCart>> addProductCart({data, Options? options}) async {
    try{
      final response = await ApiRequest().post(
          path: ApiConfig.baseUrl + '/rest/V1/carts/mine/items',
          data: data,
          options: options
      );
      if(response!=null){
        ProductCart productCart = ProductCart.fromJson(response.data);
        return Responses<ProductCart>(isSuccess: true, objects: productCart);
      }
      return Responses<ProductCart>(statusCode: CODE_RESPONSE_NULL, msg: '');
    }catch(error){
      final errorMessage = DioExceptions.fromDioError(error);
      return Responses<ProductCart>(statusCode: CODE_ERROR, msg: errorMessage.toString());
    }
  }
  Future<Responses<int>> getCartId({Options? options}) async {
    try{
      final response = await ApiRequest().get(
        path: ApiConfig.baseUrl + '/rest/V1/carts/mine',
        options: options,
      );
      if(response != null){
        int cartId = response.data;
        return Responses<int>(isSuccess: true, objects: cartId);
      }
      return Responses<int>(statusCode: CODE_RESPONSE_NULL, msg: '');
    } catch(error){
      final errorMessage = DioExceptions.fromDioError(error);
      return Responses<int>(statusCode: CODE_ERROR, msg: errorMessage.toString());
    }
  }
}