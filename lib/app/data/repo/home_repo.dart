
import 'dart:convert';
import 'package:app_casynet/app/data/model/banner_slider.dart';
import 'package:app_casynet/app/data/model/sales.dart';
import 'package:dio/dio.dart';
import '../../config/api_config.dart';
import '../../config/api_params.dart';
import '../model/category.dart';
import '../model/origin.dart';
import '../model/product.dart';
import '../provider/api/responses.dart';
import '../model/seller.dart';
import '../model/user.dart';
import '../provider/api/api_provider.dart';
import '../provider/api/exceptions.dart';
import '../provider/get_storage_provider.dart';

class HomePageRepo{
  // new
  Future<Responses<BannerSlider>?> getBannerSlider() async{
    try{
      final response = await ApiRequest().get(
          path: ApiConfig.baseUrl + ApiConfig.bannerNews
      );
      if(response != null){
        String html = response.data[0]['banner'];
        List<String> htmlList = html.replaceAll("\\","").split(">");
        
        List<BannerSlider> banners = List<BannerSlider>.from(
          htmlList.map((e) => BannerSlider(htmlTag: e+">"))
        );
        banners.removeLast();
        return Responses<BannerSlider>(isSuccess: true, listObjects: banners);
      }
      return Responses<BannerSlider>(statusCode: CODE_RESPONSE_NULL, msg: '');
    }catch(error){
      final errorMessage = DioExceptions.fromDioError(error);
      return Responses<BannerSlider>(statusCode: CODE_ERROR, msg: errorMessage.toString());
    }
  }

  Future<Responses<Category>> getCategories({Options? options, Map<String, dynamic>? queryParameters}) async {

    try {
      final response = await ApiRequest().get(
          path: ApiConfig.baseUrl + ApiConfig.categories,
          queryParameters: queryParameters,
          options: options
      );

      if (response != null) {
        List<Category> categories = List<Category>.from(
            (response.data["items"] as List).map((e) => Category.fromJson(e)));

        return Responses<Category>(isSuccess: true, listObjects: categories);
      }

      return Responses<Category>(statusCode: CODE_RESPONSE_NULL, msg: "");
    } catch (error) {
      final errorMessage = DioExceptions.fromDioError(error);
      return Responses<Category>(statusCode: CODE_ERROR, msg: errorMessage.toString());
    }
  }

  Future<Responses<Sales>> getSales() async {
    try{
      final response = await ApiRequest().get(
        path: "https://coaxial-typewriter.000webhostapp.com/Server/sale.php");
      if(response != null){
        List<Sales> sales = List<Sales>.from(
            (json.decode(response.data) as List).map((e) => Sales.fromJson(e))
        );
        return Responses<Sales>(isSuccess: true, listObjects: sales);
      }
      return Responses<Sales>(statusCode: CODE_RESPONSE_NULL, msg: "");
    } catch(error){
      final errorMessage = DioExceptions.fromDioError(error);
      return Responses<Sales>(statusCode: CODE_ERROR, msg: errorMessage.toString());
    }
  }

  Future<Responses<Origin>>  getOrigins({Map<String, dynamic>? queryParameters, Options? options }) async {
    try{
      final response = await ApiRequest().get(
        path: ApiConfig.baseUrl2 + ApiConfig.origin,
        options: options,
        queryParameters: queryParameters
      );
      if(response != null){
        List<Origin> origins = List<Origin>.from(
            (response.data as List).map((e) => Origin.fromJson(e))
        );
        return Responses<Origin>(statusCode: CODE_SUCCESS, isSuccess: true,
            listObjects: origins);
      }
      else {
        return Responses<Origin>(statusCode: CODE_RESPONSE_NULL, msg: '');
      }
    }
    catch (e){
      final errorMessage = DioExceptions.fromDioError(e);
      return Responses<Origin>(statusCode: CODE_ERROR, msg: errorMessage.toString());
    }
  }
}