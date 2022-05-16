import 'dart:math';

import 'package:app_casynet/app/utlis/http_service.dart';

import '../model/order.dart';

class OrderApiProvider{
  void getAllOrder({
      beforeSend()?,
      required onSuccess(data),
      onError(error)?}
      ) async {
    await ApiRequest(url: "https://client.casynet.com/rest/V1/orders",
      token: 'pa5fa0htvjliktr2nx320er0xp7qru6z',
      data: {
        'searchCriteria[filterGroups][0][filters][0][field]': 'customer_id',
        'searchCriteria[filterGroups][0][filters][0][value]': '6518',
        'searchCriteria[filterGroups][0][filters][0][conditionType]': 'eq'
      }
    ).get(
      beforeSend: () => {if(beforeSend!=null) beforeSend()},
      onSuccess: (data) => onSuccess(
          (data['items'] as List).map((e)=>
              Order.fromJson(e)).toList()
      ),
      onError: (error)=> onError!(error)
    );
  }
}