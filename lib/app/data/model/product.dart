import 'package:app_casynet/app/config/config_db.dart';
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
  int? requiredOptions;
  int? catId;
  List<String> tags = [];
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
        this.thumbnail,
        this.catId,
        this.store
      });

  Product.fromJson(Map<String, dynamic> json) {
    id = int.parse(json['id'].toString());
    sku = json['sku'];
    name = json["name"].toString();
    imageUrl = json['images'][0];
    price = double.parse(json[ "price"]).round();
    officialPrice = double.parse(json["discount_price"]).round();
    likeQty = json["liked"];
    commentQty = json["comment"];
    rate = json["vote"].toDouble();
    coinPoint = json["casy_coin"];
    sold = json['sold'];
    detailProduct = json['detail_product'];
    badReport = json['bad_report'];
    if(json['tag'] != null){
      for (var v in (json['tag'] as List)) {
        tags.add(v);
      }
    }
    store = Seller(
      name: json["store"]["name"].toString(),
      distance: json["store"]["distance"],
      phone: json['store']['phone'],
      owner_shop: json['store']['shop_owner'],
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
        if(v['attribute_code'] == 'required_options'){
          requiredOptions = int.parse(v['value'].toString());
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
  Map<String, dynamic> toJsonDB(int catId) {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data[DBConfig.PRODUCT_ID] = this.id;
    data[DBConfig.PRODUCT_NAME] = this.name;
    data[DBConfig.PRODUCT_IMAGE] = this.thumbnail;
    data[DBConfig.PRODUCT_PRICE] = this.price;
    data[DBConfig.PRODUCT_OFF_PRICE] = this.officialPrice;
    data[DBConfig.PRODUCT_LIKED] = this.likeQty;
    data[DBConfig.PRODUCT_COMMENT] = this.commentQty;
    data[DBConfig.PRODUCT_RATE] = this.rate;
    data[DBConfig.PRODUCT_SELLER_NAME] = this.store?.name;
    data[DBConfig.PRODUCT_SELLER_PHONE] = this.store?.phone;
    data[DBConfig.PRODUCT_CATEGORY_ID] = catId;
    return data;
  }

  Product.fromJsonApi(json){
    id = json['product_id'];
    name = json['name'];
    officialPrice = json['original_price'].round();
    price = json['price'].round();
  }
}