
import 'package:app_casynet/app/config/config_db.dart';
import 'package:app_casynet/app/data/model/seller.dart';
import 'package:app_casynet/app/data/provider/db_provider.dart';
import 'package:get/get.dart';

import '../../../data/repo/seller_repo.dart';
import '../../filter/filter_map_controller.dart';
import '../../filter/map_controller.dart';


class SellerController extends GetxController{

  MapController mapController = Get.put(MapController());
  final sellerList = <Seller>[].obs;
  // final ScaffoldMessengerState scaffoldMessenger = Get.find<ScaffoldMessengerState>();
  final isLoadingAPI = false.obs;
  final isLoadingDB = false.obs;

  late int pageNumber =1;
  late int pageSizeNumber =12;
  final error = "".obs;

  @override
  void onInit() {
    _getSellerDB();
    getSellersAPI(pageSize: 12,curPage: 1, type_filter: 'null');
  }


  Future<void> getSellersAPI({required int pageSize, required int curPage,String type_filter = 'null'}) async {
    isLoadingAPI.value = true;
    error.value = "";
    try {
      final result = await SellerRepo().getSellers(
        queryParameters: {
          'lat': mapController.currentLocation.latitude,   /*21.0012507,*/  // lat user
          'lng': mapController.currentLocation.longitude,  /*105.7938183,*/ // long user
          'pageSize': pageSize,
          'curPage': curPage,
          'type_filter': type_filter
        }
      );
      if (result != null) {
        if (result.isSuccess) {
          sellerList.value = result.listObjects ?? [];
          isLoadingAPI.value = false;
          if(sellerList.length <=0){
            error.value = "Không có cửa hàng nào để hiển thị";
            return;
          }

          DatabaseHelper.instance.clear(DBConfig.TABLE_SELLER);
          for( var seller in  sellerList){
            DatabaseHelper.instance.insert(DBConfig.TABLE_SELLER,
             seller.toJsonDB()
            );
          }

        } else {
          // Get.snackbar('noti'.tr, result.msg.toString(),
          //     backgroundColor: Colors.black.withOpacity(0.3));
          print(result.msg.toString());
          error.value = "${result.msg.toString()}";
          isLoadingAPI.value = false;
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

  void _getSellerDB() {
    
    isLoadingDB.value = true;
    DatabaseHelper.instance.getAlls(DBConfig.TABLE_SELLER, DBConfig.SELLER_ID).then((value){
      if(value?.length ==0){
        isLoadingDB.value = false;
        getSellersAPI(pageSize: 12,curPage: 1, type_filter: 'null');
      }
      else{
        print('<Load SELLER> Load DB');
        value?.forEach((element) {
          sellerList.add(
            Seller(
              id: element[DBConfig.SELLER_ID],
              name: element[DBConfig.SELLER_NAME],
              phone: element[DBConfig.SELLER_PHONE],
              avatar_image: element[DBConfig.SELLER_IMAGE],
              address: element[DBConfig.SELLER_ADDRESS],
              likeQty: element[DBConfig.SELLER_LIKED],
              commentQty: element[DBConfig.SELLER_COMMENT],
              rate: element[DBConfig.SELLER_RATE],
            )
          );

        });
        isLoadingDB.value = false;
      }
    });
  }
}