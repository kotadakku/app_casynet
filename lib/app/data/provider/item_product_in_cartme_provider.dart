
import 'dart:convert';
import 'package:app_casynet/app/controller/auth/authentication_manager.dart';
import 'package:app_casynet/app/utlis/http_service.dart';
import 'package:get/get.dart';
import '../model/item_product_in_cart.dart';

class ProductCartMeProvider {

  void fetchProductCartMeList({Function()? beforeSend,
    required Function(List<ProductCart> ProductCart) onSuccess,
    Function(dynamic error)? onError,
    String? token
  }){
    ApiRequest(
        url: 'https://client.casynet.com/rest/V1/carts/mine/items',
        data: null,
        token: token,
    ).get(
    beforeSend:()=>{if(beforeSend != null) beforeSend()},
    onSuccess: (data){
      onSuccess((data as List ).map((postJson) => ProductCart.fromJson(postJson)).toList());
    },
    onError: (error) => {if(onError != null) onError(error)}
    );
  }
  Future<void> createProductCartMe(
      {
        Function()? beforePost,
        required Function(ProductCart posts)? onSuccess,
        Function(dynamic error)? onError,
        required Map<String, dynamic> data,
        String? token,
      }) async {
    await ApiRequest(
        url: 'https://client.casynet.com/rest/V1/carts/mine/items',
        data: data,
      token: token,
    ).post(
    beforePost: () => {if(beforePost != null) beforePost},
    onError: (error) =>{if(onError != null) onError(error)},
    data: data);
  }
  void activeCart({Function()? beforeSend,
    required Function(int data) onSuccess,
    Function(dynamic error)? onError,
    String? token
  }){
    ApiRequest(
      url: 'https://client.casynet.com/rest/V1/carts/mine',
      data: null,
      token: token,
    ).get(
        beforeSend:()=>{if(beforeSend != null) beforeSend()},
        onSuccess: (data){
          onSuccess(data);
        },
        onError: (error) => {if(onError != null) onError(error)}
    );
  }

  void updateProductCartMe(
      {Function()? beforePut,
        required Function(ProductCart posts)? onSuccess,
        Function(dynamic error)? onError,
        required Map<String, dynamic> data,
        required int id
  }){
    ApiRequest(
        url: 'https://client.casynet.com/rest/V1/carts/mine/items',
        data: null,
    ).put(
    beforePut: ()=> {if(beforePut != null) beforePut()},
    onSuccess: (data){onSuccess!(ProductCart.fromJson(json.decode(data))); },
    onError: (error) => {if(onError != null) onError(error)},
    data: data);
  }

  void deleteProductCartMe(
  {Function()? beforeDelete,
  required Function(ProductCart posts)? onSuccess,
  Function(dynamic error)? onError,
  required int id
  }){
    ApiRequest(
        url: 'https://client.casynet.com/rest/V1/carts/mine/items',
        data: null,
    ).delete(
      beforeDelete: ()=>{if(beforeDelete != null) beforeDelete()},
      onSuccess: (data){print(data);},
      onError: (error) => {if (onError != null) onError(error)},
    );
  }
}