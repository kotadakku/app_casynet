

class Seller {
  String? id;
  String? isCar;
  String? likeQty;
  String? commentQty;
  String? rate;
  String? name;
  String? phone;
  String? address;
  String? distance;
  String? imageUrl;
  String? time_open;
  String? time_close;
  String? intro_store;
  String? product_count;


  Seller.init(
      this.id,
      this.isCar,
      this.likeQty,
      this.commentQty,
      this.rate,
      this.name,
      this.phone,
      this.address,
      this.distance,
      this.imageUrl);

  Seller(
      {this.id,
        this.isCar,
        this.likeQty,
        this.commentQty,
        this.rate,
        this.name,
        this.phone,
        this.address,
        this.distance,
        this.imageUrl});

  Seller.fromJson(Map<String, dynamic> data) {
    id = data['id'].toString();
    likeQty = data['liked'].toString();
    commentQty = data['comment'].toString();
    rate = data['vote'].toString();
    name = data['name'].toString();
    phone = data['phone'].toString();
    address = data['address'].toString();
    distance = data['distance'].toString();
    imageUrl = "https://casynet-api.herokuapp.com"+data['images'][0]['image'];
    time_open = data['time_open'].toString();
    time_close = data['time_close'].toString();
    intro_store = data['intro_store'].toString();
    product_count = data['product_count'].toString();
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
    data['imageUrl'] = this.imageUrl;
    return data;
  }
}