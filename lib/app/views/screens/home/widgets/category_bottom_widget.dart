import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../../../controller/home/api/category_controller.dart';
import '../../../theme/app_colors.dart';
import 'items/bottom_category_item.dart';

class CategoryBottomWidget extends StatelessWidget {
  CategoryBottomWidget({Key? key}) : super(key: key);
  CategoryController _fetchDataController = Get.find();
  @override
  Widget build(BuildContext context) {
    return Container(
        color: kBackgroundColor,
        padding: EdgeInsets.symmetric(vertical: 10),
        child: Align(
          alignment: Alignment.center,
          child: LayoutBuilder(builder: (context, constraints) {
            return Obx(()=>Wrap(
              runSpacing: 10,
              spacing: 10,
              children: (_fetchDataController.categoriesList as List)
                  .map(
                    (e) => CategoryItemBottom(
                    id: e.id,
                    images_url: e.imageUrl.toString(),
                    name: e.name.toString()),
              ).toList(),
            ));
          }),
        )
        /*Wrap(
            runSpacing: 10,
            spacing: 10,
            children: [
              CategoryItemBottom(
                  images_url: "assets/home/category/bt_ruaxethaydau.svg",
                  name: "Rửa xe thay dầu"),
              CategoryItemBottom(
                  images_url: "assets/home/category/bt_suachuaxe.svg",
                  name: "Sửa chữa xe"),
              CategoryItemBottom(
                  images_url: "assets/home/category/bt_dochoiphukien.svg",
                  name: "Đồ chơi, phụ kiện xe"),
              CategoryItemBottom(
                  images_url: "assets/home/category/bt_muabanxe.svg",
                  name: "Mua bán xe"),
              CategoryItemBottom(
                  images_url: "assets/home/category/bt_chamsocxe.svg",
                  name: "Chăm sóc xe"),
              CategoryItemBottom(
                  images_url: "assets/home/category/bt_lopacquy.svg",
                  name: "Lốp và ác quy xe"),
            ]),*/
        );
  }
}


