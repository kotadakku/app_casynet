class ShippingMethod{
  String? carrierCode;
  String? methodCode;
  String? carrierTitle;
  bool? available;

  ShippingMethod({this.carrierCode, this.methodCode, this.carrierTitle, this.available});

  ShippingMethod.fromJson(json){
    this.carrierCode = json['carrier_code'];
    this.methodCode = json['method_code'];
    this.carrierTitle = json['carrier_title'];
    this.available = json['available'];
  }

  Map<String, dynamic> toJson(String countryId){
    return {
      "addressInformation": {
        "shipping_address": {
          "country_id": countryId
        },
        "shipping_carrier_code": this.carrierCode,
        "shipping_method_code": this.methodCode
      }
    };
  }
}