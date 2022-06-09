import 'package:dio/dio.dart';
import 'package:get/get.dart';

import '../../data/model/product.dart';
import '../../data/provider/get_storage_provider.dart';
import '../../data/repo/home_repo.dart';

class ProductsController extends GetxController with StateMixin{
  final productList = <Product>[].obs;
  late String category_name;
  late int category_id;
  var isCar = true.obs;
  final isLoading = false.obs;
  final haveNextPage = true.obs;
  int page = 1;
  @override
  void onInit() {
    getParameters();

  }
  Future<void> getProductsAPI({bool first_load = true, int pageSize = 12, int currentPage = 1, int minPrice=0, int maxPrice=9999999999, required int category_id}) async {
    final token_admin = await GetStorageProvider().get(key: CacheManagerKey.TOKEN_ADMIN.toString());
    if(first_load) change(productList, status: RxStatus.loading());
    try {
      final result = await HomePageRepo().getProducts(
          options: Options(
              headers: {'Authorization': 'Bearer $token_admin'}
          ),
          queryParameters: {

            'searchCriteria[filter_groups][0][filters][0][field]': 'price',
            'searchCriteria[filter_groups][0][filters][0][value]': '$minPrice',
            'searchCriteria[filter_groups][0][filters][0][condition_type]': 'gteq',
            'searchCriteria[filter_groups][1][filters][0][field]': 'price',
            'searchCriteria[filter_groups][1][filters][0][value]': '$maxPrice',
            'searchCriteria[filter_groups][1][filters][0][condition_type]': 'lteq',
            'searchCriteria[filterGroups][2][filters][0][field]': 'category_id',
            'searchCriteria[filterGroups][2][filters][0][value]': '$category_id',
            'searchCriteria[pageSize]': '$pageSize',
            'searchCriteria[currentPage]': '$currentPage',
            'searchCriteria[sortOrders][0][direction]': 'DESC',
          }
      );
      if (result != null) {
        if (result.isSuccess) {
          first_load ?
          productList.value = result.listObjects ?? []
              :productList.addAll(result.listObjects ?? []);
          if(result.listObjects!.length < pageSize){
            haveNextPage.value = false;
          }
          if(productList.isEmpty){
            change(productList, status: RxStatus.empty());
            return;
          }
          change(productList, status: RxStatus.success());

        } else {
          // Get.snackbar('noti'.tr, result.msg.toString(),
          //     backgroundColor: Colors.black.withOpacity(0.3));
          print(result.msg.toString());
          change(productList, status: RxStatus.error());
        }
      }
    } catch (e) {
      // Get.snackbar('noti'.tr, "error:: $e",
      //     backgroundColor: Colors.black.withOpacity(0.3));
      print(e);
      change(productList, status: RxStatus.error());
    }

  }

  void loadMoreProducts() async {
    if(!isLoading.value && haveNextPage.value){
      isLoading.value = true;
      page +=1;
      await getProductsAPI(first_load: false, category_id: category_id, currentPage: page);
      isLoading.value = false;
    }
  }

  void getParameters(){
    category_name = Get.arguments[0].toString();
    category_id = Get.arguments[1];
    if(Get.arguments[2]!= null){
      change(productList, status: RxStatus.loading());
      productList.addAll(Get.arguments[2]);
      change(productList, status: RxStatus.success());
    }
    else{
      getProductsAPI(first_load: true, category_id: category_id, currentPage: page);
    }

  }
}