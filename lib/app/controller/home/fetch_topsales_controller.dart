import 'package:get/get.dart';

import '../../data/model/sales.dart';
import '../../data/provider/db/sales_db_provider.dart';
import '../../data/provider/sales_api_provider.dart';
import '../../utlis/base64.dart';

class FetchTopSalesController extends GetxController{
  var isLoading = true;
  var isLoadingComplete = false;
  List<Sales> listSales = [];


  @override
  void onInit() {

    _getTopSaleBD();
  }


  @override
  void onReady(){
    super.onReady();
  }



  void _getTopSaleBD(){
    isLoading = true;
    isLoadingComplete = true;
    TopSaleDatabaseHelper.instance.queryAllRows().then((value) {
      if(value?.length == 0){
        getSalesAPI();
      }else{
        value?.forEach((element) {
          listSales.add(Sales(
              id: element['id'],
              title: element['title'],
              image: element['image']
          ));
          isLoading = false;
          isLoadingComplete = false;
          update();
        });
      }
    });
  }
  Future<void> getSalesAPI() async {
    isLoading = true;
    isLoadingComplete = true;
    SalesProvider().getSales(onSuccess: (sales) async {
      listSales.clear();
      TopSaleDatabaseHelper.instance.clear();

      for( var sale in sales){
        var base64 = await ImageNetworkToBase64(url: sale.image).getHttp();
        TopSaleDatabaseHelper.instance.insert(Sales(image: base64, title: sale.title));
        listSales.add(Sales(image: base64, title: sale.title));
        isLoading = false;
        update();

      }
      isLoadingComplete = false;
      update();
    },
        beforeSend: (){},
        onError: (error){
          print("Error " + error.toString());
          isLoading = false;
          isLoadingComplete = false;
          update();
        }
    );
  }

}