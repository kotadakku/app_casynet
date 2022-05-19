import 'package:app_casynet/app/config/api_params.dart';
import 'package:app_casynet/app/data/model/checkout/payment_method.dart';
import 'package:app_casynet/app/data/model/checkout/shipping_method.dart';
import 'package:app_casynet/app/data/model/product_cart.dart';
import 'package:app_casynet/app/data/model/responses.dart';
import 'package:app_casynet/app/data/provider/api/api_provider.dart';
import 'package:dio/dio.dart';

import '../../config/api_config.dart';
import '../provider/api/exceptions.dart';

class CartRepo{
  Future<Responses<ShippingMethod>> getShippingMethod({data, Options? options}) async {
    try{
      final response = await ApiRequest().post(
        path: ApiConfig.baseUrl + "/rest/V1/carts/mine/estimate-shipping-methods",
        options: options,
        data: data
      );
      if(response != null){
        List<ShippingMethod> shippingMethods = List<ShippingMethod>.from(
            (response.data as List).map((e) => ShippingMethod.fromJson(e))
        );
        return Responses<ShippingMethod>(isSuccess: true, listObjects: shippingMethods);
      }
      return Responses<ShippingMethod>(statusCode: CODE_RESPONSE_NULL, msg: '');
    }catch(error){
      final errorMessage = DioExceptions.fromDioError(error);
      return Responses<ShippingMethod>(statusCode: CODE_ERROR, msg: errorMessage.toString());
    }
  }

  Future<Responses<PaymentMethod>> getPaymentMethod({data, Options? options}) async {
    try{
      final response = await ApiRequest().post(
        path: ApiConfig.baseUrl + "/rest/V1/carts/mine/shipping-information",
        options: options,
        data: data
      );
      if(response != null){
        List<PaymentMethod> paymentMethods = List<PaymentMethod>.from(
            (response.data['payment_methods'] as List).map((e) => PaymentMethod.fromJson(e))
        );
        return Responses<PaymentMethod>(isSuccess: true, listObjects: paymentMethods);
      }
      return Responses<PaymentMethod>(statusCode: CODE_RESPONSE_NULL, msg: '');
    }catch(error){
      final errorMessage = DioExceptions.fromDioError(error);
      return Responses<PaymentMethod>(statusCode: CODE_ERROR, msg: errorMessage.toString());
    }
  }

  Future<Responses<ProductCart>> updateItemCart({data, required int item_id, Options? options}) async{
    try{
      final response = await ApiRequest().put(
        path: ApiConfig.baseUrl + ApiConfig.itemCart + item_id.toString(),
        data: data,
        options: options,
      );
      if(response!= null){
        ProductCart productCart = ProductCart.fromJson(response.data);
        return Responses<ProductCart>(isSuccess: true, objects: productCart);
      }
      return Responses<ProductCart>(statusCode: CODE_RESPONSE_NULL, msg: '');
    } catch(error){
      final errorMessage = DioExceptions.fromDioError(error);
      return Responses<ProductCart>(statusCode: CODE_ERROR, msg: errorMessage.toString());
    }
  }

  Future<Responses<bool>> deleteItemCart({required int item_id, Options? options}) async {
    try{
      final response = await ApiRequest().delete(
        path: ApiConfig.baseUrl + ApiConfig.itemCart + item_id.toString(),
        options: options
      );
      if(response!= null){
        return Responses<bool>(isSuccess: true, objects: response.data);
      }
      return Responses<bool>(statusCode: CODE_RESPONSE_NULL, msg: '');
    }
    catch (error){
      final errorMessage = DioExceptions.fromDioError(error);
      return Responses<bool>(statusCode: CODE_ERROR, msg: errorMessage.toString());
    }
  }
}