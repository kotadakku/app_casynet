
import 'package:app_casynet/app/data/repo/home_repo.dart';
import 'package:get/get.dart';

class OriginController extends GetxController{
  final origins = [].obs;

  @override
  void onInit() {
    _getOriginApi();
  }

  void _getOriginApi() async {
    try{
      final result = await HomePageRepo().getOrigins(
          queryParameters : {

          }
      );

    } catch(error){

    }


  }
}