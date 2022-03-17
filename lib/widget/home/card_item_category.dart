
import 'package:flutter/material.dart';

class CategoryWidget extends StatelessWidget {
  const CategoryWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<Widget> danhmuc = [
      ItemCategoryWidget(image_url: "assets/home/category/ruaxethaydau.png", title: "Rửa xe, thay dầu"),
      ItemCategoryWidget(image_url: "assets/home/category/suachuaxe.png", title: "Sửa chữa xe"),
      ItemCategoryWidget(image_url: "assets/home/category/dochoiphukien.png", title: "Đồ chơi, phụ kiện"),
      ItemCategoryWidget(image_url: "assets/home/category/muabanxe.png", title: "Mua bán xe"),
      ItemCategoryWidget(image_url: "assets/home/category/chamsocxe.png", title: "Chăm sóc xe"),
      ItemCategoryWidget(image_url: "assets/home/category/lopacquy.png", title: "Lốp và ác quy xe"),
    ];
    return Wrap(
      runSpacing: 10,
      children: danhmuc,
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
      LayoutBuilder(builder: (context, constraint) {
        return Container(
          width: constraint.maxWidth / 3,
          child: Column(
            children: [
              Image.asset(image_url, width: 50, height: 50,),
              SizedBox(height: 10,),
              Text(title),
            ],
          ),
        );
      });
  }
}
