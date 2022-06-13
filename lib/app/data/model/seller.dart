

import 'package:app_casynet/app/config/config.dart';
import 'package:app_casynet/app/data/data.dart';

class Seller {
  int? id;
  String? name;
  String? phone;
  String? address;
  double? distance;
  int? likeQty;
  int? commentQty;
  double? rate;
  int? followed;
  String? avatar_image;
  String? backgroundImage;
  String? timeOpen;
  String? timeClose;
  String? timeFeedback;
  String? description;
  double? lat;
  double? lon;
  int? bad_message;
  int? totalProduct;
  String? participationTime;
  String? ownerShop;
  int? rateFeedback;
  int? totalTransaction;
  Address? address_seller;


  Seller(
  {this.id,
    this.name,
    this.phone,
    this.address,
    this.distance,
    this.likeQty,
    this.commentQty,
    this.rate,
    this.followed,
    this.avatar_image,
    this.backgroundImage,
    this.timeOpen,
    this.timeClose,
    this.description,
    this.lat,
    this.lon,
    this.bad_message,
    this.totalProduct,
    this.participationTime,
    this.ownerShop,
    this.rateFeedback,
    this.totalTransaction
  }); // json trả về và gán vào UI
  Seller.fromJson(Map<String, dynamic> data) {
    id = int.parse(data['id'].toString());
    name = data['name'];
    likeQty = data['like'];
    commentQty = data['comment'];
    rate = double.parse(data['vote'].toString());
    avatar_image = data['avatar_image'] ?? data['images'];
    address = data['address'];
    if(data['distance'] != null) distance =  double.parse(data['distance']);
    phone = data['phone'];
    if(data['lat'] != null) lat = double.parse(data['lat']);
    if(data['lng'] != null) lon = double.parse(data['lng']??'');
    timeOpen = data['open_time'];
    timeClose = data['close_time'];
    totalProduct = data['total_product'];
    bad_message = data['bad_message'];
    description = data['intro_store'];
    participationTime = data['participation_time'];
    ownerShop = data['owner_shop'];
    followed = data['followed'];
  }

  Map<String, dynamic> toJsonDB() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data[DBConfig.SELLER_ID] = this.id;
    data[DBConfig.SELLER_NAME] = this.name;
    data[DBConfig.SELLER_IMAGE] = this.avatar_image;
    data[DBConfig.SELLER_LIKED] = this.likeQty;
    data[DBConfig.SELLER_COMMENT] = this.commentQty;
    data[DBConfig.SELLER_RATE] = this.rate;
    data[DBConfig.SELLER_PHONE] = this.phone;
    data[DBConfig.SELLER_ADDRESS] = this.address;
    return data;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = name;
    data['phone'] = phone;
    data['openTime'] = timeOpen;
    data['closeTime'] = timeClose;
    data['lat'] = lat;
    data['lon'] = lon;
    data['description'] = rate;
    data['facebookLink'] = phone;
    data['zaloLink'] = address;
    data['avatar'] = avatar_image;
    data['backgroundImage'] = backgroundImage;
    data['provinceId'] = address_seller?.provinceId;
    data['districtId'] = address_seller?.districtId;
    data['villageId'] = address_seller?.villageId;
    data['specificAddress'] = address_seller?.specificAddress;
    return data;
  }

}