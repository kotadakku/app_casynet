 class Address {
  int? id;
  String? firstname;
  String? lastname;
  String? phone;
  String? province;
  String? district;
  List<String> street = [];
  String? default_address;
  bool default_shipping = false;
  bool default_billing = false;

  Address._(this.id,
  this.firstname,
  this.lastname,
  this.phone,
  this.province,
  this.district,
  this.default_shipping,
  this.default_billing);

  Address({this.id,
    this.firstname,
    this.lastname,
    this.phone,
    this.province,
    this.district,
    this.default_shipping = false,
    this.default_billing = false
  });

  Address.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    firstname = json['firstname'];
    lastname = json['lastname'];
    phone = json['telephone'];
    province = json['region']['region'];
    district = json['city'];
    if(json['street'] != null){
      json['street'].forEach((value){
        street = [];
        street.add(value);
      });
    }
    default_billing = json['default_billing']??false;
    default_shipping = json['default_shipping']??false;
  }

  Map<String, dynamic> toJson() {
    return {
      'firstname': firstname,
      'lastname': lastname,
      'phone': phone,
      'province': province,
      'district': district,
      'default_billing': default_billing,
      'default_shipping': default_shipping,
    };
  }
  String address(){
    return this.street[0]+ ", " + this.district.toString()+ ", " + this.province.toString();
  }
}