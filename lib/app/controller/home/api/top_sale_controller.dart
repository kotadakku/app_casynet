import 'package:get/get.dart';
import '../../../config/config_db.dart';
import '../../../data/model/sales.dart';
import '../../../data/provider/db_provider.dart';
import '../../../data/repo/home_repo.dart';

class TopSaleController extends GetxController with StateMixin {
  final _topSaleList = <Sales>[].obs;

  @override
  void onInit() {
    _getTopSaleDB();
  }

  void _getTopSaleDB() {
    change(_topSaleList, status: RxStatus.loading());
    print('<Load Category> Load DB');
    DatabaseHelper.instance.getAlls(DBConfig.TABLE_SALE, DBConfig.SALE_COLUMN_ID).then((value) {
      if(value?.length == 0){
        getTopSaleAPI();
      }else{
        value?.forEach((element) {
          _topSaleList.add(Sales(
              id: element[DBConfig.SALE_COLUMN_ID],
              title: element[DBConfig.SALE_COLUMN_TITLE],
              image: element[DBConfig.SALE_COLUMN_IMAGE]
          )
        );
        });
      }
    });
    change(_topSaleList, status: RxStatus.success());
  }

  Future<void> getTopSaleAPI() async {
    change(_topSaleList, status: RxStatus.loading());
    try {
      final result = await HomePageRepo().getSales();
      if (result != null) {
        if (result.isSuccess) {
          _topSaleList.value = result.listObjects ?? [];
          if(_topSaleList.isEmpty){
            change(_topSaleList, status: RxStatus.empty());
            return;
          }
          change(_topSaleList, status: RxStatus.success());
          DatabaseHelper.instance.clear(DBConfig.TABLE_SALE);
          for( var sale in  _topSaleList){
            DatabaseHelper.instance.insert(DBConfig.TABLE_SALE,
                Sales(
                  id: sale.id,
                  title: sale.title,
                  image: sale.image
                ).toJson()
            );
          }
        } else {
          // Get.snackbar("Thông báo", result.msg.toString(),
          //     backgroundColor: Colors.black.withOpacity(0.3));
          print(result.msg.toString());
          change(_topSaleList, status: RxStatus.error());
        }
      }
    } catch (e) {
      // Get.snackbar("Thông báo", "error:: $e",
      //     backgroundColor: Colors.black.withOpacity(0.3));
      print(e);
      change(_topSaleList, status: RxStatus.error());
    }
  }
}