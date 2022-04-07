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
    idcuahang = json['idcuahang'];
    loaixe = json['loaixe'];
    slthich = json['slthich'];
    slbinhluan = json['slbinhluan'];
    slchiase = json['slchiase'];
    tencuahang = json['tencuahang'];
    sodienthoai = json['sodienthoai'];
    diachicuahang = json['diachicuahang'];
    khoangcachtoicuahang = json['khoangcachtoicuahang'];
    anhsanpham = json['anhsanpham'];
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