

class Seller {
  int? id;
  String? isCar;
  String? name;
  String? phone;
  String? address;
  double? distance;
  int? likeQty;
  int? commentQty;
  double? rate;
  int? followed;
  String? avatar_image;
  String? background_image;
  String? time_open;
  String? time_close;
  String? intro_store;
  double? lat;
  double? lon;
  int? bad_message;
  int? total_product;
  String? participation_time;
  String? owner_shop;
  int? rateFeedback;
  int? totalTransaction;


  Seller(
  {this.id,
    this.isCar,
    this.name,
    this.phone,
    this.address,
    this.distance,
    this.likeQty,
    this.commentQty,
    this.rate,
    this.followed,
    this.avatar_image,
    this.background_image,
    this.time_open,
    this.time_close,
    this.intro_store,
    this.lat,
    this.lon,
    this.bad_message,
    this.total_product,
    this.participation_time,
    this.owner_shop,
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
    time_open = data['open_time'];
    time_close = data['close_time'];
    total_product = data['total_product'];
    bad_message = data['bad_message'];
    intro_store = data['intro_store'];
    participation_time = data['participation_time'];
    owner_shop = data['owner_shop'];
    followed = data['followed'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['isCar'] = this.isCar;
    data['likeQty'] = this.likeQty;
    data['commentQty'] = this.commentQty;
    data['rate'] = this.rate;
    data['name'] = this.name;
    data['phone'] = this.phone;
    data['address'] = this.address;
    data['distance'] = this.distance;
    data['imageUrl'] = this.avatar_image;
    return data;
  }
}