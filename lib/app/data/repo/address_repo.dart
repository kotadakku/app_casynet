
import 'package:app_casynet/app/config/api_config.dart';
import 'package:app_casynet/app/data/provider/api/exceptions.dart';
import 'package:app_casynet/app/utlis/data/data.dart';

import '../../config/api_params.dart';
import '../provider/api/api_provider.dart';
import '../provider/api/responses.dart';

class AddressRepo {
  Future<Responses<DataAddress>?> getDataAddress() async{
    try{
      final response = await ApiRequest().get(
        path: ApiConfig.baseUrl + ApiConfig.dataAddress
      );
      if(response != null){
        // String html = response.data
        List<DataAddress> dataAddress = List<DataAddress>.from(
            (response.data.keys).map((e) => DataAddress.fromJson(e)));

        return Responses<DataAddress>(isSuccess: true, listObjects: dataAddress);
      }
      return Responses<DataAddress>(statusCode: CODE_RESPONSE_NULL, msg: "");
    }catch(error){
      final errorMessage = DioExceptions.fromDioError(error);
      return Responses<DataAddress>(statusCode: CODE_ERROR, msg: errorMessage.toString());
    }
  }
}