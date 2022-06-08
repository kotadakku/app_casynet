
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