
import 'dart:convert';

import 'package:app_casynet/library/http_service.dart';

import '../model/sales.dart';

class SalesProvider {
  void getSales({
    beforeSend()?,
    required onSuccess(sales),
    onError(error)?
  }){
    ApiRequest(url: "https://coaxial-typewriter.000webhostapp.com/Server/sale.php").get(
      beforeSend: ()=> beforeSend!(),
      onSuccess: (data) => onSuccess(( json.decode(data)  as List).map((e) => Sales.fromJson(e))),
      onError: (error) => onError!(error),
    );
  }
}