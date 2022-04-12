
import 'package:app_casynet/routes/app_pages.dart';
import 'package:app_casynet/screens/products.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

class CategoryWidget extends StatelessWidget {
  const CategoryWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<Widget> danhmuc = [
      ItemCategoryWidget(key: ValueKey(1),image_url: "assets/home/category/ruaxethaydau.png", title: "Rửa xe, thay dầu"),
      ItemCategoryWidget(key: ValueKey(2), image_url: "assets/home/category/suachuaxe.png", title: "Sửa chữa xe"),
      ItemCategoryWidget(key: ValueKey(3), image_url: "assets/home/category/dochoiphukien.png", title: "Đồ chơi, phụ kiện"),
      ItemCategoryWidget(key: ValueKey(4), image_url: "assets/home/category/muabanxe.png", title: "Mua bán xe"),
      ItemCategoryWidget(key: ValueKey(5), image_url: "assets/home/category/chamsocxe.png", title: "Chăm sóc xe"),
      ItemCategoryWidget(key: ValueKey(6), image_url: "assets/home/category/lopacquy.png", title: "Lốp và ác quy xe"),
    ];
    return Center(
      child: GridView.count(
        crossAxisCount: 2,
        childAspectRatio: 0.8,
        scrollDirection: Axis.horizontal,
        shrinkWrap: true,
        children: danhmuc,
      ),
    );
  }
}


class ItemCategoryWidget extends StatelessWidget {
  final String image_url;
  final String title;
  const ItemCategoryWidget({Key? key, required this.image_url, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return
      GestureDetector(
        behavior: HitTestBehavior.translucent,
        onTap: (){
          Get.toNamed(Routes.PRODUCTS_BY_CATEGORY, arguments: [title]);
        },
        child: Container(
          child: Column(
            children: [
              Image.asset(image_url, width: 50, height: 50,),
              SizedBox(height: 10,),
              Text(title),
            ],
          ),
        ),
      ) ;
  }
}
