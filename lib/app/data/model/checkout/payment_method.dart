import 'dart:convert';

class PaymentMethod{
  String? code;
  String? title;

  PaymentMethod({this.code, this.title});

  PaymentMethod.fromJson(json){
    this.code = json['code'];
    this.title = json['title'];
  }
}