
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
  // List<String> provinces = [];
  int? provincesId;
  String? province;
  String? provinceCode;

  Province({this.provincesId, this.province, this.provinceCode});

  Province.fromJson(Map<String, dynamic> json){
    print("data Province: --" + json.toString()+ "--");

    this.provincesId = json[0]["id"];
    this.province = json[0]["province"];
    this.provinceCode = json[0]["provinceCode"];
  }
}