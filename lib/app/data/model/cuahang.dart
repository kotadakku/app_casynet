
import 'dart:convert';

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
  String? time_open;
  String? time_close;
  String? intro_store;
  String? product_count;


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

  CuaHang.fromJson(Map<String, dynamic> data) {
    idcuahang = data['id'].toString();
    slthich = data['liked'].toString();
    slbinhluan = data['comment'].toString();
    slchiase = data['vote'].toString();
    tencuahang = data['name'].toString();
    sodienthoai = data['phone'].toString();
    diachicuahang = data['address'].toString();
    khoangcachtoicuahang = data['distance'].toString();
    anhsanpham = "https://casynet-api.herokuapp.com"+data['images'][0]['image'];
    time_open = data['time_open'].toString();
    time_close = data['time_close'].toString();
    intro_store = data['intro_store'].toString();
    product_count = data['product_count'].toString();
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