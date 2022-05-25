
import 'package:app_casynet/app/data/model/responses.dart';
import 'package:app_casynet/app/data/model/seller.dart';

import '../../config/api_config.dart';
import '../../config/api_params.dart';
import '../model/responses.dart';
import '../model/seller.dart';
import '../provider/api/api_provider.dart';
import '../provider/api/exceptions.dart';

class SellerRepo{
  Future<Responses<Seller>> getSeller(String seller_url) async {
    try{
      final response = await ApiRequest().get(
        path: ApiConfig.baseUrl + '/pub/media/api_json/Seller Detail Json/' + seller_url +'.json',
      );
      if(response != null){
        Seller seller = Seller.fromJson(response.data);
        return Responses<Seller>(isSuccess: true, objects: seller);
      }
      return Responses<Seller>(statusCode: CODE_RESPONSE_NULL, msg: "");
    } catch(error){
      final errorMessage = DioExceptions.fromDioError(error);
      return Responses<Seller>(statusCode: CODE_ERROR, msg: errorMessage.toString());
    }
  }

  Future<Responses<Seller>> getSellers({Map<String, dynamic>?  queryParameters}) async {
    try{
      final response = await ApiRequest().get(
          path: ApiConfig.baseUrl + "/rest/V1/SellerHomePage",
          queryParameters: queryParameters
      );
      if(response != null){
        List<Seller> sellers = List<Seller>.from(
            (response.data as List).map((e) => Seller.fromJson(e))
        );
        return Responses<Seller>(isSuccess: true, listObjects: sellers);
      }
      return Responses<Seller>(statusCode: CODE_RESPONSE_NULL, msg: "");
    } catch(error){
      final errorMessage = DioExceptions.fromDioError(error);
      return Responses<Seller>(statusCode: CODE_ERROR, msg: errorMessage.toString());
    }
  }

}