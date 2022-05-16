import 'dart:convert';
import 'package:app_casynet/app/data/model/user.dart';

import '../../utlis/http_service.dart';
import '../model/address.dart';

class AddressProvider {
  void fetchAddressList(
      {Function()? beforeSend,
      required Function(List<Address> address) onSuccess,
      Function(dynamic error)? onError}) {
    ApiRequest(
            url: 'https://client.casynet.com/rest/V1/customers/me', data: null)
        .get(
            beforeSend: () => {if (beforeSend != null) beforeSend()},
            onSuccess: (data) {
              onSuccess((json.decode(data) as List)
                  .map((postJson) => Address.fromJson(postJson))
                  .toList());
            },
            onError: (error) => {if (onError != null) onError(error)});
  }


  void createAddress({
    String? token,
    required Address address,
    required Function(Address puts)? onSuccess,
    Function(dynamic error)? onError,
    Function()? beforePut,
    required Map<String, dynamic> data,
  }) {
    ApiRequest(
            url: 'https://client.casynet.com/rest/V1/customers/me',token: token)
        .put(
      data: address.toJsonAddress(),
      beforePut: () => {if (beforePut != null) beforePut()},
      onSuccess: (data) {
        // onSuccess!(Address.fromJson(json.decode(data)));
        onSuccess!(Address.fromJson(json.decode(data)));
        print(data);
        // onSuccess!()
      },
      onError: (error) => {if (onError != null) onError(error)},
    );
  }

  void updateAddress(
      {Function()? beforePut,
      required Function(Address posts)? onSuccess,
      Function(dynamic error)? onError,
      required Map<String, dynamic> data,
      required int id}) {
    ApiRequest(
            url:
                'https://coaxial-typewriter.000webhostapp.com/Server/put_address.php?id=$id',
            data: null)
        .put(
            beforePut: () => {if (beforePut != null) beforePut()},
            onSuccess: (data) {
              onSuccess!(Address.fromJson(json.decode(data)));
            },
            onError: (error) => {if (onError != null) onError(error)},
            data: data);
  }

  void deleteAddress(
      {Function()? beforeDelete,
      required Function(Address posts)? onSuccess,
      Function(dynamic error)? onError,
      required int id}) {
    ApiRequest(
            url:
                'https://coaxial-typewriter.000webhostapp.com/Server/delete_address.php?id=$id',
            data: null)
        .delete(
      beforeDelete: () => {if (beforeDelete != null) beforeDelete()},
      onSuccess: (data) {
        print(data);
        // onSuccess!(Address.fromJson(json.decode(data)));
      },
      onError: (error) => {if (onError != null) onError(error)},
    );
  }
}
