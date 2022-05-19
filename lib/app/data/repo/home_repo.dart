
import 'dart:convert';

import 'package:app_casynet/app/data/model/banner_slider.dart';
import 'package:app_casynet/app/data/model/banner_slider_new.dart';
import 'package:app_casynet/app/data/model/sales.dart';
import 'package:dio/dio.dart';

import '../../config/api_config.dart';
import '../../config/api_params.dart';
import '../model/category.dart';
import '../model/product.dart';
import '../model/responses.dart';
import '../model/seller.dart';
import '../model/user.dart';
import '../provider/api/api_provider.dart';
import '../provider/api/exceptions.dart';

class HomePageRepo{

  // new
  Future<Responses<BannerSliderNew>?> getBannerSliderNews() async{
    try{
      final responses = await ApiRequest().get(
          path: ApiConfig.banners
      );
      if(responses != null){
        List<BannerSliderNew> banners = List<BannerSliderNew>.from(
            (responses.data['banner'.replaceAll("\\","").split(">")] as List).map((e) => BannerSliderNew.fromJson)
        );
        return Responses<BannerSliderNew>(isSuccess: true, listObjects: banners);
      }
    }catch(error){
      final errorMessage = DioExceptions.fromDioError(error);
      return Responses<BannerSliderNew>(statusCode: CODE_ERROR, msg: errorMessage.toString());
    }
  }

  Future<Responses<BannerSlider>> getBanners() async {
    try{
      final response = await ApiRequest().get(
        path: ApiConfig.banners
      );
      if(response != null){
        List<BannerSlider> banners = List<BannerSlider>.from(
            (response.data['banners'] as List).map((e) => BannerSlider.fromJson(e))
        );
        return Responses<BannerSlider>(isSuccess: true, listObjects: banners);
      }
      return Responses<BannerSlider>(statusCode: CODE_RESPONSE_NULL, msg: "");
    }catch(error){
      final errorMessage = DioExceptions.fromDioError(error);
      return Responses<BannerSlider>(statusCode: CODE_ERROR, msg: errorMessage.toString());
    }
  }
  Future<Responses<Category>> getCategories() async {

    try {
      final response = await ApiRequest().get(
          path: ApiConfig.baseUrl + ApiConfig.categories,
          queryParameters: {
            'searchCriteria[filterGroups][0][filters][0][field]': 'level',
            'searchCriteria[filterGroups][0][filters][0][value]': '3',
            'searchCriteriafilterGroups[filters][0][condition_type]': 'eq',
          },
          options: Options(
              headers: {'Authorization': 'Bearer 2ws27cp7dodd1l4hzop7aaqulbbaog45'}
          )
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
  Future<Responses<Product>> getProducts() async {
    try{
      final response = await ApiRequest().get(
          path: ApiConfig.banners,
      );
      if(response != null){
        List<Product> products = List<Product>.from(
            (response.data['reservations'] as List).map((e) => Product.fromJson(e))
        );
        return Responses<Product>(isSuccess: true, listObjects: products);
      }
      return Responses<Product>(statusCode: CODE_RESPONSE_NULL, msg: "");
    } catch (error){
      final errorMessage = DioExceptions.fromDioError(error);
      return Responses<Product>(statusCode: CODE_ERROR, msg: errorMessage.toString());
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

  Future<Responses<Seller>> getSeller(int id) async {
    try{
      final response = await ApiRequest().get(
        path: ApiConfig.baseUrl + "/rest/V1/SellerHomePage",
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
  Future<Responses<Product>> getProductsSeller(int id) async {
    try{
      final response = await ApiRequest().get(
        path: "https://casynet-api.herokuapp.com/api/products",
        queryParameters: {
          'storeId': id,
        }
      );
      if(response != null){
        List<Product> products = List<Product>.from(
            (response.data as List).map((e) => Seller.fromJson(e))
        );
        return Responses<Product>(isSuccess: true, listObjects: products);
      }
      return Responses<Product>(statusCode: CODE_RESPONSE_NULL, msg: "");
    } catch(error){
      final errorMessage = DioExceptions.fromDioError(error);
      return Responses<Product>(statusCode: CODE_ERROR, msg: errorMessage.toString());
    }
  }
  Future<Responses<String>> getTokenUser(data) async {
    try{
      final response = await ApiRequest().post(
        path: ApiConfig.baseUrl + '/rest/V1/integration/customer/token',
        data: data
      );
      if(response != null){
        String token = response.data;
        return Responses<String>(isSuccess: true, objects: token);
      }
      return Responses<String>(statusCode: CODE_RESPONSE_NULL, msg: "");
    } catch (error){
      final errorMessage = DioExceptions.fromDioError(error);
      return Responses<String>(statusCode: CODE_ERROR, msg: errorMessage.toString());
    }
  }
  Future<Responses<User>> getUser(Options options) async {
    try{
      final response = await ApiRequest().get(
        path: ApiConfig.baseUrl + '/rest/default/V1/customers/me',
        options: options
      );
      if(response != null){
        User user = User.successLogin(response.data);
        return Responses<User>(isSuccess: true, objects: user);
      }
      return Responses<User>(statusCode: CODE_RESPONSE_NULL, msg: "");
    } catch (error){
      final errorMessage = DioExceptions.fromDioError(error);
      return Responses<User>(statusCode: CODE_ERROR, msg: errorMessage.toString());
    }
  }
  Future<Responses<User>> createUser(data) async {
    try{
      final response = await ApiRequest().post(
        path: ApiConfig.baseUrl + '/rest/V1/customers/',
        data: data
      );
      if(response != null){
        User user = User.successLogin(response.data);
        return Responses<User>(isSuccess: true, objects: user);
      }
      return Responses<User>(statusCode: CODE_RESPONSE_NULL, msg: "");

    } catch (error){
      final errorMessage = DioExceptions.fromDioError(error);
      return Responses<User>(statusCode: CODE_ERROR, msg: errorMessage.toString());
    }
  }
  Future<Responses<User>> updateAddress({data, Options? options}) async{
    try{
      final response = await ApiRequest().put(
        path: ApiConfig.baseUrl + '/rest/V1/customers/me',
        data: data,
        options: options
      );
      if(response != null){
        User user = User.successLogin(response.data);
        return Responses<User>(isSuccess: true, objects: user);
      }
      return Responses<User>(statusCode: CODE_RESPONSE_NULL, msg: '');
    } catch(error){
      final errorMessage = DioExceptions.fromDioError(error);
      return Responses<User>(statusCode: CODE_ERROR, msg: errorMessage.toString());
    }
  }
}