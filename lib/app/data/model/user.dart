import 'package:app_casynet/app/data/model/address.dart';

class User{
  int? id;
  String? email;
  String? password;
  String? token;
  String? username;
  String? firstname;
  String? lastname;
  String? phone;
  int? gender;
  int? storeId;
  String? birthday;
  String? image;
  String? created_at;
  bool? receiveNotification;
  List<Address> addresses = [];
  int? follow_seller;

  User({this.email, this.password, this.id, this.token, this.username, this.phone, this.gender, this.birthday, this.image, this.receiveNotification});

  Map<String, dynamic> toJsonRegister(){
    return {
      'email': this.email,
      'password': this.password,
      'username': this.username,
      'phone': this.phone,
      'birthday': this.birthday,
      'gender': this.gender,
      'receiveNotification': this.receiveNotification,
    };
  }

  Map<String, dynamic> toJsonLogin(){
    return {
      'username': this.email,
      'password': this.password,
    };
  }

  factory User.successRegister(Map<String, dynamic> json){
    return User(
      id : int.parse(json['id']),
      token: json['access_token'],
    );
  }

  User.successLogin(Map<String, dynamic> json){
    print(json);
    token = json['token'];
    id = json['id'];
    username = json['username'];
    lastname = json['lastname'];
    firstname = json['firstname'];
    email = json['email'];
    if(json['custom_attributes'] !=null){
      json['custom_attributes'].forEach((v) {
        if(v['attribute_code'] == 'phone_number'){

          phone = v['value'];
        };
      if(v['attribute_code'] == 'avatar'){
        image = 'https://client.casynet.com${v['value']}';
      };
      if(v['attribute_code'] == 'follow_seller'){
        follow_seller = int.parse(v['value']);
      };
      });
    }
    gender = json['gender'];
    birthday = json['dob'];
    storeId = json['store_id'];
    created_at = json['created_at'];
    if (json['addresses'] != null) {
      addresses = [];
      json['addresses'].forEach((v) {
        addresses.add(new Address.fromJson(v));
      });
    }
  }
}