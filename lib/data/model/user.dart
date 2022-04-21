class User{
  int? id;
  String? email;
  String? password;
  String? token;
  String? username;

  User({this.email, this.password, this.id, this.token});
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
    );
  }
}