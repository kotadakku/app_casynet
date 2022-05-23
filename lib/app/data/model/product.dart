import 'package:app_casynet/app/data/model/seller.dart';

class Product {
  int? id;
  int? isCar;
  String? sku;
  String? name;
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
    id = int.parse(json['id'].toString());
    name = json["name"].toString();
    imageUrl = "https://casynet-api.herokuapp.com"+json['images'][0]['image'];;
    price = json[ "price"];
    officialPrice = json["discount_price"];
    likeQty = json["liked"];
    commentQty = json["comment"];
    rate = json["vote"];
    coinPoint = json["point"];
    store = Seller(
        name: json["store"]["name"].toString(),
        distance: json["store"]["distance"]
    );
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