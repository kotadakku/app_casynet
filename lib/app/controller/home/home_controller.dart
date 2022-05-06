
import 'package:app_casynet/app/controller/home/fetch_banner_controller.dart';
import 'package:app_casynet/app/controller/home/fetch_topsales_controller.dart';
import 'package:get/get.dart';

class HomeController extends GetxController{
  FetchTopSalesController _fetchTopSalesController = Get.put(FetchTopSalesController());
  FetchBannerController _fetchBannerController = Get.put(FetchBannerController());
  late String search_text = "";
  late bool _isVN = true;

  void onChangeSearchText( value){
    search_text = value;
    print(search_text);
  }

  bool get isVN => _isVN;

  void setIsVN() {
    _isVN = !isVN;
    update();
  }


  @override
  void onInit() {
  }


  @override
  void onReady() async  {
    _fetchTopSalesController.getSalesAPI();
    _fetchBannerController.getBannerAPI();
  }

  String languageToString() {
    if(_isVN) return 'VN';
    return 'EN';
  }

  void refreshAPI(){

  }
}
