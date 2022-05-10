
import 'package:app_casynet/app/data/provider/category_home_provider.dart';
import 'package:app_casynet/app/data/provider/db/config_db.dart';
import 'package:get/get.dart';
import '../../data/model/category_home.dart';
import '../../data/provider/db/db_provider.dart';
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
    DatabaseHelper.instance.getAlls(DBConfig.TABLE_CATEGORY, DBConfig.COLUMN_CATEGORY_ID).then((value) {
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
      DatabaseHelper.instance.clear(DBConfig.TABLE_CATEGORY);

      for( var category in categories){
        var base64 = await ImageNetworkToBase64(url: category.anhdanhmuc.toString()).getHttp();
        DatabaseHelper.instance.insert(DBConfig.TABLE_CATEGORY, CategoryHome(anhdanhmuc: base64, tendanhmuc: category.tendanhmuc).toJson());
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