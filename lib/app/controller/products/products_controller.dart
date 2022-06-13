import 'package:dio/dio.dart';
import 'package:get/get.dart';

import '../../data/model/product.dart';
import '../../data/provider/get_storage_provider.dart';
import '../../data/repo/home_repo.dart';
import '../../data/repo/product_repo.dart';

class ProductsController extends GetxController{
  final productList = <Product>[].obs;
  late String category_name;
  late int category_id;
  var isCar = true.obs;
  final isLoading = false.obs;
  final haveNextPage = true.obs;
  int page = 1;
  final error = ''.obs;
  @override
  void onInit() {
    getParameters();

  }
  Future<void> getProductsAPI({bool first_load = true, int pageSize = 12, int currentPage = 1, int minPrice=0, int maxPrice=9999999999}) async {
    final tokenAdmin = await GetStorageProvider().get(key: CacheManagerKey.TOKEN_ADMIN.toString());
    if(first_load) isLoading.value = true;
    try {
      final result = await ProductRepo().getProducts(
          options: Options(
              headers: {'Authorization': 'Bearer $tokenAdmin'}
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
            isLoading.value = false;
            haveNextPage.value = false;
          }
          if(productList.isEmpty){
            isLoading.value = false;
            return;
          }
          isLoading.value = false;

        } else {
          print(result.msg.toString());
          error.value = result.msg.toString();
          isLoading.value = false;
        }
      }
    } catch (e) {
      print(e);
      error.value = 'Hệ thống đang gặp vấn đề';
      isLoading.value = false;
    }

  }

  void loadMoreProducts() async {
    if(!isLoading.value && haveNextPage.value){
      isLoading.value = true;
      page +=1;
      await getProductsAPI(first_load: false, currentPage: page);
      isLoading.value = false;
    }
  }

  void getParameters(){
    category_name = Get.arguments[0].toString();
    category_id = Get.arguments[1] ?? 1;
    if(Get.arguments[2]!= null){
      isLoading.value = true;
      productList.addAll(Get.arguments[2]);
      isLoading.value = false;
    }
    else{
      getProductsAPI(first_load: true, currentPage: page);
    }

  }
}
