import 'package:app_casynet/app/config/api_params.dart';
import 'package:get/get.dart';
import '../../../config/config_db.dart';
import '../../../data/model/sales.dart';
import '../../../data/provider/db_provider.dart';
import '../../../data/repo/home_repo.dart';

class TopSaleController extends GetxController{
  final topSaleList = <Sales>[].obs;
  final isLoadingAPI = false.obs;
  final isLoadingDB = false.obs;
  final error = ''.obs;

  @override
  void onInit() {
    _getTopSaleDB();
  }

  void _getTopSaleDB() {
    isLoadingDB.value = true;
    print('<Load Category> Load DB');
    DatabaseHelper.instance.getAlls(DBConfig.TABLE_SALE, DBConfig.SALE_COLUMN_ID).then((value) {
      if(value?.length == 0){
        getTopSaleAPI();
      }else{
        value?.forEach((element) {
          topSaleList.add(Sales(
              id: element[DBConfig.SALE_COLUMN_ID],
              title: element[DBConfig.SALE_COLUMN_TITLE],
              image: element[DBConfig.SALE_COLUMN_IMAGE]
          )
        );
        });
      }
    });
    isLoadingDB.value = false;
  }

  Future<void> getTopSaleAPI() async {
   isLoadingAPI.value = true;
    try {
      final result = await HomePageRepo().getSales();
      if (result.statusCode == CODE_SUCCESS) {
        if (result.isSuccess) {
          topSaleList.value = result.listObjects ?? [];
          if(topSaleList.isEmpty){
            isLoadingAPI.value = false;
            return;
          }
          isLoadingAPI.value = false;
          DatabaseHelper.instance.clear(DBConfig.TABLE_SALE);
          for( var sale in  topSaleList){
            DatabaseHelper.instance.insert(DBConfig.TABLE_SALE,
                Sales(
                  id: sale.id,
                  title: sale.title,
                  image: sale.image
                ).toJson()
            );
          }
        } else {
          // Get.snackbar('noti'.tr, result.msg.toString(),
          //     backgroundColor: Colors.black.withOpacity(0.3));
          print(result.msg.toString());
          isLoadingAPI.value = false;
        }
      }
    } catch (e) {
      // Get.snackbar('noti'.tr, "error:: $e",
      //     backgroundColor: Colors.black.withOpacity(0.3));
      print(e);
      isLoadingAPI.value = false;
    }
  }
}