import '../../library/http_service.dart';
import 'dart:convert';

import '../model/cuahang.dart';
import '../model/datcho.dart';


class CuaHangProvider {
  void fetchCuaHangList({
    required int loaixe,
    Function()? beforeSend,
    required Function(List<CuaHang> cuahang) onSuccess,
    Function(dynamic error)? onError
  }) {
    ApiRequest(
        url: 'https://casynet-api.herokuapp.com/api?isCar=$loaixe',
        data: null).get(
        beforeSend: () => {if(beforeSend != null) beforeSend()},
        onSuccess: (data) {
          onSuccess((data["stores"] as List).map((postJson) =>
              CuaHang.fromJson(postJson)).toList());

        },
        onError: (error) => {if(onError != null) onError(error)}
    );
  }

  fetchCuaHang({
    required int id,
    Function()? beforeSend,
    required Function(CuaHang cuahang) onSuccess,
    Function(dynamic error)? onError
  }) {
    ApiRequest(
        url: 'https://casynet-api.herokuapp.com/api/store/$id',
        data: null).get(
        beforeSend: () => {if(beforeSend != null) beforeSend()},
        onSuccess: (data) {
          onSuccess(CuaHang.fromJson(data));

        },
        onError: (error) => {if(onError != null) onError(error)}
    );
  }

  fetchProductsStore({
    required int id,
    Function()? beforeSend,
    required Function(List<DatCho> cuahang) onSuccess,
    Function(dynamic error)? onError
  }) {
    ApiRequest(
        url: 'https://casynet-api.herokuapp.com/api/products?storeId=$id',
        data: null).get(
        beforeSend: () => {if(beforeSend != null) beforeSend()},
        onSuccess: (data) {
          onSuccess((data as List).map((postJson) =>
              DatCho.fromJson(postJson)).toList());
        },
        onError: (error) => {if(onError != null) onError(error)}
    );
  }

}