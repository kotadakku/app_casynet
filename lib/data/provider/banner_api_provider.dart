
import 'dart:convert';

import 'package:app_casynet/library/http_service.dart';

import '../model/banner_slider.dart';

class BannerProvider{

  void getBanners({
    required onSuccess(data),
    onError(error)?,
    beforeSend()?
  }){
    ApiRequest(url: "https://coaxial-typewriter.000webhostapp.com/Server/banner.php").get(
      onSuccess: (data){
        onSuccess((json.decode(data) as List).map((e) => BannerSlider.fromJson(e)).toList());
      },
      onError: (error){
        if(onError!= null) onError(error);
    }
    );
  }
}