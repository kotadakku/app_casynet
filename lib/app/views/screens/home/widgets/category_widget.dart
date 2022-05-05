
import 'package:app_casynet/app/controller/home/category_home_controller.dart';
import 'package:app_casynet/app/data/model/category_home.dart';
import 'package:app_casynet/app/views/widgets/loading_overlay.dart';
import 'package:app_casynet/app/views/widgets/shimmer_loading.dart';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import '../../../../routes/app_pages.dart';
import '../../../theme/app_colors.dart';
import '../../../theme/textTheme.dart';

class CategoryWidget extends StatelessWidget {
  const CategoryWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // CategoryHome categoryHome;
    List<Widget> danhmuc = [
      ItemCategoryWidget(image_url: "assets/home/category/ruaxethaydau.png", title: "Rửa xe, thay dầu"),
      ItemCategoryWidget(image_url: "assets/home/category/suachuaxe.png", title: "Sửa chữa xe"),
      ItemCategoryWidget(image_url: "assets/home/category/dochoiphukien.png", title: "Đồ chơi, phụ kiện"),
      ItemCategoryWidget(image_url: "assets/home/category/muabanxe.png", title: "Mua bán xe"),
      ItemCategoryWidget(image_url: "assets/home/category/chamsocxe.png", title: "Chăm sóc xe"),
      ItemCategoryWidget(image_url: "assets/home/category/lopacquy.png", title: "Lốp và ác quy xe"),
      ItemCategoryWidget(image_url: "assets/home/category/chamsocxe.png", title: "Chăm sóc xe"),
    ];
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(padding: EdgeInsets.symmetric(horizontal: 20.0.w, vertical: 15.0.h ),
          child: Text('category'.tr.toUpperCase(),
            style: AppTextTheme.categories,
          ),
        ),
        SizedBox(height: 160,
          child: Center(
            child: LayoutBuilder(
              builder: (context, constraints) {
                  int device = constraints.maxWidth>=780 ? 5 : 3;
                  return GetBuilder<CategoryHomeController>(
                    init: CategoryHomeController(),
                    builder: ((controller){
                      return LoadingOverlay(isLoading: controller.loadingCategoryHome,
                        shimmer: CategoryShimer(),
                        child: controller.categoryHomeList.isEmpty ? Text("Không có thể loại để hiển thị"):
                        GridView.count(
                          crossAxisCount: 2,
                          childAspectRatio: (80/(ScreenUtil().screenWidth/device)),
                          scrollDirection: Axis.horizontal,
                          padding: EdgeInsets.all(0.0),
                          shrinkWrap: true,
                          children: controller.categoryHomeList.map((e) => ItemCategoryWidget(image_url: e.anhdanhmuc.toString(), title: e.tendanhmuc.toString()),).toList(),
                        )
                      );
                    }),
                  );
              }
            ),

          )
        )
      ],
    ) ;
  }
}


class ItemCategoryWidget extends StatelessWidget {

  final String image_url;
  final String title;
  ItemCategoryWidget({Key? key,required this.image_url, required this.title}) : super(key: key);

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
              Image.network(image_url, width: 50, height: 50,),
              Text(title),
            ],
          ),
          decoration: BoxDecoration(
              color: Colors.amber,
            border: Border.all(
              color: AppColors.kBackgroundColor
            )
          ),
        ),
      ) ;
  }
}


class CategoryShimer extends StatelessWidget {
  const CategoryShimer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(height: 160,
        child: Center(
          child: LayoutBuilder(
              builder: (context, constraints) {
                int device = constraints.maxWidth>=780 ? 5 : 3;
                return GridView.count(
                  crossAxisCount: 2,
                  childAspectRatio: (80/(ScreenUtil().screenWidth/device)),
                  scrollDirection: Axis.horizontal,
                  padding: EdgeInsets.all(0.0),
                  shrinkWrap: true,
                  children: List.generate(6, (index) => Column(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      ShimmerLoading(isLoading: true, child: Container(
                        
                        height: 50,
                        width: 60,
                        decoration: BoxDecoration(
                          color: Colors.black,
                          borderRadius: BorderRadius.circular(5.0)
                        ),
                      )),
                      SizedBox(height: 10,),
                      ShimmerLoading(isLoading: true, child: Container(
                        height: 10,
                        width: 50,
                        decoration: BoxDecoration(
                            color: Colors.black,
                            borderRadius: BorderRadius.circular(5.0)
                        ),
                      )),

                    ],
                  ),)
                );
              }
          ),
        )
    );
  }
}

