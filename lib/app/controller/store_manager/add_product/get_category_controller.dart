
import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:get/get.dart';

import '../../../data/model/category.dart';
import '../../../views/screens/store_manager/UI_cacmenuch/UI_dichvusanpham/danhmuc.dart';

class getdanhmuc extends GetxController {
  var danhmucsp = [].obs;
  var getdanhmuctid = [].obs;
  var dem = 0.obs;
  var nothing = [].obs;
  Future<List<Category>> fetchDanhmuc() async {
    final response = await http.get(Uri.parse(
        "https://coaxial-typewriter.000webhostapp.com/Server/Danhmucsanpham.php"));
    List<dynamic> list = json.decode(response.body);
    List<Category> pp = [];

    pp = list.map((e) => Category.fromJson(e)).toList();
    if (nothing.length == 0) {
      for (int i = 0; i < pp.length; i++) {
        nothing.add(danhmuc(
            title: pp[i].imageUrl.toString(),
            id: int.parse(pp[i].id.toString())));
      }
    }
    danhmucsp.value = pp;
    return pp;
  }
}