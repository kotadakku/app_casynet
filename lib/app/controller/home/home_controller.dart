
import 'package:get/get.dart';

class HomeController extends GetxController{
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

  String languageToString() {
    if(_isVN) return 'VN';
    return 'EN';
  }

  void refreshAPI(){

  }
}
