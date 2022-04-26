class Address {
  int id;
  String name;
  String phone;
  String province;
  String district;
  String detail_address;
  bool default_address;

  Address.init(this.id, this.name,this.phone,this.province,this.district,
    this.detail_address,this.default_address);

  Address({required this.name, required this.phone, required this.province, required this.district,
        required this.detail_address, required this.default_address, required int this.id});

  factory Address.fromJson(Map<String, dynamic> json) {
    return Address(
      id: int.parse(json['id']),
      name: json['name'],
      phone: json['phone'],
      province: json['province'],
      district: json['district'],
      detail_address: json['detail_address'],
      default_address: json['default_address'] == "0" ? true: false,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'phone': phone,
      'province': province,
      'district': district,
      'detail_address': detail_address,
      'default_address': default_address ? '0': '1',
    };
  }
}