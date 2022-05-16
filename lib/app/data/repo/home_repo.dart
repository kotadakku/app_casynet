
import 'dart:convert';

import 'package:app_casynet/app/data/model/banner_slider.dart';
import 'package:app_casynet/app/data/model/sales.dart';
import 'package:dio/dio.dart';

import '../../config/api_params.dart';
import '../model/category.dart';
import '../model/product.dart';
import '../model/responses.dart';
import '../../config/api_config.dart';
import '../model/seller.dart';
import '../provider/api/api_provider.dart';
import '../provider/api/exceptions.dart';

class HomePageRepo{

  Future<Resonses<BannerSlider>> getBanners() async {
    try{
      final response = await ApiRequest().get(
        path: ApiConfig.banners
      );
      if(response != null){
        List<BannerSlider> banners = List<BannerSlider>.from(
            (response.data['banners'] as List).map((e) => BannerSlider.fromJson(e))
        );
        return Resonses<BannerSlider>(isSuccess: true, listObjects: banners);
      }
      return Resonses<BannerSlider>(statusCode: CODE_RESPONSE_NULL, msg: "");
    }catch(error){
      final errorMessage = DioExceptions.fromDioError(error);
      return Resonses<BannerSlider>(statusCode: CODE_ERROR, msg: errorMessage.toString());
    }
  }
  Future<Resonses<Category>> getCategories() async {

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

        return Resonses<Category>(isSuccess: true, listObjects: categories);
      }

      return Resonses<Category>(statusCode: CODE_RESPONSE_NULL, msg: "");
    } catch (error) {
      final errorMessage = DioExceptions.fromDioError(error);
      return Resonses<Category>(statusCode: CODE_ERROR, msg: errorMessage.toString());
    }
  }
  Future<Resonses<Product>> getProducts() async {
    try{
      final response = await ApiRequest().get(
          path: ApiConfig.banners,
      );
      if(response != null){
        List<Product> products = List<Product>.from(
            (response.data['reservations'] as List).map((e) => Product.fromJson(e))
        );
        return Resonses<Product>(isSuccess: true, listObjects: products);
      }
      return Resonses<Product>(statusCode: CODE_RESPONSE_NULL, msg: "");
    } catch (error){
      final errorMessage = DioExceptions.fromDioError(error);
      return Resonses<Product>(statusCode: CODE_ERROR, msg: errorMessage.toString());
    }
  }
  Future<Resonses<Sales>> getSales() async {
    try{
      final response = await ApiRequest().get(
        path: "https://coaxial-typewriter.000webhostapp.com/Server/sale.php");
      if(response != null){
        List<Sales> sales = List<Sales>.from(
            (json.decode(response.data) as List).map((e) => Sales.fromJson(e))
        );
        return Resonses<Sales>(isSuccess: true, listObjects: sales);
      }
      return Resonses<Sales>(statusCode: CODE_RESPONSE_NULL, msg: "");
    } catch(error){
      final errorMessage = DioExceptions.fromDioError(error);
      return Resonses<Sales>(statusCode: CODE_ERROR, msg: errorMessage.toString());
    }
  }
  Future<Resonses<Seller>> getSellers() async {
    try{
      final response = await ApiRequest().get(
        path: "https://casynet-api.herokuapp.com/api?isCar=1",
      );
      if(response != null){
        List<Seller> sellers = List<Seller>.from(
            (response.data['stores'] as List).map((e) => Seller.fromJson(e))
        );
        return Resonses<Seller>(isSuccess: true, listObjects: sellers);
      }
      return Resonses<Seller>(statusCode: CODE_RESPONSE_NULL, msg: "");
    } catch(error){
      final errorMessage = DioExceptions.fromDioError(error);
      return Resonses<Seller>(statusCode: CODE_ERROR, msg: errorMessage.toString());
    }
  }

  Future<Resonses<Seller>> getSeller(int id) async {
    try{
      final response = await ApiRequest().get(
        path: "https://casynet-api.herokuapp.com/api/store/$id",
      );
      if(response != null){
        Seller seller = Seller.fromJson(response.data);
        return Resonses<Seller>(isSuccess: true, objects: seller);
      }
      return Resonses<Seller>(statusCode: CODE_RESPONSE_NULL, msg: "");
    } catch(error){
      final errorMessage = DioExceptions.fromDioError(error);
      return Resonses<Seller>(statusCode: CODE_ERROR, msg: errorMessage.toString());
    }
  }

  Future<Resonses<Product>> getProductsSeller(int id) async {
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
        return Resonses<Product>(isSuccess: true, listObjects: products);
      }
      return Resonses<Product>(statusCode: CODE_RESPONSE_NULL, msg: "");
    } catch(error){
      final errorMessage = DioExceptions.fromDioError(error);
      return Resonses<Product>(statusCode: CODE_ERROR, msg: errorMessage.toString());
    }
  }
}