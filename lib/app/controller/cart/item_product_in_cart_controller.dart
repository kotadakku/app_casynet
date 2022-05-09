
import 'package:app_casynet/app/data/model/item_product_in_cart.dart';
import 'package:app_casynet/app/data/provider/item_product_in_cartme_provider.dart';
import 'package:app_casynet/app/views/screens/cart/cart.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import "package:collection/collection.dart";
import '../../data/provider/db/cart_db_provider.dart';
import '../auth/cache_manager.dart';

class ProductCartMeController extends GetxController with CacheManager {
  List<ProductCart> productCartList = [];
  var cartsByStore ;
  var isLoading = true;
  var isLoadingComplete = true;
  List<TextEditingController> controllers = [];
  var checkBoxProduct = [].obs;

  @override
  void onInit() {
    updateAPI();
    getCartDB();
    print(productCartList.length);


  }

  void insertProductCart(ProductCart productCart) {

    CartDatabaseHelper.instance.checkExists(productCart.p_id).then((value){
      print('Item Product $value');
      if(value){

        CartDatabaseHelper.instance.addQuantity(productCart.p_id).then((value){
          getCartDB();
        });
      }
      else{
        CartDatabaseHelper.instance.insert(productCart).then((value){
          getCartDB();
        });
      }
    });


  }



  void updateQuantity(int qty,int? id){
    if(id !=null){

      CartDatabaseHelper.instance.updateQuantity(qty, id);
      productCartList.where((element) => element.p_id == id).first.quantity = qty;
      update();
    }
  }

  void updateAPI() {
    productCartList.clear();
    isLoading = true;
    final token = getToken();

    ProductCartMeProvider().fetchProductCartMeList(
        token: token,
        onSuccess: (data) {
          productCartList.addAll(data);

          isLoading = false;
          update();
        },
        onError: (error) {
          isLoading = false;
          print("Load ProductCart (tai bi loi): " + error);
          update();
        }
    );
  }

  void getCartDB() {
    isLoading = true;
    isLoadingComplete = true;
    productCartList.clear();

    CartDatabaseHelper.instance.queryAllRows().then((value) {
      value?.forEach((element) {
        productCartList.add(ProductCart(
          p_id: element['p_id'],
          p_sku: element['p_sku'],
          p_name: element['p_name'],
          p_image: element['p_image'],
          price: element['price'],
          discount_price: element['discount_price'],
          quantity: element['quantity'],
          s_name: element['s_name'],
          cartId: element['cartId'],
        ));
        isLoading = false;
        isLoadingComplete = false;
        update();
      });
      cartsByStore = groupBy(productCartList, (ProductCart obj) => obj.s_name);
      print(cartsByStore['Babaas'][0].quantity);
      isLoadingComplete = false;
      update();
    });
  }
}