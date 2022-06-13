
import 'package:dio/dio.dart';
import 'package:get/get.dart';

import '../../../config/config_db.dart';
import '../../../data/model/product.dart';
import '../../../data/model/seller.dart';
import '../../../data/provider/db_provider.dart';
import '../../../data/provider/get_storage_provider.dart';
import '../../../data/repo/home_repo.dart';
import '../../../data/repo/product_repo.dart';


class PromotionController extends GetxController{
  final promotionProductList = <Product>[].obs;
  final isLoadingAPI = false.obs;
  final isLoadingDB = false.obs;
  final error = "".obs;

  @override
  void onInit() {
    getPromotionProductsDB();
    getPromotionProductsAPI();
  }

  Future<void> getPromotionProductsAPI() async {
    final token_admin = await GetStorageProvider().get(key: CacheManagerKey.TOKEN_ADMIN.toString());
    isLoadingAPI.value = true;
    error.value = "";
    try {
      final result = await ProductRepo().getProducts(
          options: Options(
              headers: {'Authorization': 'Bearer $token_admin'}
          ),
          queryParameters: {
            'searchCriteria[pageSize]': '12',
            'searchCriteria[currentPage]': '1',
            'searchCriteria[sortOrders][0][direction]': 'DESC',
            'searchCriteria[filterGroups][0][filters][0][field]': 'category_id',
            'searchCriteria[filterGroups][0][filters][0][value]': '5'
          }
      );
      if (result != null) {
        if (result.isSuccess) {
          promotionProductList.value = result.listObjects ?? [];
          isLoadingAPI.value = false;
          if(promotionProductList.isEmpty){
            error.value = "Không có cửa hàng nào để hiển thị";
            return;
          }
          else{
            DatabaseHelper.instance.deleteFilter(
              DBConfig.TABLE_PRODUCT,
              DBConfig.PRODUCT_CATEGORY_ID,
              '5',
            );
            for( var product in  promotionProductList){
              DatabaseHelper.instance.insert(DBConfig.TABLE_PRODUCT,
                  product.toJsonDB(5)
              );
            }
          }

        } else {
          // Get.snackbar('noti'.tr, result.msg.toString(),
          //     backgroundColor: Colors.black.withOpacity(0.3));
          isLoadingAPI.value = false;
          error.value = "${result.msg.toString()}";
          print(result.msg.toString());
        }
      }
    } catch (e) {
      // Get.snackbar('noti'.tr, "error:: $e",
      //     backgroundColor: Colors.black.withOpacity(0.3));
      print(e);
      error.value = "Hệ thống đang có vấn đề!!";
      isLoadingAPI.value = false;
    }

  }

  void getPromotionProductsDB() {
    isLoadingDB.value = true;
    DatabaseHelper.instance.filter(DBConfig.TABLE_PRODUCT, DBConfig.PRODUCT_CATEGORY_ID, '5').then((value){

      if(value?.length ==0){
        isLoadingDB.value = false;
        getPromotionProductsAPI();
      }
      else{
        print('<Load SELLER> Load DB');
        value?.forEach((element) {
          promotionProductList.add(
              Product(
                  id: element[DBConfig.PRODUCT_ID],
                  name: element[DBConfig.PRODUCT_NAME],
                  thumbnail: element[DBConfig.PRODUCT_IMAGE],
                  price: element[DBConfig.PRODUCT_PRICE],
                  officialPrice: element[DBConfig.PRODUCT_OFF_PRICE],
                  likeQty: element[DBConfig.PRODUCT_LIKED],
                  commentQty: element[DBConfig.PRODUCT_COMMENT],
                  rate: element[DBConfig.PRODUCT_RATE],
                  catId: element[DBConfig.PRODUCT_CATEGORY_ID],
                  seller: Seller(
                    name: element[DBConfig.PRODUCT_SELLER_NAME],
                    phone: element[DBConfig.PRODUCT_SELLER_PHONE],
                  )
              )
          );

        });
        isLoadingDB.value = false;
      }
    });
  }
}