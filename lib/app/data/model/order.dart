import 'package:app_casynet/app/data/data.dart';

class Order{
  int? idStore;
  String? nameStore;
  String? status;
  List<Product>? products = [];

  Order({this.idStore, this.nameStore, this.products});

  Order.fromJson(json){
    idStore = json['store_id'];
    status = json['status'];
    nameStore = json['store_name'];
    if(json['items'] != null){
      (json['items'] as List).forEach((element) {
        products?.add(Product.fromJsonApi(element));
      });
    }
  }
}