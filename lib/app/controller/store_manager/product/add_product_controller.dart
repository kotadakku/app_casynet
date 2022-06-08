
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:video_player/video_player.dart';

import '../../../data/model/category.dart';
import '../../../views/screens/store_manager/UI_cacmenuch/UI_dichvusanpham/UI_ThemSPDV.dart';

class AddProductController extends GetxController{
  var date = new DateTime.now().obs;
  final clsp = Get.put(chonloaisp());
  final name = TextEditingController();
  final motasanpham = TextEditingController();
  final soluongnhapkho = TextEditingController();
  final soluongconlai = TextEditingController();
  final gia = TextEditingController();
  final giakhuyenmai = TextEditingController();
  var demname = 0.obs;
  var demmotasanpham = 0.obs;
  var status = false.obs;
  var statushtsp = false.obs;
  var statushttc = false.obs;
  var textst = "không".obs;
  var textsthtsp = "không".obs;
  var textsthttc = "không".obs;
  var chon = "".obs;
  var cc="".obs;
  var tenxuatxu = "Chọn xuất xứ".obs;
  var controller=VideoPlayerController.network("https://flutter.github.io/assets-for-api-docs/assets/images/videos/butterfly.mp4").obs;
  late Future<void> initializeVideoPlayerFuture;
  var playpause = false.obs;
  final listCategorySelected = <Category>[].obs;

  @override
  void onInit() {
    soluongnhapkho.text = '0';
    soluongconlai.text= '0';
    gia.text = '0';
  }
}