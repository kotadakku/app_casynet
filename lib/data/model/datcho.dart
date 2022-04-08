

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
        this.phantramgiamgia});

  DatCho.fromJson(Map<String, dynamic> json) {
    idsanpham = int.parse(json['idsanpham']);
    loaixe = int.parse(json['loaixe']);
    tensanpham = json['tensanpham'];
    hinhanhsanpham = json['hinhanhsanpham'];
    giauudai = int.parse(json['giauudai']);
    giasanpham = int.parse(json['giasanpham']);
    tencuahang = json['tencuahang'];
    khoangcachtoicuahang = int.parse(json['khoangcachtoicuahang']);
    slthich = int.parse(json['slthich']);
    slbinhluan = int.parse(json['slbinhluan']);
    sldanhgia = double.parse(json['sldanhgia']);
    diemthuongcasycoin = int.parse(json['diemthuongcasycoin']);
    phantramgiamgia = int.parse(json['phantramgiamgia']);
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