
import 'package:app_casynet/app/config/api_config.dart';
import 'package:app_casynet/app/data/provider/api/exceptions.dart';
import 'package:app_casynet/app/utlis/data/data.dart';
import 'package:dio/dio.dart';

import '../../config/api_params.dart';
import '../provider/api/api_provider.dart';
import '../provider/api/responses.dart';

class AddressRepo {
  Future<Responses<Province>?> getDataAddress() async{
    try{
      final response = await ApiRequest().get(
        path: ApiConfig.dataProvince,
        // data: data,
        // options: options
      );
      if(response != null){
        // String html = response.data
        List<Province> dataAddress = List<Province>.from(
            (response.data.keys[0]).gmap((e) => Province.fromJson(e)));

        return Responses<Province>(isSuccess: true, listObjects: dataAddress);
      }
      return Responses<Province>(statusCode: CODE_RESPONSE_NULL, msg: "");
    }catch(error){
      final errorMessage = DioExceptions.fromDioError(error);
      return Responses<Province>(statusCode: CODE_ERROR, msg: errorMessage.toString());
    }
  }
}

