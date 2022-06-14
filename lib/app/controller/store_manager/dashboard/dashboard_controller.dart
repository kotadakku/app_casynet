import 'package:app_casynet/app/config/api_params.dart';
import 'package:app_casynet/app/data/data.dart';
import 'package:get/get.dart';

import '../../../../data.dart';

class DashboardController extends GetxController{
  var heightdon = 540.obs;
  var tinh = 0.obs;
  var ss = "".obs;
  int sopt=10;
  var sellerDashboard = Seller.fromDashboard(info_dashboard).obs;

  @override
  void onInit() {
    // getInfomationDashboard();
  }

  getInfomationDashboard() async {
    try {
      final result = await SellerRepo().getInfomationDashboard();
      if(result.statusCode == CODE_SUCCESS){
        sellerDashboard.value = Seller.fromDashboard(info_dashboard);
      }
    } catch (error){

    }
  }
}