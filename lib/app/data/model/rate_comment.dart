
class Rate{
  int? idRate;
  String? avatar;
  String? userName;
  double? rateTatol;
  String? content;
  DateTime? time;
  List<String> reply = [];

  Rate.fromJson(Map<String,dynamic> json){
    this.idRate = json['idRate'];
    this.avatar = json['avatar'];
    this.userName = json['userName'];
    this.rateTatol = json['rateTatol'];
    this.content = json['content'];
    this.time = json['time'];
    if(json['reply'] != null){
      json['reply'].forEach((value){
        reply = [];
        reply.add(value);
      });
    }
  }
}