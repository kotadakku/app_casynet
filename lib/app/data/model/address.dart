
class Address {
  int? id;
  String? email;
  int? websiteId;
  String? region; // Tỉnh/ thành phố
  String? regionCode;
  int? regionId;
  String? countryId;
  String? addressNumber; //  = add
  int? postcode = 98761;
  String? firstname;
  String? lastname;
  String? phone;
  String? province;
  String? district;
  List<String> street = [];
  String? default_address;
  bool default_shipping = true;
  bool default_billing = true;

  int? provinceId;
  int? districtId;
  int? villageId;
  String? specificAddress;

  // ignore: unused_element
  Address._(
    this.id,
    this.firstname,
    this.lastname,
    this.phone,
    this.province,
    this.district,
    this.default_shipping,
    this.default_billing,
  );

  Address(
      {this.id,
      this.email,
      this.websiteId,

      this.region,
      this.regionCode,
      this.regionId,
      this.countryId,
      this.addressNumber,
      this.postcode,
      this.firstname,
      this.lastname,
      this.phone,
      this.province,
      this.district,

      // this.default_address,
      this.default_shipping = true,
      this.default_billing = true});

  /*Address({
    this.id,
    this.firstname,
    this.lastname,
    this.phone,
    this.province,
    this.district,
    this.default_shipping = false,
    this.default_billing = false,
  });*/

  Address.fromJson(Map<String, dynamic> json) {

    this.id = json['id'];
    this.firstname = json['firstname'];
    this.lastname = json['lastname'];
    this.phone = json['telephone'];
    this.province = json['region']['region'];
    this.district = json['city'];
    if (json['street'] != null) {
      json['street'].forEach((value) {
        street = [];
        street.add(value);
      });
    }
    this.regionId = json['region']['region_id'];
    this.countryId = json['country_id'];
    this.default_billing = json['default_billing'] ?? false;
    this.default_shipping = json['default_shipping'] ?? false;
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

// map thêm địa chỉ account
  Map<String, dynamic> toJsonAddress() {
    return {
      'customer': {
        'email': this.email,
        'website_id': 1,
        'addresses': [
          {
            'region': {
              'region_code': "NY",
              'region': this.province,
              'region_id': 715,
            },
            'country_id': "VN",
            'street': this.street,
            'firstname': this.firstname,
            'lastname': this.lastname,
            'default_shipping': this.default_shipping,
            'default_billing': this.default_billing,
            'telephone': this.phone,
            'postcode': this.postcode,
            'city': this.district
          }
        ],
      }
    };
  }



  // address la arr => tao ham string
  String address() {
    return this.street[0] +
        ", " +
        this.district.toString() +
        ", " +
        this.province.toString();
  }

  Map<String, dynamic> toJsonShipping() {
    return {
      "address": {
        "country_id": this.countryId,
        "same_as_billing": 1
      }
    };
  }
}

class Country{
  int? id;
  String? country;
  String? countryCode;
  List<String> provinces = [];

  int? provincesId;
  String? province;
  String? provinceCode;
  List<String> districts = [];

  int? districtsId;
  String? district;
  String? districtCode;
  List<String> villages = [];

  int? villagesId;
  String? village;
  String? villageCode;
  String? addresses;

  Country(
      this.id,
      this.country,
      this.countryCode,
      this.provinces,
      this.provincesId,
      this.province,
      this.provinceCode,
      this.districts,
      this.districtsId,
      this.district,
      this.districtCode,
      this.villages,
      this.villagesId,
      this.village,
      this.villageCode,
      this.addresses);

  Country.fromJson(Map<String, dynamic> json){
    this.id = json["id"];
    this.country = json["country"];
    this.countryCode = json["countryCode"];
    if (json["provinces"] != null){
      json["provinces"].forEach((value) {
        provinces = [];
        provinces.add(value);
      });
    }
  }
}

class Province{
  int? id;
  String? name;
  String? provinceCode;

  Province({this.id, this.name, this.provinceCode});

  Province.fromJson(Map<String, dynamic> json){
    print("data Province: --" + json.toString()+ "--");

    this.id = json["id"];
    this.name = json["province"];
    this.provinceCode = json["provinceCode"];
  }
}

class District{
  int? id;
  String? name;
  String? districtCode;

  District({this.id, this.name, this.districtCode});

  District.fromJson(Map<String, dynamic> json){
    print("data Province: --" + json.toString()+ "--");

    this.id = json["id"];
    this.name = json["district"];
    this.districtCode = json["districtCode"];
  }
}

class Village{
  int? id;
  String? name;
  String? villageCode;

  Village({this.id, this.name, this.villageCode});

  Village.fromJson(Map<String, dynamic> json){
    print("data Province: --" + json.toString()+ "--");

    this.id = json["id"];
    this.name = json["village"];
    this.villageCode = json["villageCode"];
  }
}
