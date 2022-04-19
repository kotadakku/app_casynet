class CuaHang {
  String? idcuahang;
  String? loaixe;
  String? slthich;
  String? slbinhluan;
  String? slchiase;
  String? tencuahang;
  String? sodienthoai;
  String? diachicuahang;
  String? khoangcachtoicuahang;
  String? anhsanpham;


  CuaHang.init(
      this.idcuahang,
      this.loaixe,
      this.slthich,
      this.slbinhluan,
      this.slchiase,
      this.tencuahang,
      this.sodienthoai,
      this.diachicuahang,
      this.khoangcachtoicuahang,
      this.anhsanpham);

  CuaHang(
      {this.idcuahang,
        this.loaixe,
        this.slthich,
        this.slbinhluan,
        this.slchiase,
        this.tencuahang,
        this.sodienthoai,
        this.diachicuahang,
        this.khoangcachtoicuahang,
        this.anhsanpham});

  CuaHang.fromJson(Map<String, dynamic> json) {
    idcuahang = json['id'].toString();
    slthich = json['liked'].toString();
    slbinhluan = json['comment'].toString();
    slchiase = json['vote'].toString();
    tencuahang = json['name'].toString();
    sodienthoai = json['phone'].toString();
    diachicuahang = json['address'].toString();
    khoangcachtoicuahang = json['distance'].toString();
    anhsanpham = "https://api-casynet-app.herokuapp.com"+json['image'].toString();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['idcuahang'] = this.idcuahang;
    data['loaixe'] = this.loaixe;
    data['slthich'] = this.slthich;
    data['slbinhluan'] = this.slbinhluan;
    data['slchiase'] = this.slchiase;
    data['tencuahang'] = this.tencuahang;
    data['sodienthoai'] = this.sodienthoai;
    data['diachicuahang'] = this.diachicuahang;
    data['khoangcachtoicuahang'] = this.khoangcachtoicuahang;
    data['anhsanpham'] = this.anhsanpham;
    return data;
  }
}