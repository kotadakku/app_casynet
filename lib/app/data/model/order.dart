

import 'package:app_casynet/app/data/model/product.dart';

class Order{
  int? idStore;
  String? nameStore;
  List<Product>? products = [];

  Order({this.idStore, this.nameStore, this.products});

  Order.fromJson(json){
    idStore = json['store_id'];
    nameStore = json['store_name'];
    if(json['items'] != null){
      (json['items'] as List).forEach((element) {
        products?.add(Product.fromJsonApi(element));
      });
    }
  }
}