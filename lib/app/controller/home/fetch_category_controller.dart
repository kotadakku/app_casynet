
import 'package:app_casynet/app/data/provider/category_home_provider.dart';
import 'package:get/get.dart';

import '../../data/model/category_home.dart';
import '../../data/provider/db/category_db_provider.dart';
import '../../utlis/base64.dart';

class CategoryHomeController extends GetxController{
  List<CategoryHome> categoryHomeList = [];
  var isLoading =true;
  var isLoadingComplete = true;

  @override
  void onInit() {
    _getCategoryDB();
  }


  void _getCategoryDB() {
    isLoading = true;
    print('<Load Category> Load DB');
    CategoryDatabaseHelper.instance.queryAllRows().then((value) {
      if(value?.length == 0){
        getCategoryAPI();
      }else{
        value?.forEach((element) {
          categoryHomeList.add(CategoryHome(
            iddanhmuc: element['iddanhmuc'],
            anhdanhmuc: element['anhdanhmuc'],
            tendanhmuc: element['tendanhmuc']
          ));
          isLoading = false;
          isLoadingComplete = false;
          update();
        });
      }
    });

  }

  Future<void> getCategoryAPI() async {
    isLoading = true;
    isLoadingComplete = true;
    print('<Load Category> Load DB');
    CategoryHomeProvider().fetchCategoryHomeList(onSuccess: (categories) async {
      categoryHomeList.clear();
      CategoryDatabaseHelper.instance.clear();

      for( var category in categories){
        var base64 = await ImageNetworkToBase64(url: category.anhdanhmuc.toString()).getHttp();
        CategoryDatabaseHelper.instance.insert(CategoryHome(anhdanhmuc: base64, tendanhmuc: category.tendanhmuc));
        categoryHomeList.add(CategoryHome(anhdanhmuc: base64, tendanhmuc: category.tendanhmuc));
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