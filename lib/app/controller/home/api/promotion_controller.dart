
import 'package:dio/dio.dart';
import 'package:get/get.dart';

import '../../../data/model/product.dart';
import '../../../data/provider/get_storage_provider.dart';
import '../../../data/repo/home_repo.dart';


class PromotionController extends GetxController with StateMixin{
  final _promotionProductList = <Product>[].obs;

  @override
  void onInit() {
    getPromotionProductsAPI();
  }

  Future<void> getPromotionProductsAPI() async {
    final token_admin = await GetStorageProvider().get(key: CacheManagerKey.TOKEN_ADMIN.toString());

    change(_promotionProductList, status: RxStatus.loading());
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
            'searchCriteria[filterGroups][0][filters][0][value]': '5'
          }
      );
      if (result != null) {
        if (result.isSuccess) {
          _promotionProductList.value = result.listObjects ?? [];
          if(_promotionProductList.isEmpty){
            change(_promotionProductList, status: RxStatus.empty());
            return;
          }
          change(_promotionProductList, status: RxStatus.success());

        } else {
          // Get.snackbar("Thông báo", result.msg.toString(),
          //     backgroundColor: Colors.black.withOpacity(0.3));
          print(result.msg.toString());
          change(_promotionProductList, status: RxStatus.empty());
        }
      }
    } catch (e) {
      // Get.snackbar("Thông báo", "error:: $e",
      //     backgroundColor: Colors.black.withOpacity(0.3));
      print(e);
      change(_promotionProductList, status: RxStatus.empty());
    }

  }
}