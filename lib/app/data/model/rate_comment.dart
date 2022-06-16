
class Rate{
  int? id;
  String? avatar;
  String? userName;
  double? rateTotal;
  String? content;
  String? time;
  Rate? reply;

  Rate();


  Rate.fromJson(Map<String,dynamic> json){
    this.id = json['id'];
    this.avatar = json['avatar'];
    this.userName = json['username'];
    this.rateTotal = json['rate'];
    this.content = json['content'];
    this.time = json['time'];
    if(json['reply'] != null){
      reply = Rate();
      reply?.id = json['reply']['id'];
      reply?.avatar = json['reply']['avatar'];
      reply?.userName = json['reply']['username'];
      reply?.content = json['reply']['content'];
      reply?.time = json['reply']['time'];
    }
  }
}