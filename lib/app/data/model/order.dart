import 'datcho.dart';

class Order{
  int? idStore;
  String? nameStore;
  List<DatCho>? products = [];

  Order({this.idStore, this.nameStore, this.products});

  Order.fromJson(json){
    idStore = json['store_id'];
    nameStore = json['store_name'];
    if(json['items'] != null){
      (json['items'] as List).forEach((element) {
        products?.add(DatCho.fromJsonApi(element));
      });
    }
  }
}