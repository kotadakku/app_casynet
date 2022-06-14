
class Voucher{
  int? idVoucher;
  String? nameVoucher;
  DateTime? effectiveTime;
  String? typeVoucher;

  Voucher({this.idVoucher, this.nameVoucher, this.effectiveTime, this.typeVoucher});

  Voucher.fromJson(Map<String,dynamic> json){
   this.idVoucher = json['idVoucher'];
   this.nameVoucher = json['nameVoucher'];
   this.effectiveTime = json['effectiveTime'];
   this.typeVoucher = json['typeVoucher'];
  }
}