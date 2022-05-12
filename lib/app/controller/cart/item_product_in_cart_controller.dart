
import 'package:app_casynet/app/data/model/item_product_in_cart.dart';
import 'package:app_casynet/app/data/provider/db/config_db.dart';
import 'package:app_casynet/app/data/provider/item_product_in_cartme_provider.dart';
import 'package:app_casynet/app/views/screens/cart/cart.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import "package:collection/collection.dart";
import '../../data/provider/db/db_provider.dart';
import '../auth/cache_manager.dart';

class ProductCartMeController extends GetxController with CacheManager {
  List<ProductCart> productCartList = [];
  var cartsByStore ;
  var isLoading = true;
  var isLoadingComplete = true;
  var sumCart = 0.obs;
  var countCart = 0.obs;
  List<TextEditingController> controllers = [];
  RxList checkBoxProduct = [].obs;

  @override
  void onInit() {
    getCartDB();
  }

  void deleteRow(int? id ){
    DatabaseHelper.instance.deleteRow(DBConfig.TABLE_CART, DBConfig.CART_COLUMN_P_ID, id);
    getCartDB();
    update();
  }

  void insertProductCart(ProductCart productCart) {

    DatabaseHelper.instance.checkExists(DBConfig.TABLE_CART, DBConfig.CART_COLUMN_P_ID, productCart.p_id ).then((value){
      print("<DB> row exist $value");
      if(value){
        DatabaseHelper.instance.addQuantity(DBConfig.TABLE_CART,
            DBConfig.CART_COLUMN_P_ID,
            DBConfig.CART_COLUMN_QUANTITY,
            productCart.quantity,
            productCart.p_id,).then((value){
          getCartDB();
        });
      }
      else{
        print("DB Insert to Cart");
        DatabaseHelper.instance.insert(DBConfig.TABLE_CART, productCart.toJson()).then((value){
          getCartDB();
        });
      }
    });


  }

  void updateQuantity(int qty,int? id){
    if(id !=null){
      DatabaseHelper.instance.updateQuantity(DBConfig.TABLE_CART,
        DBConfig.CART_COLUMN_P_ID,
        DBConfig.CART_COLUMN_QUANTITY,
        id, qty);
      productCartList.where((element) => element.p_id == id).first.quantity = qty;
      update();
    }
  }

  void updateAPI(String token) {
    print("<GET PRODUCT API>");
    isLoading = true;

    ProductCartMeProvider().fetchProductCartMeList(
        token: token,
        onSuccess: (data) {
          data.forEach((element) {
            insertProductCart(element);
          });
          cartsByStore = groupBy(productCartList, (ProductCart obj) => obj.s_name);
          calsumCart();
          countCart.value = productCartList.length;
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

  void getCartDB() async {
    print("<GET PRODUCT DB>");
    isLoading = true;
    isLoadingComplete = true;
    DatabaseHelper.instance.getAlls(DBConfig.TABLE_CART, DBConfig.CART_COLUMN_P_ID).then((value) {
      productCartList.clear();
      controllers.clear();
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
      calsumCart();
      countCart.value = productCartList.length;
      isLoadingComplete = false;
      update();
    });
  }

  void calsumCart(){
    if(cartsByStore !=null){
      sumCart.value =0;
      cartsByStore.entries.forEach((e){
        (e.value as List).forEach((cart){
          if(checkBoxProduct.contains(cart.p_id)){
            sumCart += int.parse(cart.quantity.toString()) * int.parse(cart.price.toString());
          }
        }
        );
      });
    }
    print('<SUM> $sumCart');
  }

  void clearCart(){
    productCartList.clear();
    controllers.clear();
    cartsByStore.clear();
    DatabaseHelper.instance.clear(DBConfig.TABLE_CART);
    countCart.value =0;
    calsumCart();
    update();
  }
}