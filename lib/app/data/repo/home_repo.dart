
import 'dart:convert';
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

  // Future<Responses<Sales>?> getLoadMoreStore()async{}

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
  Future<Responses<Product>> getProducts({Options? options, Map<String, dynamic>? queryParameters}) async {
    try{
      final response = await ApiRequest().get(
        path: ApiConfig.baseUrl + ApiConfig.products,
        options: options,
        queryParameters: queryParameters
      );
      if(response != null){
        List<Product> products = List<Product>.from(
            (response.data['items'] as List).map((e) => Product.fromJson1(e))
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


  Future<Responses<Seller>> getSellers({data,Map<String, dynamic>?  queryParameters}) async {
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

  Future<Responses<Seller>> getSellersLoadMore({data,Map<String,
      dynamic>?  queryParameters}) async {
    try{
      final response = await ApiRequest().get(
          path: ApiConfig.baseUrl + "/rest/V1/SellerHomePage",
          queryParameters: queryParameters
      );
      if(response != null){
        List<Seller> sellersLoadMore = List<Seller>.from(
            (response.data as List).map((e) => Seller.fromJson(e))
        );
        return Responses<Seller>(isSuccess: true, listObjects: sellersLoadMore);
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
        await GetStorageProvider().save(key: CacheManagerKey.USER.toString(), value: json.encode(response.data));
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