class Gift{
  int? id;
  String? title;
  String? description;
  bool? isDisplay;
  DateTime? startDate;
  DateTime? expireDate;
  bool? isSendEmail;
  List<int>? customers;
  List<String>? images;

  Gift();

  Map<String, dynamic> toJson() {
    return {

    };
  }

  Gift.fromJson(e) {

  }
}