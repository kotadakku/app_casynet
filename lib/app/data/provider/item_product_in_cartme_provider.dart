
import 'dart:convert';
import 'package:app_casynet/app/controller/auth/authentication_manager.dart';
import 'package:app_casynet/app/utlis/http_service.dart';
import 'package:get/get.dart';
import '../model/item_product_in_cart.dart';

class ItemProductInCartMeProvider {

  void fetchItemProductInCartMeList({Function()? beforeSend,
    required Function(List<ItemProductInCart> itemProductInCart) onSuccess,
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
      onSuccess((data as List ).map((postJson) => ItemProductInCart.fromJson(postJson)).toList());
    },
    onError: (error) => {if(onError != null) onError(error)}
    );
  }
  void createItemProductInCartMe(
      {Function()? beforePost,
        required Function(ItemProductInCart posts)? onSuccess,
        Function(dynamic error)? onError,
        required Map<String, dynamic> data,
      }){
    ApiRequest(
        url: 'https://client.casynet.com/rest/V1/carts/mine/items',
        data: null,
    ).post(
    beforePost: () => {if(beforePost != null) beforePost},
    onSuccess: (data){onSuccess!(ItemProductInCart.fromJson(json.decode(data)));},
    onError: (error) =>{if(onError != null) onError(error)},
    data: data);
  }
  void updateItemProductInCartMe(
      {Function()? beforePut,
        required Function(ItemProductInCart posts)? onSuccess,
        Function(dynamic error)? onError,
        required Map<String, dynamic> data,
        required int id
  }){
    ApiRequest(
        url: 'https://client.casynet.com/rest/V1/carts/mine/items',
        data: null,
    ).put(
    beforePut: ()=> {if(beforePut != null) beforePut()},
    onSuccess: (data){onSuccess!(ItemProductInCart.fromJson(json.decode(data))); },
    onError: (error) => {if(onError != null) onError(error)},
    data: data);
  }

  void deleteItemProductInCartMe(
  {Function()? beforeDelete,
  required Function(ItemProductInCart posts)? onSuccess,
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