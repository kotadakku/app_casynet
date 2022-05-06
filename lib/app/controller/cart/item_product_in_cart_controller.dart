
import 'package:app_casynet/app/controller/auth/authentication_manager.dart';
import 'package:app_casynet/app/data/model/item_product_in_cart.dart';
import 'package:app_casynet/app/data/provider/item_product_in_cartme_provider.dart';
import 'package:get/get.dart';

import '../auth/cache_manager.dart';

class ItemProductInCartMeController extends GetxController with CacheManager{
  List<ItemProductInCart> itemProductInCartList = [];
  var loadingItemProductInCart = true;

  @override
  void onInit() {
    updateAPI();

  }
  void updateAPI(){
    itemProductInCartList.clear();
    loadingItemProductInCart = true;
    final token = getToken();

    ItemProductInCartMeProvider().fetchItemProductInCartMeList(
        token: token,
        onSuccess: (data){
          itemProductInCartList.addAll(data);
          loadingItemProductInCart = false;
          update();},
          onError: (error){
          loadingItemProductInCart = false;
          print("Load ItemProductInCart (tai bi loi): " + error);
          update();
        }
    );
  }
}