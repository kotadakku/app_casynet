// import 'package:app_casynet/app/utlis/app_config.dart';

import 'package:app_casynet/app/data/model/user.dart';

class Address {
  int? id;
  String? email;

  int? websiteId;
  List<Address> addresses = [];
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

    id = json['id'];
    firstname = json['firstname'];
    lastname = json['lastname'];
    phone = json['telephone'];
    province = json['region']['region'];
    district = json['city'];
    if (json['street'] != null) {
      json['street'].forEach((value) {
        street = [];
        street.add(value);
      });
    }
    default_billing = json['default_billing'] ?? false;
    default_shipping = json['default_shipping'] ?? false;
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
}
