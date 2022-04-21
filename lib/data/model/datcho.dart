import 'cuahang.dart';


class DatCho {
  int? idsanpham;
  int? loaixe;
  String? tensanpham;
  String? hinhanhsanpham;
  int? giauudai;
  int? giasanpham;
  String? tencuahang;
  int? khoangcachtoicuahang;
  int? slthich;
  int? slbinhluan;
  double? sldanhgia;
  int? diemthuongcasycoin;
  int? phantramgiamgia;
  CuaHang? store;


  DatCho(
      {this.idsanpham,
        this.loaixe,
        this.tensanpham,
        this.hinhanhsanpham,
        this.giauudai,
        this.giasanpham,
        this.tencuahang,
        this.khoangcachtoicuahang,
        this.slthich,
        this.slbinhluan,
        this.sldanhgia,
        this.diemthuongcasycoin,
        this.phantramgiamgia,
        this.store
      });

  DatCho.fromJson(Map<String, dynamic> json) {
    idsanpham = int.parse(json['id'].toString());
    tensanpham = json["name"].toString();
    hinhanhsanpham = "https://casynet-api.herokuapp.com"+json['images'][0]['image'];;
    giauudai = json[ "price"];
    giasanpham = json["discount_price"];
    slthich = json["liked"];
    slbinhluan = json["comment"];
    sldanhgia = json["vote"];
    diemthuongcasycoin = json["point"];
    phantramgiamgia = json["sale_off"];
    store = CuaHang(
      tencuahang: json["store"]["name"].toString(),
      khoangcachtoicuahang: json["store"]["distance"].toString()
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['idsanpham'] = this.idsanpham;
    data['loaixe'] = this.loaixe;
    data['tensanpham'] = this.tensanpham;
    data['hinhanhsanpham'] = this.hinhanhsanpham;
    data['giauudai'] = this.giauudai;
    data['giasanpham'] = this.giasanpham;
    data['tencuahang'] = this.tencuahang;
    data['khoangcachtoicuahang'] = this.khoangcachtoicuahang;
    data['slthich'] = this.slthich;
    data['slbinhluan'] = this.slbinhluan;
    data['sldanhgia'] = this.sldanhgia;
    data['diemthuongcasycoin'] = this.diemthuongcasycoin;
    data['phantramgiamgia'] = this.phantramgiamgia;
    return data;
  }
}