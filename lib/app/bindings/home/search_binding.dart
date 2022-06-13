import 'package:get/get.dart';

import '../../controller/home/search_contoller.dart';

class SearchBinding extends Bindings{
  @override
  void dependencies() {
    Get.put(SearchController());
  }

}