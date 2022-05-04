

import 'dart:convert';

import 'package:app_casynet/app/utlis/http_service.dart';

import '../model/user.dart';

class AuthProvider {

  fetchLogin({required User user,
    onSuccess(data)?,
    onError(error)?,
    beforePost()?}) {
    ApiRequest(url: 'https://client.casynet.com/rest/V1/integration/customer/token').post(
        data: user.toJsonLogin(),
        onSuccess: (data){
          onSuccess!(data);
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

  void fetchCurrentUser({
    String? token,
    required onSuccess(data),
    onError(error)?,
    beforePost()?
  }) {
    ApiRequest(url: 'https://client.casynet.com/rest/default/V1/customers/me', token: token).get(
        onSuccess: (data){
          onSuccess(User.successLogin(data));
        },
        onError: (error) { if(onError!= null) onError(error);}
    );

  }
}