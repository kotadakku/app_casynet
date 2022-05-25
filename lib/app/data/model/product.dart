import 'package:app_casynet/app/data/model/seller.dart';

class Product {
  int? id;
  int? isCar;
  String? sku;
  String? name;
  String? thumbnail;
  String? imageUrl;
  int? price;
  int? officialPrice;
  int? likeQty;
  int? commentQty;
  double? rate;
  int? coinPoint;
  int? saleoff;
  int? sold;
  int? badReport;
  String? detailProduct;
  Seller? store;
  String? description;
  List<String> images = [];



  Product(
      {this.id,
        this.isCar,
        this.name,
        this.imageUrl,
        this.price,
        this.officialPrice,
        this.likeQty,
        this.commentQty,
        this.rate,
        this.coinPoint,
        this.store
      });

  Product.fromJson(Map<String, dynamic> json) {
    id = int.parse(json['id'].toString());
    sku = json['sku'];
    name = json["name"].toString();
    imageUrl = json['images'][0];
    price = double.parse(json[ "price"]).round();
    officialPrice = json["discount_price"];
    likeQty = json["liked"];
    commentQty = json["comment"];
    rate = json["vote"].toDouble();
    coinPoint = json["casy_coin"];
    sold = json['sold'];
    detailProduct = json['detail_product'];
    store = Seller(
      name: json["store"]["name"].toString(),
      distance: json["store"]["distance"],
      phone: json['store']['phone'],
      owner_shop: json['store']['owner_shop'],
      total_product: json['store']['count_product'],
      totalTransaction: int.parse(json['store']['total_transaction']),
      rateFeedback: json['store']['rate_feedback']
    );
  }

  Product.fromJson1(Map<String, dynamic> json) {
    id = json['id'];
    sku = json['sku'];
    name = json["name"];
    if(json['price'] != null) officialPrice = double.parse(json['price'].toString()).round();
    if(json['media_gallery_entries']!= null){
      json['media_gallery_entries'].forEach((v) {
        if(v['attribute_code'] == 'phone_number'){
          images.add(v['file']);
        }
      });
    }
    if(json['custom_attributes']!=null){
      json['custom_attributes'].forEach((v){
        if(v['attribute_code'] == 'description'){
          description = v['value'];
        }
        if(v['attribute_code'] == 'thumbnail'){
          thumbnail = "https://client.casynet.com/pub/media/catalog/product"+ v['value'];
        }
        if(v['attribute_code'] == 'special_price'){
          price = double.parse(v['value'].toString()).round();
        }

      });
    }

    // imageUrl = "https://client.casynet.com/pub/media/catalog/product"+json['images'][0]['image'];;

    // officialPrice = json["discount_price"];
    // likeQty = json["liked"];
    // commentQty = json["comment"];
    // rate = json["vote"];
    // coinPoint = json["point"];
    // store = Seller(
    //     name: json["store"]["name"].toString(),
    //     distance: json["store"]["distance"]
    // );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['isCar'] = this.isCar;
    data['name'] = this.name;
    data['imageUrl'] = this.imageUrl;
    data['price'] = this.price;
    data['officialPrice'] = this.officialPrice;
    data['likeQty'] = this.likeQty;
    data['commentQty'] = this.commentQty;
    data['rate'] = this.rate;
    data['coinPoint'] = this.coinPoint;
    return data;
  }

  Product.fromJsonApi(json){
    id = json['product_id'];
    name = json['name'];
    officialPrice = json['original_price'].round();
    price = json['price'].round();
  }
}