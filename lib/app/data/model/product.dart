import 'package:app_casynet/app/config/config.dart';
import 'package:app_casynet/app/data/data.dart';
import 'package:dio/dio.dart';

class Product {
  int? id;
  int? isCar;
  String? sku;
  String? name;
  String? thumbnail;
  int? price;
  int? officialPrice;
  int? likeQty;
  int? commentQty;
  double? rate;
  int? coinPoint;
  int? sold;
  int? amount;
  int? badReport;
  Seller? seller;
  String? description;
  int? requiredOptions;
  bool? isDisplay;
  bool? isFeatured;
  int? catId;
  List<String>? tags;
  List<String>? images = [];
  List<Option>? options;
  List<int>? categories = [];
  int? originId;



  Product(
      {this.id,
        this.sku,
        this.isCar,
        this.name,
        this.price,
        this.officialPrice,
        this.likeQty,
        this.commentQty,
        this.rate,
        this.coinPoint,
        this.thumbnail,
        this.seller,
        this.catId
      });

  Product.fromJson(Map<String, dynamic> json) {
    id = int.parse(json['id'].toString());
    sku = json['sku'];
    name = json["name"].toString();
    thumbnail = json['images'][0];
    price = double.parse(json[ "discount_price"]).round();
    officialPrice = double.parse(json["price"]).round();
    likeQty = json["liked"];
    commentQty = json["comment"];
    rate = json["vote"].toDouble();
    coinPoint = json["casy_coin"];
    sold = json['sold'];
    description = json['detail_product'];
    badReport = json['bad_report'];
    if(json['tag'] != null){
      for (var v in (json['tag'] as List)) {
        tags?.add(v);
      }
    }
    seller = Seller(
      name: json["store"]["name"].toString(),
      distance: json["store"]["distance"],
      phone: json['store']['phone'],
      ownerShop: json['store']['shop_owner'],
      totalProduct: json['store']['count_product'],
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
          images?.add(v['file']);
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
        if(v['attribute_code'] == 'seller_id'){
          seller?.id = int.parse(json['value'].toString());
        }
      });
      if(json['options'] != null){
        (json['options'] as List).forEach((element) {
          options?.add(Option.fromJson(element));
        });
      }
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

  Future<Map<String, dynamic>> toJson() async {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['description'] = this.description;
    data['isOptionRequired'] = this.requiredOptions;
    data['sku'] = this.sku;
    data['amount'] = this.amount;
    data['price'] = this.price;
    data['officialPrice'] = this.officialPrice;
    data['isDisplay'] = this.isDisplay;
    data['isFeature'] = this.isFeatured;
    data['category'] = this.categories;
    data['originId'] = this.originId;
    final files = [];
    await Future.forEach<String>(images!, (element) async {
      String fileName = element .split('/').last;
      files.add(
        await MultipartFile.fromFile(element, filename: fileName),
      );
    });

    data['images'] = files;
    data['thumbnail'] = files.length>0 ? files[0] : null;
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
    data[DBConfig.PRODUCT_SELLER_NAME] = this.seller?.name;
    data[DBConfig.PRODUCT_SELLER_PHONE] = this.seller?.phone;
    data[DBConfig.PRODUCT_CATEGORY_ID] = catId;
    return data;
  }

  Product.fromJsonApi(json){
    id = json['product_id'];
    name = json['name'];
    officialPrice = json['original_price'].round();
    price = json['price'].round();
  }

  int? calSaleOff(){
    if(officialPrice != null && price != null && officialPrice !=0){
      return ((officialPrice! - price!)*100/officialPrice!).floor();
    }
    return null;

  }
}

class Option{
  int? id;
  String? name;
  String? title;
  String? type;
  bool? is_require;
  String? value;

  Option.fromJson(json){
    this.id = json['option_id'];
    this.title = json['title'];
    this.type = json['tyle'];
    this.is_require = json['is_require'];
  }
}