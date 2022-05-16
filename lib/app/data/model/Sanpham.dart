class Sanpham {
  String? masanpham;
  String? name;
  String? motasanpham;
  String? soluongnhapkho;
  String? gia;
  String? giakhuyenmai;
  String? soluongconlai;
  String? idxuatxu;
  String? loaisanpham;
  String? yeucauhentruoc;
  String? ngayhethan;
  String? tinhtrangkhohang;
  String? hienthisanpham;
  String? hienthiotrangchinh;
  String? tencuahang;
  String? imageUrl;
  late bool checkBoxSanPham;
  late bool checkBoxTenCuaHang;

  Sanpham.a({this.masanpham,
    this.name,
    // this.motasanpham,
    // this.soluongnhapkho,
    this.gia,
    this.giakhuyenmai,
    // this.soluongconlai,
    // this.idxuatxu,
    // this.loaisanpham,
    // this.yeucauhentruoc,
    // this.ngayhethan,
    // this.tinhtrangkhohang,
    // this.hienthisanpham,
    // this.hienthiotrangchinh,
    this.tencuahang,
    this.imageUrl,
    this.checkBoxSanPham = false,
    this.checkBoxTenCuaHang = false,

  });
  Sanpham.s(this.masanpham,
      this.name,
      this.motasanpham,
      this.soluongnhapkho,
      this.gia,
      this.giakhuyenmai,
      this.soluongconlai,
      this.idxuatxu,
      this.loaisanpham,
      this.yeucauhentruoc,
      this.ngayhethan,
      this.tinhtrangkhohang,
      this.hienthisanpham,
      this.hienthiotrangchinh);

  Sanpham(
      {this.masanpham,
        this.name,
        this.motasanpham,
        this.soluongnhapkho,
        this.gia,
        this.giakhuyenmai,
        this.soluongconlai,
        this.idxuatxu,
        this.loaisanpham,
        this.yeucauhentruoc,
        this.ngayhethan,
        this.tinhtrangkhohang,
        this.hienthisanpham,
        this.hienthiotrangchinh,
        this.tencuahang,
        this.imageUrl});

  Sanpham.fromJson(Map<String, dynamic> json) {
    masanpham = json['Masanpham'];
    name = json['name'];
    motasanpham = json['Motasanpham'];
    soluongnhapkho = json['Soluongnhapkho'];
    gia = json['Gia'];
    giakhuyenmai = json['Giakhuyenmai'];
    soluongconlai = json['Soluongconlai'];
    idxuatxu = json['Idxuatxu'];
    loaisanpham = json['Loaisanpham'];
    yeucauhentruoc = json['Yeucauhentruoc'];
    ngayhethan = json['Ngayhethan'];
    tinhtrangkhohang = json['Tinhtrangkhohang'];
    hienthisanpham = json['Hienthisanpham'];
    hienthiotrangchinh = json['Hienthiotrangchinh'];
    tencuahang = json['tencuahang'];
    imageUrl = json['imageUrl'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['Masanpham'] = this.masanpham;
    data['name'] = this.name;
    data['Motasanpham'] = this.motasanpham;
    data['Soluongnhapkho'] = this.soluongnhapkho;
    data['Gia'] = this.gia;
    data['Giakhuyenmai'] = this.giakhuyenmai;
    data['Soluongconlai'] = this.soluongconlai;
    data['Idxuatxu'] = this.idxuatxu;
    data['Loaisanpham'] = this.loaisanpham;
    data['Yeucauhentruoc'] = this.yeucauhentruoc;
    data['Ngayhethan'] = this.ngayhethan;
    data['Tinhtrangkhohang'] = this.tinhtrangkhohang;
    data['Hienthisanpham'] = this.hienthisanpham;
    data['Hienthiotrangchinh'] = this.hienthiotrangchinh;
    data['tencuahang'] = this.tencuahang;
    data['imageUrl'] = this.imageUrl;
    return data;
  }
}


/*
class Sanpham {
  String? masanpham;
  String? name;
  String? motasanpham;
  String? soluongnhapkho;
  String? gia;
  String? giakhuyenmai;
  String? soluongconlai;
  String? idxuatxu;
  String? loaisanpham;
  String? yeucauhentruoc;
  String? ngayhethan;
  String? tinhtrangkhohang;
  String? hienthisanpham;
  String? hienthiotrangchinh;

  Sanpham.s(this.masanpham,
      this.name,
      this.motasanpham,
      this.soluongnhapkho,
      this.gia,
      this.giakhuyenmai,
      this.soluongconlai,
      this.idxuatxu,
      this.loaisanpham,
      this.yeucauhentruoc,
      this.ngayhethan,
      this.tinhtrangkhohang,
      this.hienthisanpham,
      this.hienthiotrangchinh);

  Sanpham(
      {this.masanpham,
        this.name,
        this.motasanpham,
        this.soluongnhapkho,
        this.gia,
        this.giakhuyenmai,
        this.soluongconlai,
        this.idxuatxu,
        this.loaisanpham,
        this.yeucauhentruoc,
        this.ngayhethan,
        this.tinhtrangkhohang,
        this.hienthisanpham,
        this.hienthiotrangchinh});

  Sanpham.fromJson(Map<String, dynamic> json) {
    masanpham = json['Masanpham'];
    name = json['name'];
    motasanpham = json['Motasanpham'];
    soluongnhapkho = json['Soluongnhapkho'];
    gia = json['Gia'];
    giakhuyenmai = json['Giakhuyenmai'];
    soluongconlai = json['Soluongconlai'];
    idxuatxu = json['Idxuatxu'];
    loaisanpham = json['Loaisanpham'];
    yeucauhentruoc = json['Yeucauhentruoc'];
    ngayhethan = json['Ngayhethan'];
    tinhtrangkhohang = json['Tinhtrangkhohang'];
    hienthisanpham = json['Hienthisanpham'];
    hienthiotrangchinh = json['Hienthiotrangchinh'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['Masanpham'] = this.masanpham;
    data['name'] = this.name;
    data['Motasanpham'] = this.motasanpham;
    data['Soluongnhapkho'] = this.soluongnhapkho;
    data['Gia'] = this.gia;
    data['Giakhuyenmai'] = this.giakhuyenmai;
    data['Soluongconlai'] = this.soluongconlai;
    data['Idxuatxu'] = this.idxuatxu;
    data['Loaisanpham'] = this.loaisanpham;
    data['Yeucauhentruoc'] = this.yeucauhentruoc;
    data['Ngayhethan'] = this.ngayhethan;
    data['Tinhtrangkhohang'] = this.tinhtrangkhohang;
    data['Hienthisanpham'] = this.hienthisanpham;
    data['Hienthiotrangchinh'] = this.hienthiotrangchinh;
    return data;
  }
}*/
