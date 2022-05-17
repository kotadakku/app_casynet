
import 'package:app_casynet/app/data/model/product_cart.dart';
import 'package:app_casynet/app/config/config_db.dart';
import "package:collection/collection.dart";
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../data/provider/db/db_provider.dart';
import '../../data/repo/account_repo.dart';
import '../auth/cache_manager.dart';

class ProductCartMeController extends GetxController with CacheManager, StateMixin {
  List<ProductCart> productCartList = [];
  final _productsCartList = <ProductCart>[].obs;
  var cartsByStore ;
  var isLoading = true;
  var isLoadingComplete = true;
  var sumCart = 0.obs;
  var countCart = 0.obs;
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

  void insertProductCart(ProductCart productCart)  {

    DatabaseHelper.instance.checkExists(DBConfig.TABLE_CART, DBConfig.CART_COLUMN_P_ID, productCart.p_id ).then((value){
      print("<DB> row exist $value");
      if(value){
        DatabaseHelper.instance.addQuantity(DBConfig.TABLE_CART,
            DBConfig.CART_COLUMN_P_ID,
            DBConfig.CART_COLUMN_QUANTITY,
            productCart.quantity,
            productCart.p_id,).then((value){
          updateAPI(productCart);
          getCartDB();
        });
      }
      else{
        print("DB Insert to Cart");
        DatabaseHelper.instance.insert(DBConfig.TABLE_CART, productCart.toJson()).then((value){
          updateAPI(productCart);
          getCartDB();
        });
      }
    });
  }

  Future<void> updateQuantity(int qty, ProductCart productCart) async {
    print('<Home> $qty');
    int? id = productCart.p_id;
    await updateAPI(productCart);
    if(id !=null){
      DatabaseHelper.instance.updateQuantity(DBConfig.TABLE_CART,
        DBConfig.CART_COLUMN_P_ID,
        DBConfig.CART_COLUMN_QUANTITY,
        id, qty);
      productCartList.where((element) => element.p_id == id).first.quantity = qty;
      update();
    }
  }

  Future<void> getCartAPI(String token) async {
    print("<GET PRODUCT API>");
    change(_productsCartList, status: RxStatus.loading());
    try{
      final result = await AccountRepo().getProductsCart(
        options: Options(
          headers: {

          }
        )
      );
      if(result != null){
        if(result.isSuccess){
          _productsCartList.value = result.listObjects ?? [];
          if(_productsCartList.isEmpty){
            change(_productsCartList, status: RxStatus.empty());
          }
          change(_productsCartList, status: RxStatus.success());

        }
        else{
          Get.snackbar("Thông báo", result.msg.toString(),
              backgroundColor: Colors.black.withOpacity(0.3));
          change(_productsCartList, status: RxStatus.error());
        }
      }
    } catch(error) {
      Get.snackbar("Thông báo", "error:: $error",
          backgroundColor: Colors.black.withOpacity(0.3));
      change(_productsCartList, status: RxStatus.error());
    }
  }

  Future<void> updateAPI(ProductCart productCart) async {
    final token = await getToken();

    if(productCart.cartId == null){
      try{
        final result = await AccountRepo().getCartId(
          options: Options(
            headers: {

            }
          )
        );
        if(result.isSuccess){
          productCart.cartId = result.objects;
          updateAPI(productCart);
        }
      }catch(error){
        Get.snackbar("Thông báo", "error:: $error",
            backgroundColor: Colors.black.withOpacity(0.3));
      }
    }
    else{
      try{
        final result = await AccountRepo().addProductCart(
            options: Options(
                headers: {

                }
            )
        );
        if(result != null){
          if(result.isSuccess){

          }else{
            Get.snackbar("Thông báo", result.msg.toString(),
                backgroundColor: Colors.black.withOpacity(0.3));
          }
        }


      }
      catch(error){
        Get.snackbar("Thông báo", "error:: $error",
            backgroundColor: Colors.black.withOpacity(0.3));
      }
    }
  }

  void getCartDB() async {
    print("<GET PRODUCT DB>");
    isLoading = true;
    isLoadingComplete = true;
    DatabaseHelper.instance.getAlls(DBConfig.TABLE_CART, DBConfig.CART_COLUMN_P_ID).then((value) {
      productCartList.clear();
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
    cartsByStore.clear();
    DatabaseHelper.instance.clear(DBConfig.TABLE_CART);
    countCart.value =0;
    calsumCart();
    update();
  }
}