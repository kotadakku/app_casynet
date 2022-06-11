
import 'package:app_casynet/app/config/api_params.dart';
import 'package:app_casynet/app/data/model/address.dart';
import 'package:app_casynet/app/data/model/product.dart';
import 'package:app_casynet/app/data/repo/seller_repo.dart';
import 'package:app_casynet/data.dart';
import 'package:dio/dio.dart';
import 'package:dio/dio.dart' as dio;
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../../../data/model/category.dart';
import '../../../data/model/seller.dart';

class UpdateSellerController extends GetxController{

  late GlobalKey<FormState> formStateKeyShop;
  late Address addressShop;

  final listCategorySelected = <Category>[].obs;

  RxString open_hours = "".obs;
  RxString closer_hours = "".obs;

  RxString provinceShop = "".obs;
  RxString districtShop = "".obs;
  RxString communeShop = "".obs;

  Seller seller = Seller();
  final Address address = Address();
  final isUpdating = false.obs;
  var lat;
  var lon;
  final isLoading = false.obs;

  final ScaffoldMessengerState scaffoldMessenger = Get.find<ScaffoldMessengerState>();

  @override
  void onInit() {
    super.onInit();

    formStateKeyShop = GlobalKey<FormState>();
    addressShop = Address();
  }
  void saveSeller() async {
    if(formStateKeyShop.currentState!.validate()){
      formStateKeyShop.currentState!.save();
      seller.timeOpen = open_hours.value;
      seller.timeClose = closer_hours.value;
      seller.address_seller = address;
      seller.lat = lat;
      seller.lon = lon;
      print(seller.toJson());

      try{
        final result = await SellerRepo().createSeller(
          data: dio.FormData.fromMap(await seller.toJson()),
          options: Options(
            headers: {
              'Authorization' : 'Bearer '
            }
          )
        );
        if(result.statusCode == CODE_SUCCESS){
          isUpdating.value = false;
          Get.back();
               scaffoldMessenger.showSnackBar(
                 const SnackBar(content: Text('Thêm thành công!'), duration: Duration(seconds: 1)),
               );
        }else{
           print(result.msg.toString());
           isUpdating.value = false;
           scaffoldMessenger.showSnackBar(
             const SnackBar(content: Text('Thêm thất bại!'), duration: Duration(seconds: 1)
             )
           );
        }

      }catch(error){
        print(error.toString());
         isUpdating.value = false;
         scaffoldMessenger.showSnackBar(
           const SnackBar(content: Text('Thêm thất bại!'), duration: Duration(seconds: 1)
           )
         );
      }

    }

  }

  void getDetailSeller() async{
    try{
      final result = await SellerRepo().getSellers();
      if(result.statusCode == CODE_SUCCESS){
        isLoading.value = false;
        seller = result.objects!;

      }else{
        isLoading.value = false;
      }
    } catch(error){
      isLoading.value = false;

    }

  }
}