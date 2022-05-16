
import 'package:get/get.dart';

import '../../../data/model/product.dart';
import '../../../data/repo/home_repo.dart';


class ReservationController extends GetxController with StateMixin{
  final _reservationProductList = <Product>[].obs;

  @override
  void onInit() {
    getReservationProductsAPI();
  }

  Future<void> getReservationProductsAPI() async {
    change(_reservationProductList, status: RxStatus.loading());
    try {
      final result = await HomePageRepo().getProducts();
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