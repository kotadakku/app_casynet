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