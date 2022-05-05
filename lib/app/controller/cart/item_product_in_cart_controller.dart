
import 'package:app_casynet/app/data/model/item_product_in_cart.dart';
import 'package:app_casynet/app/data/provider/item_product_in_cartme_provider.dart';
import 'package:get/get.dart';

class ItemProductInCartMeController extends GetxController{
  List<ItemProductInCart> itemProductInCartList = [];
  var loadingItemProductInCart = true;

  @override
  void onInit() {
    updateAPI();

  }
  void updateAPI(){
    itemProductInCartList.clear();
    loadingItemProductInCart = true;

    ItemProductInCartMeProvider().fetchItemProductInCartMeList(onSuccess: (data){
      itemProductInCartList.addAll(data);
      loadingItemProductInCart = false;
      update();},
      onError: (error){
      loadingItemProductInCart = false;
      print("Load ItemProductInCart" + error);
      update();
      }
    );
  }
}