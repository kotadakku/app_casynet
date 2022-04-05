
import 'dart:convert';

import 'package:app_casynet/data/model/address.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';

import '../../library/http_service.dart';

class AddressProvider{
  void fetchAddressList({Function()? beforeSend,
    required Function(List<Address> posts) onSuccess,
    Function(dynamic error)? onError
  }){
    ApiRequest(url: 'https://coaxial-typewriter.000webhostapp.com/Server/address.php', data: null).get(
        beforeSend:()=> {if(beforeSend != null) beforeSend()},
        onSuccess: (data){
          print(data);
          onSuccess((json.decode(data) as List).map((postJson) => Address.fromJson(postJson)).toList());
        },
        onError:(error)=> {if(onError !=null) onError(error)}
    );
  }

  void createAddress(
      {Function()? beforePost,
        required Function(Address posts)? onSuccess,
        Function(dynamic error)? onError,
        required Map<String, dynamic> data,
      }){
    ApiRequest(url: 'https://coaxial-typewriter.000webhostapp.com/Server/post_address.php', data: null).post(
        beforePost:()=> {if(beforePost != null) beforePost()},
        onSuccess: (data){
          onSuccess!(Address.fromJson(json.decode(data)));
        },
        onError:(error)=> {if(onError !=null) onError(error)}, 
        data: data
    );
  }

  void updateAddress(
      {Function()? beforePut,
        required Function(Address posts)? onSuccess,
        Function(dynamic error)? onError,
        required Map<String, dynamic> data,
        required int id
      }){
    ApiRequest(url: 'https://coaxial-typewriter.000webhostapp.com/Server/put_address.php?id=$id', data: null).put(
        beforePut:()=> {if(beforePut != null) beforePut()},
        onSuccess: (data){
          onSuccess!(Address.fromJson(json.decode(data)));
        },
        onError:(error)=> {if(onError !=null) onError(error)},
        data: data
    );
  }

  void deleteAddress(
      {Function()? beforeDelete,
        required Function(Address posts)? onSuccess,
        Function(dynamic error)? onError,
        required int id
      }){
    ApiRequest(url: 'https://coaxial-typewriter.000webhostapp.com/Server/delete_address.php?id=$id', data: null).delete(
        beforeDelete:()=> {if(beforeDelete != null) beforeDelete()},
        onSuccess: (data){
          print(data);
          // onSuccess!(Address.fromJson(json.decode(data)));
        },
        onError:(error)=> {if(onError !=null) onError(error)},
    );
  }




}

