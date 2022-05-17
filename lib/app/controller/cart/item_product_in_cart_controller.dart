
import 'package:app_casynet/app/data/model/product_cart.dart';
import 'package:app_casynet/app/config/config_db.dart';
import "package:collection/collection.dart";
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../data/provider/db/db_provider.dart';
import '../../data/repo/account_repo.dart';
import '../auth/authentication_manager.dart';
import '../auth/cache_manager.dart';

class ProductCartController extends GetxController with CacheManager, StateMixin {
  final _productsCartList = <ProductCart>[].obs;
  var cartsByStore = {}.obs;
  var isLoading = true;
  var isLoadingComplete = true;
  var sumPriceValue = 0.obs;
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

  void incrementProductCartDB(ProductCart productCart)  {
    AuthenticationManager _autheticationManager = Get.find();
    DatabaseHelper.instance.checkExists(DBConfig.TABLE_CART, DBConfig.CART_COLUMN_P_ID, productCart.p_id ).then((value){
      print("<DB> row exist $value");
      if(value){
        DatabaseHelper.instance.incrementQuantity(DBConfig.TABLE_CART,
            DBConfig.CART_COLUMN_P_ID,
            DBConfig.CART_COLUMN_QUANTITY,
            productCart.p_id,).then((value){
          if(_autheticationManager.isLogged== true) updateCartAPI(productCart, 1);
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
  void decrementProductCartDB(ProductCart productCart)  {
    DatabaseHelper.instance.decrementQuantity(DBConfig.TABLE_CART,
      DBConfig.CART_COLUMN_P_ID,
      DBConfig.CART_COLUMN_QUANTITY,
      productCart.p_id,).then((value){
      getCartDB();
    });
  }

  Future<void> updateQuantity(int qty, ProductCart productCart) async {
    int? id = productCart.p_id;

    if(id !=null){
      DatabaseHelper.instance.updateQuantity(DBConfig.TABLE_CART,
        DBConfig.CART_COLUMN_P_ID,
        DBConfig.CART_COLUMN_QUANTITY,
        id, qty);
      _productsCartList.where((element) => element.p_id == id).first.quantity = qty;
    }
  }
  Future<void> getCartAPI(String token) async {
    print("<GET PRODUCT API>");
    change(cartsByStore, status: RxStatus.loading());
    try{
      final result = await AccountRepo().getProductsCart(
        options: Options(
          headers: {
            'Authorization' : 'Bearer $token'
          }
        )
      );
      if(result != null){
        if(result.isSuccess){
          _productsCartList.value = result.listObjects ?? [];
          if(cartsByStore.isEmpty){
            change(cartsByStore, status: RxStatus.empty());
          }
          _productsCartList.forEach((element) {
            saveProductCartDB(element);
          });
          getCartDB();
          cartsByStore.value = groupBy(_productsCartList, (ProductCart obj) => obj.s_name);
          calsumPrice();
          change(cartsByStore, status: RxStatus.success());

        }
        else{
          Get.snackbar("Thông báo", result.msg.toString(),
              backgroundColor: Colors.black.withOpacity(0.3));
          change(cartsByStore, status: RxStatus.error());
        }
      }
    } catch(error) {
      Get.snackbar("Thông báo", "error:: $error",
          backgroundColor: Colors.black.withOpacity(0.3));
      change(cartsByStore, status: RxStatus.error());
    }
  }
  void saveProductCartDB(ProductCart productCart)  {
    DatabaseHelper.instance.checkExists(DBConfig.TABLE_CART, DBConfig.CART_COLUMN_P_ID, productCart.p_id ).then((value){
      print("<DB> row exist $value");
      if(value){
        DatabaseHelper.instance.incrementQuantity(DBConfig.TABLE_CART,
          DBConfig.CART_COLUMN_P_ID,
          DBConfig.CART_COLUMN_QUANTITY,
          productCart.p_id,).then((value){
        });
        getCartDB();
      }
      else{
        print("DB Insert to Cart");
        DatabaseHelper.instance.insert(DBConfig.TABLE_CART, productCart.toJson()).then((value){
         getCartDB();
        });
      }
    });
  }
  Future<void> updateCartAPI(ProductCart productCart, int qty) async {
    final token = await getToken();

    if(productCart.cartId == null){
      try{
        final result = await AccountRepo().getCartId(
          options: Options(
              headers: {
                'Authorization' : 'Bearer $token'
              }
          )
        );
        if(result.isSuccess){
          productCart.cartId = result.objects;
          updateCartAPI(productCart, qty);
          return ;
        }
      }catch(error){
        Get.snackbar("Thông báo", "error:: $error",
            backgroundColor: Colors.black.withOpacity(0.3));
      }
    }
    else{
      try{
        final result = await AccountRepo().addProductCart(
          data: productCart.toJsonPost(qty),
            options: Options(
              headers: {
                'Authorization' : 'Bearer $token'
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
    change(cartsByStore, status: RxStatus.loading());
    DatabaseHelper.instance.getAlls(DBConfig.TABLE_CART, DBConfig.CART_COLUMN_P_ID).then((value) {
      _productsCartList.clear();
      value?.forEach((element) {
        _productsCartList.add(ProductCart(
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
      });
      cartsByStore.value = groupBy(_productsCartList, (ProductCart obj) => obj.s_name);
      calsumPrice();
      change(cartsByStore, status: RxStatus.success());
    });
  }
  void calsumPrice(){
    if(cartsByStore !=null){
      sumPriceValue.value =0;
      countCart.value = 0;
      cartsByStore.entries.forEach((e){
        (e.value as List).forEach((cart){
          countCart += int.parse(cart.quantity.toString());
          if(checkBoxProduct.contains(cart.p_id)){
            sumPriceValue += int.parse(cart.quantity.toString()) * int.parse(cart.price.toString());
          }
        }
        );
      });
    }
  }
  void clearCart(){
    _productsCartList.clear();
    cartsByStore.clear();
    DatabaseHelper.instance.clear(DBConfig.TABLE_CART);
    calsumPrice();
    update();
  }
}