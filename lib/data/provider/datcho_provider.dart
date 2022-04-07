import 'package:app_casynet/data/model/datcho.dart';
import 'package:flutter/material.dart';

import '../../library/http_service.dart';
import 'dart:convert';




class DatChoProvider {
  void fetchDatChoList({
    required int loaixe,
    Function()? beforeSend,
    required Function(List<DatCho> datcho) onSuccess,
    Function(dynamic error)? onError
  }) {
    ApiRequest(
        url: 'https://coaxial-typewriter.000webhostapp.com/Server/datcho.php?loaixe=$loaixe',
        data: null).get(
        beforeSend: () => {if(beforeSend != null) beforeSend()},
        onSuccess: (data) {
          print("list: /n"+ data );
          onSuccess((json.decode(data) as List).map((postJson){
            print(postJson);
            return DatCho.fromJson(postJson);
          }
              ).toList());

        },
        onError: (error) => {if(onError != null) onError(error)}
    );
  }

}