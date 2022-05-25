
import 'package:dio/dio.dart';
import 'package:get/get.dart';

import '../../../data/model/product.dart';
import '../../../data/provider/get_storage_provider.dart';
import '../../../data/repo/home_repo.dart';


class ReservationController extends GetxController with StateMixin{
  final _reservationProductList = <Product>[].obs;

  @override
  void onInit() {
    getReservationProductsAPI();
  }

  Future<void> getReservationProductsAPI({int minPrice=0, int maxPrice=9999999999, }) async {
    final token_admin = await GetStorageProvider().get(key: CacheManagerKey.TOKEN_ADMIN.toString());
    change(_reservationProductList, status: RxStatus.loading());
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
          _reservationProductList.value = result.listObjects ?? [];
          if(_reservationProductList.isEmpty){
            change(_reservationProductList, status: RxStatus.empty());
            return;
          }
          change(_reservationProductList, status: RxStatus.success());

        } else {
          // Get.snackbar("Thông báo", result.msg.toString(),
          //     backgroundColor: Colors.black.withOpacity(0.3));
          print(result.msg.toString());
          change(_reservationProductList, status: RxStatus.error());
        }
      }
    } catch (e) {
      // Get.snackbar("Thông báo", "error:: $e",
      //     backgroundColor: Colors.black.withOpacity(0.3));
      print(e);
      change(_reservationProductList, status: RxStatus.error());
    }

  }
}