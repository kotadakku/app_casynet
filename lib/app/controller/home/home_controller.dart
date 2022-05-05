
import 'dart:async';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../data/model/banner_slider.dart';
import '../../data/model/sales.dart';
import '../../data/provider/banner_api_provider.dart';
import '../../data/provider/sales_api_provider.dart';
import '../../data/provider/sales_db_provider.dart';
import '../../data/provider/user_db_provider.dart';
import '../../utlis/base64.dart';

class HomeController extends GetxController{



  var isLoading = true;
  List<Sales> listSales = [];
  late String search_text = "";
  late bool _isVN = true;



  @override
  void onInit() {

    _getTopSaleBD();
  }


  @override
  void onReady(){
    super.onReady();
  }



  void _getTopSaleBD(){
    isLoading = true;
    TopSaleDatabaseHelper.instance.queryAllRows().then((value) {
      if(value?.length == 0){
        getSalesAPI();
      }else{
        print("<Home Controller> Load from db Top Sales");
        value?.forEach((element) {
          listSales.add(Sales(
              id: element['id'],
              title: element['title'],
              image: element['image']
          ));
          isLoading = false;
          update();
        });
      }
    });
  }
  void getSalesAPI() {
    isLoading = true;
    print("<Home Controller> Load from api Top Sales");
    SalesProvider().getSales(onSuccess: (sales){
      listSales.clear();
      TopSaleDatabaseHelper.instance.clear();

      sales.forEach((sale){
        ImageNetworkToBase64(url: sale.image).getHttp().then((base64) {
          TopSaleDatabaseHelper.instance.insert(Sales(image: base64, title: sale.title));
          listSales.add(Sales(image: base64, title: sale.title));
        });
      });
      isLoading = false;
      update();
    },
        beforeSend: (){},
        onError: (error){
          print("Error " + error.toString());
          isLoading = false;
          update();
        }
    );
  }

  void onChangeSearchText( value){
    search_text = value;
    print(search_text);
  }

  bool get isVN => _isVN;

  void setIsVN() {
    _isVN = !isVN;
    update();
  }

  String languageToString() {
    if(_isVN) return 'VN';
    return 'EN';
  }
}
