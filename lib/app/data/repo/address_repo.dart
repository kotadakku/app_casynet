
import 'package:app_casynet/app/config/api_config.dart';
import 'package:app_casynet/app/data/provider/api/exceptions.dart';
import 'package:app_casynet/app/utlis/data/data.dart';
import 'package:dio/dio.dart';

import '../../config/api_params.dart';
import '../provider/api/api_provider.dart';
import '../provider/api/responses.dart';

class AddressRepo {
  Future<Responses<Province>?> getProvinces({Map<String, dynamic>? queryParameters, Options? options}) async{
    try{
      final response = await ApiRequest().get(
        path: ApiConfig.baseUrl2 + ApiConfig.provinces,
        queryParameters: queryParameters,
        options: options
      );
      if(response != null){
        // String html = response.data
        List<Province> dataAddress = List<Province>.from(

            (response.data).map((e) => Province.fromJson(e)));


        return Responses<Province>(isSuccess: true, listObjects: dataAddress);
      }
      return Responses<Province>(statusCode: CODE_RESPONSE_NULL, msg: "");
    }catch(error){
      final errorMessage = DioExceptions.fromDioError(error);
      return Responses<Province>(statusCode: CODE_ERROR, msg: errorMessage.toString());
    }
  }
  Future<Responses<District>?> getDistricts({Map<String, dynamic>? queryParameters, Options? options}) async{
    try{
      final response = await ApiRequest().get(
        path: ApiConfig.baseUrl2 + ApiConfig.districts,
        queryParameters: queryParameters,
        options: options
      );
      if(response != null){
        // String html = response.data
        List<District> districts = List<District>.from(
            (response.data).map((e) => District.fromJson(e)));

        return Responses<District>(isSuccess: true, listObjects: districts);
      }
      return Responses<District>(statusCode: CODE_RESPONSE_NULL, msg: "");
    }catch(error){
      final errorMessage = DioExceptions.fromDioError(error);
      return Responses<District>(statusCode: CODE_ERROR, msg: errorMessage.toString());
    }
  }

  Future<Responses<Village>?> getVillages({Map<String, dynamic>? queryParameters, Options? options}) async{
    try{
      final response = await ApiRequest().get(
          path: ApiConfig.baseUrl2 + ApiConfig.villages,
          queryParameters: queryParameters,
          options: options
      );
      if(response != null){
        // String html = response.data
        List<Village> villages = List<Village>.from(
            (response.data).map((e) => Village.fromJson(e)));

        return Responses<Village>(isSuccess: true, listObjects: villages);
      }
      return Responses<Village>(statusCode: CODE_RESPONSE_NULL, msg: "");
    }catch(error){
      final errorMessage = DioExceptions.fromDioError(error);
      return Responses<Village>(statusCode: CODE_ERROR, msg: errorMessage.toString());
    }
  }
}

