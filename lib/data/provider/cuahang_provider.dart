import '../../library/http_service.dart';
import 'dart:convert';

import '../model/cuahang.dart';


class CuaHangProvider {
  void fetchCuaHangList({
    required int loaixe,
    Function()? beforeSend,
    required Function(List<CuaHang> cuahang) onSuccess,
    Function(dynamic error)? onError
  }) {
    ApiRequest(
        url: 'https://coaxial-typewriter.000webhostapp.com/Server/cuahang.php?loaixe=$loaixe',
        data: null).get(
        beforeSend: () => {if(beforeSend != null) beforeSend()},
        onSuccess: (data) {
          print("list: /n"+ data );
          onSuccess((json.decode(data) as List).map((postJson) =>
              CuaHang.fromJson(postJson)).toList());

        },
        onError: (error) => {if(onError != null) onError(error)}
    );
  }

}