

class Seller {
  int? id;
  String? isCar;
  int? likeQty;
  int? commentQty;
  double? rate;
  String? name;
  String? phone;
  String? address;
  double? distance;
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

  // json trả về và gán vào UI
  Seller.fromJson(Map<String, dynamic> data) {
    print(data);
    id = int.parse(data['id']);
    name = data['name'];
    likeQty = data['like'];
    commentQty = data['comment'];
    rate = double.parse(data['vote'].toString());
    imageUrl = data['images'];
    address = data['address'];
    distance =  double.parse(data['distance']);
    phone = data['phone'];
    // likeQty = data['liked'].toString();
    /*time_open = data['time_open'].toString();
    time_close = data['time_close'].toString();
    intro_store = data['intro_store'].toString();
    product_count = data['product_count'].toString();*/
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