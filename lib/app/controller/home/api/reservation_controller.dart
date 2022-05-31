
import 'package:app_casynet/app/data/model/seller.dart';
import 'package:app_casynet/app/data/provider/db_provider.dart';
import 'package:dio/dio.dart';
import 'package:get/get.dart';

import '../../../config/config_db.dart';
import '../../../data/model/product.dart';
import '../../../data/provider/get_storage_provider.dart';
import '../../../data/repo/home_repo.dart';


class ReservationController extends GetxController{
  final reservationProductList = <Product>[].obs;
  final isLoadingAPI = false.obs;
  final isLoadingDB = false.obs;
  final error = "".obs;

  @override
  void onInit() {
    _getReservationProductsDB();
    getReservationProductsAPI();
  }

  Future<void> getReservationProductsAPI({int minPrice=0, int maxPrice=9999999999}) async {
    final token_admin = await GetStorageProvider().get(key: CacheManagerKey.TOKEN_ADMIN.toString());
    isLoadingAPI.value = true;
    error.value = "";
    try {
      final result = await HomePageRepo().getProducts(
          options: Options(
              headers: {'Authorization': 'Bearer $token_admin'}
          ),
          queryParameters: {
            'searchCriteria[pageSize]': '12',
            'searchCriteria[currentPage]': '1',
            'searchCriteria[sortOrders][0][direction]': 'DESC',
            'searchCriteria[filterGroups][0][filters][0][field]': 'category_id',
            'searchCriteria[filterGroups][0][filters][0][value]': '31',
            'searchCriteria[filter_groups][1][filters][0][field]': 'price',
            'searchCriteria[filter_groups][1][filters][0][value]': '$minPrice',
            'searchCriteria[filter_groups][1][filters][0][condition_type]': 'gteq',
            'searchCriteria[filter_groups][2][filters][0][field]': 'price',
            'searchCriteria[filter_groups][2][filters][0][value]': '$maxPrice',
            'searchCriteria[filter_groups][2][filters][0][condition_type]': 'lteq',
          }
      );
      if (result != null) {
        if (result.isSuccess) {
          reservationProductList.value = result.listObjects ?? [];
          isLoadingAPI.value = false;
          if(reservationProductList.length<=0){
            error.value = "Không có cửa hàng nào để hiển thị";
            return;
          }
          DatabaseHelper.instance.deleteFilter(
            DBConfig.TABLE_PRODUCT,
            DBConfig.PRODUCT_CATEGORY_ID,
            '31',
          );
          for( var product in  reservationProductList){
            DatabaseHelper.instance.insert(DBConfig.TABLE_PRODUCT,
                product.toJsonDB(31)
            );
          }
        } else {
          // Get.snackbar("Thông báo", result.msg.toString(),
          //     backgroundColor: Colors.black.withOpacity(0.3));
          isLoadingAPI.value = false;
          error.value = "${result.msg.toString()}";
          print(result.msg.toString());
        }
      }
    } catch (e) {
      // Get.snackbar("Thông báo", "error:: $e",
      //     backgroundColor: Colors.black.withOpacity(0.3));
      print(e);
      error.value = "Hệ thống đang có vấn đề!!";
      isLoadingAPI.value = false;
    }

  }

  void _getReservationProductsDB() {
    isLoadingDB.value = true;
    DatabaseHelper.instance.filter(DBConfig.TABLE_PRODUCT, DBConfig.PRODUCT_CATEGORY_ID, '31').then((value){
      
      if(value?.length ==0){
        isLoadingDB.value = false;
        getReservationProductsAPI();
      }
      else{
        print('<Load SELLER> Load DB');
        value?.forEach((element) {
          reservationProductList.add(
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