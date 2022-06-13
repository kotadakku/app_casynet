
import 'package:dio/dio.dart';
import 'package:get/get.dart';

import '../../../config/config_db.dart';
import '../../../data/model/product.dart';
import '../../../data/model/seller.dart';
import '../../../data/provider/db_provider.dart';
import '../../../data/provider/get_storage_provider.dart';
import '../../../data/repo/home_repo.dart';
import '../../../data/repo/product_repo.dart';


class RecommendController extends GetxController{
  final recommendProductList = <Product>[].obs;
  final isLoadingAPI = false.obs;
  final isLoadingDB = false.obs;
  final error = "".obs;

  @override
  void onInit() {
    _getRecommendProductsDB();
    getRecommendProductsAPI();
  }

  Future<void> getRecommendProductsAPI() async {
    final token_admin = await GetStorageProvider().get(key: CacheManagerKey.TOKEN_ADMIN.toString());
    isLoadingAPI.value = true;
    error.value = '';
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
            'searchCriteria[filterGroups][0][filters][0][value]': '32'
          }
      );
      if (result != null) {
        if (result.isSuccess) {
          recommendProductList.value = result.listObjects ?? [];
          isLoadingAPI.value = false;
          if(recommendProductList.isEmpty){
            error.value = "Không có cửa hàng nào để hiển thị";
            return;
          }
          DatabaseHelper.instance.deleteFilter(
            DBConfig.TABLE_PRODUCT,
            DBConfig.PRODUCT_CATEGORY_ID,
            '32',
          );
          for( var product in  recommendProductList){
            DatabaseHelper.instance.insert(DBConfig.TABLE_PRODUCT,
                product.toJsonDB(32)
            );
          }

        } else {
          // Get.snackbar('noti'.tr, result.msg.toString(),
          //     backgroundColor: Colors.black.withOpacity(0.3));
          print(result.msg.toString());
          isLoadingAPI.value = false;
          error.value = "${result.msg.toString()}";
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

  void _getRecommendProductsDB() {
    isLoadingDB.value = true;
    DatabaseHelper.instance.filter(DBConfig.TABLE_PRODUCT, DBConfig.PRODUCT_CATEGORY_ID, '32').then((value){

      if(value?.length ==0){
        isLoadingDB.value = false;
        getRecommendProductsAPI();
      }
      else{
        print('<Load SELLER> Load DB');
        value?.forEach((element) {
          recommendProductList.add(
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