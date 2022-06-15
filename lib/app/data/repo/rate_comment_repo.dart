
import 'package:app_casynet/app/config/api_config.dart';
import 'package:app_casynet/app/data/data.dart';

import '../../config/api_params.dart';

class RateCommentRepo{
  Future<Responses<Rate>?> getRateComent() async{
    try {
      final response = await ApiRequest().get(
        path: ApiConfig.ratecomment,
        // queryParameters: ,
      );
      if(response != null){
        List<Rate> dataRate = List<Rate>.from(
            // (response.data).map((e) => Rate.fromJson(e))
            (response.data).map((e) => Rate.fromJson(e))
        );
        return Responses<Rate>(isSuccess: true, listObjects: dataRate);
      }
      return Responses<Rate>(statusCode: CODE_RESPONSE_NULL, msg: "");
    }catch(error){
      final errorMessage = DioExceptions.fromDioError(error);
      return Responses<Rate>(statusCode: CODE_ERROR, msg: errorMessage.toString());
    }
  }
}