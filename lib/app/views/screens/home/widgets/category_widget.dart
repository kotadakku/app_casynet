
import 'package:app_casynet/app/views/screens/theme/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import '../../../../routes/app_pages.dart';
import '../../theme/textTheme.dart';

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
      ItemCategoryWidget(image_url: "assets/home/category/chamsocxe.png", title: "Chăm sóc xe"),
      ItemCategoryWidget(image_url: "assets/home/category/lopacquy.png", title: "Lốp và ác quy xe"),
      ItemCategoryWidget(image_url: "assets/home/category/chamsocxe.png", title: "Chăm sóc xe"),
      ItemCategoryWidget(image_url: "assets/home/category/lopacquy.png", title: "Lốp và ác quy xe"),
    ];
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(padding: EdgeInsets.symmetric(horizontal: 20.0.w, vertical: 15.0.h ),
          child: Text("DANH MỤC",
            style: AppTextTheme.categories,
          ),
        ),
        SizedBox(height: 160,
            child: GridView.count(
              crossAxisCount: 2,
              childAspectRatio: 80/(ScreenUtil().screenWidth/3),
              scrollDirection: Axis.horizontal,
              padding: EdgeInsets.all(0.0),

              shrinkWrap: true,
              children: danhmuc,
            )
        ),

      ],
    ) ;
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
            mainAxisSize: MainAxisSize.max,
            children: [
              Image.asset(image_url, width: 50, height: 50,),
              Text(title),
            ],
          ),
          decoration: BoxDecoration(
            border: Border.all(
              color: AppColors.kBackgroundColor
            )
          ),
        ),
      ) ;
  }
}