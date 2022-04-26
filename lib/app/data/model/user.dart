class User{
  int? id;
  String? email;
  String? password;
  String? token;
  String? username;
  String? phone;
  bool? gender;
  String? birthday;
  String? image;

  User({this.email, this.password, this.id, this.token, this.username, this.phone, this.gender, this.birthday, this.image});
  Map<String, dynamic> toJsonRegister(){
    return {
      'email': this.email,
      'password': this.password,
      'username': this.username
    };
  }

  Map<String, dynamic> toJsonLogin(){
    return {
      'email': this.email,
      'password': this.password,
    };
  }

  factory User.successRegister(Map<String, dynamic> json){
    return User(
      id : int.parse(json['id']),
      token: json['access_token'],
    );
  }

  factory User.successLogin(Map<String, dynamic> json){
    return User(
      token: json['access_token'],
      id: json['id'],
      username: json['username'],
      email: json['email'],
      phone: json['phone'].toString(),
      gender: json['gender'],
      birthday: json['birth_day'],
      image: json['image']
    );
  }
}