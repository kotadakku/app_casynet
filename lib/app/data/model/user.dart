import 'package:app_casynet/app/data/data.dart';
import 'package:app_casynet/app/utlis/app_config.dart';

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
  String? created_at;// ngày tạo tài khoản
  bool? receiveNotification; //nhận thông báo
  List<Address> addresses = [];
  int? follow_seller;


  User({
      this.id,
      this.email,
      this.password,
      this.token,
      this.username,
      this.firstname,
      this.lastname,
      this.phone,
      this.gender,
      this.storeId,
      this.birthday,
      this.image,
      this.created_at,
      this.receiveNotification,
      this.follow_seller});



  Map<String, dynamic> toJsonUserDb(){
    return {
      'id': this.id,
      'email': this.email,
      'password': this.password,
      'username': this.username,
      'firstname': this.firstname,
      'lastname': this.lastname,
      'phone': this.phone,
      'gender': this.gender,
      'storeId': this.storeId,
      'birthday': this.birthday,
      'image': this.image,
      'createAt': this.created_at,
      'receiveNotification': this.receiveNotification,
      'followSeller': this.addresses,
    };
  }

  Map<String, dynamic> toJsonRegister(){
    return {
      'customer':{
        'lastname': this.lastname,
        'firstname': this.firstname,
        'email': this.email,
        'store_id': 1,
        'website_id': 1,
        'dob': this.birthday,// ngày sinh
        'gender': this.gender,
        'custom_attributes':[
          {
            "attribute_code": "phone_number",
            "value": this.phone
          }
        ]
      },
      'password': this.password,

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

  // để làm gì
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
        image = '${AppConfig.URL_IMAGE_CUSTOMER}${v['value']}';
      };
      if(v['attribute_code'] == 'follow_seller'){
        follow_seller = int.parse(v['value']);
      };
      });
    }
    gender = json['gender'];
    birthday = json['dob']; // ngày sinh
    storeId = json['store_id'];
    created_at = json['created_at']; // ngày tạo
    if (json['addresses'] != null) {
      addresses = [];
      json['addresses'].forEach((v) {
        addresses.add(new Address.fromJson(v));
      });
    }
  }

  String fullnameToString(){
    if(firstname == null && lastname == null){
      return 'user_34249384';
    }
    return '${firstname??''} ${lastname??''}';
  }

  Map<String, dynamic> toEditJson(){
    return {
      "customer": {
        "email": this.email,
        "lastname" : this.lastname,
        "firstname": this.firstname,
        "website_id": 1,
        "gender": this.gender,
        "custom_attributes": [
          {
            "attribute_code": "phone_number",
            "value": this.phone
          }
        ]
      }
    };
  }

}