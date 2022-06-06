
import 'package:app_casynet/app/config/config_db.dart';
import 'package:app_casynet/app/data/model/product_cart.dart';
import 'package:app_casynet/app/data/repo/cart_repo.dart';
import "package:collection/collection.dart";
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../data/model/product.dart';
import '../../../data/provider/db_provider.dart';
import '../../../data/provider/get_storage_provider.dart';
import '../../../data/repo/account_repo.dart';
import '../../auth/authentication_manager.dart';

class ProductCartController extends GetxController with StateMixin {
  final _productsCartList = <ProductCart>[].obs;
  var cartsByStore = {}.obs;
  var sumPriceValue = 0.obs;
  var countCart = 0.obs;
  RxList checkBoxProduct = [].obs;

  @override
  void onInit() {
    getCartDB();
  }
  void deleteRow(int? id ) {
    Get.defaultDialog(
        title: 'noti'.tr,
        middleText: 'Bạn chắc chắn xóa sản phẩm này!',
        textCancel: "Bỏ",
        textConfirm: 'yes'.tr,
        confirmTextColor: Colors.white,
        onConfirm: () async {
          Get.back();
          await deleteItemCartAPI(id);
          DatabaseHelper.instance.deleteRow(DBConfig.TABLE_CART, DBConfig.CART_COLUMN_P_ID, id);
          getCartDB();
        },
        onCancel: (){
          Get.back();
        }
    );
  }

  void incrementProductCartDB(Product product)  {
    AuthenticationManager _autheticationManager = Get.find();
    ProductCart productCart = ProductCart(
        p_id: product.id,
        p_sku: product.sku,
        p_name: product.name,
        s_name: "Babaas",
        discount_price: product.price,
        p_image: product.thumbnail,
        quantity: 1,
        price: product.officialPrice,
        cartId: 6227);

    DatabaseHelper.instance.checkExists(DBConfig.TABLE_CART, DBConfig.CART_COLUMN_P_ID, productCart.p_id ).then((value){
      print("<DB> row exist $value");
      if(value){
        DatabaseHelper.instance.incrementQuantity(DBConfig.TABLE_CART,
            DBConfig.CART_COLUMN_P_ID,
            DBConfig.CART_COLUMN_QUANTITY,
            productCart.p_id,).then((value){
          if(_autheticationManager.isLogged== true)
            addItemCartAPI(productCart, 1);
          getCartDB();
        });
      }
      else{
        print("DB Insert to Cart");
        DatabaseHelper.instance.insert(DBConfig.TABLE_CART, productCart.toJson()).then((value){
          if(_autheticationManager.isLogged== true)
            addItemCartAPI(productCart, 1);
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
          // Get.snackbar('noti'.tr, result.msg.toString(),
          //     backgroundColor: Colors.black.withOpacity(0.3));
          change(cartsByStore, status: RxStatus.error());
        }
      }
    } catch(error) {
      // Get.snackbar('noti'.tr, "error:: $error",
      //     backgroundColor: Colors.black.withOpacity(0.3));
      change(cartsByStore, status: RxStatus.error());
    }
  }

  Future<void> addItemCartAPI(ProductCart productCart, int qty) async {
    final token = await GetStorageProvider().get(key: CacheManagerKey.TOKEN.toString());

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
          addItemCartAPI(productCart, qty);
          return ;
        }
      }catch(error){
        Get.snackbar('noti'.tr, "error:: $error",
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
            Get.snackbar('noti'.tr, result.msg.toString(),
                backgroundColor: Colors.black.withOpacity(0.3));
          }
        }


      }
      catch(error){
        // Get.snackbar('noti'.tr, "error:: $error",
        //     backgroundColor: Colors.black.withOpacity(0.3));
        print('<ADD ITEM CART> $error');
      }
    }
  }

  Future<void> updateItemCartAPI(ProductCart productCart) async {
    int? item_id = productCart.item_id;
    final token = await GetStorageProvider().get(key: CacheManagerKey.TOKEN.toString());
    if(item_id!= null){
      try{
        final result = await CartRepo().updateItemCart(
            item_id: item_id,
          options: Options(
              headers: {
                'Authorization':'Bearer $token'
              }
          )
        );
        if(result.isSuccess){

        }
      } catch(error){
        print('<UPDATE ITEM CART> $error');
      }
    }
  }
  Future<bool> deleteItemCartAPI(int? id) async {
    final token = await GetStorageProvider().get(key: CacheManagerKey.TOKEN.toString());
    if(id != null){
      try{
        final result = await CartRepo().deleteItemCart(item_id: id,
          options: Options(
            headers: {
              'Authorization':'Bearer $token'
            }
          )
        );
        if(result.isSuccess){
          return true;
        }
        return false;
      } catch(error) {
        print('<DELETE ITEM CART> $error');
      }
    }
    return false;
  }

  void getCartDB() async {
    print("<GET PRODUCT DB>");
    change(cartsByStore, status: RxStatus.loading());
    DatabaseHelper.instance.getAlls(DBConfig.TABLE_CART, DBConfig.CART_COLUMN_P_ID).then((value) {
      _productsCartList.clear();
      value?.forEach((element) {
        _productsCartList.add(ProductCart(
          p_id: element[DBConfig.CART_COLUMN_P_ID],
          item_id: element[DBConfig.CART_COLUMN_ITEM_ID],
          p_sku: element[DBConfig.CART_COLUMN_P_SKU],
          p_name: element[DBConfig.CART_COLUMN_P_NAME],
          p_image: element[DBConfig.CART_COLUMN_P_IMAGE],
          price: element[DBConfig.CART_COLUMN_PRICE],
          discount_price: element[DBConfig.CART_COLUMN_DIS_PRICE],
          quantity: element[DBConfig.CART_COLUMN_QUANTITY],
          s_name: element[DBConfig.CART_COLUMN_S_NAME],
          cartId: element[DBConfig.CART_COLUMN_CART_ID],
        ));
      });
      cartsByStore.value = groupBy(_productsCartList, (ProductCart obj) => obj.s_name);
      calsumPrice();
      change(cartsByStore, status: RxStatus.success());
    });
    change(cartsByStore, status: RxStatus.success());
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