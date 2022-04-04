class Address {
  String name;
  String phone;
  String province;
  String district;
  String detail_address;
  bool default_address;
  Address({required this.name, required this.phone, required this.province, required this.district,
        required this.detail_address, required this.default_address});

  factory Address.fromJson(Map<String, dynamic> json) {
    return Address(
      name: json['name'],
      phone: json['phone'],
      province: json['province'],
      district: json['district'],
      detail_address: json['detail_address'],
      default_address: json['default_address'],
    );
  }
}