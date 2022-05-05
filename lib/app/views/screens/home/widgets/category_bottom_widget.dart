import 'package:app_casynet/app/controller/home/category_home_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import '../../../../routes/app_pages.dart';
import '../../../theme/app_colors.dart';

class CategoryBottomWidget extends StatelessWidget {
  const CategoryBottomWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        color: kBackgroundColor,
        padding: EdgeInsets.symmetric(vertical: 10),
        child: Align(
          alignment: Alignment.center,
          child: LayoutBuilder(builder: (context, constraints) {
            return GetBuilder<CategoryHomeController>(
                init: CategoryHomeController(),
                builder: ((controller) {
                  return Wrap(
                    runSpacing: 10,
                    spacing: 10,
                    children: controller.categoryHomeList
                        .map(
                          (e) => CategoryItemBottom(
                              images_url: e.anhdanhmuc.toString(),
                              name: e.tendanhmuc.toString()),
                        )
                        .toList(),
                  );
                }));
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

class CategoryItemBottom extends StatelessWidget {
  final String images_url;
  final String name;

  const CategoryItemBottom(
      {Key? key, required this.images_url, required this.name})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: LayoutBuilder(builder: (context, constraint) {
        var width = constraint.maxWidth > 785
            ? (constraint.maxWidth / 3 - 20)
            : (constraint.maxWidth / 2 - 15);
        return Container(
            width: width,
            height: 42,
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(5.0),
                border: Border.all(width: 1, color: kYellowColor)),
            child: Column(
              children: [
                Row(
                  children: [
                    Stack(
                      children: [
                        Container(
                          child: SvgPicture.asset(
                          "assets/home/category/left_bottom.svg",
                          height: 40,
                          // fit: BoxFit.cover,
                        ),),
                        Positioned(
                            left: 10,
                            top: 10,
                            child: Image.network(images_url, height: 16))
                      ],
                    ),
                    SizedBox(
                      width: 5,
                    ),
                    FittedBox(
                      child: Text(
                        name,
                        style: TextStyle(color: kTextColor_gray, fontSize: 12),
                      ),
                    )
                  ],
                ),
              ],
            ));
      }),
      onTap: () {
        Get.toNamed(Routes.PRODUCTS_BY_CATEGORY, arguments: [name, 12]);
      },
    );
  }
}
