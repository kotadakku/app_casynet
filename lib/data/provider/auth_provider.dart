

import 'dart:convert';

import 'package:app_casynet/library/http_service.dart';

import '../model/user.dart';

class AuthProvider {

  fetchLogin({required User user,
    onSuccess(data)?,
    onError(error)?,
    beforePost()?}) {
    ApiRequest(url: 'https://casynet-api.herokuapp.com/api/login').post(
        data: user.toJsonLogin(),
        onSuccess: (data){
          print(data);
          onSuccess!(User.successLogin(data));
        },
        onError: (error) { if(onError!= null) onError(error);}
    );
  }

  fetchRegister({required User user,
    onSuccess(data)?,
    onError(error)?,
    beforePost()?}
      ){
    ApiRequest(url: 'https://casynet-api.herokuapp.com/api/register').post(
        data: user.toJsonRegister(),
        onSuccess: (data){
          print(data);
          onSuccess!(User.successRegister(json.decode(data)));
        },
        onError: (error) => onError!(error)
    );
  }
}