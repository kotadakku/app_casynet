
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../../controller/filter_product_controller.dart';
import '../../app/views/theme/app_colors.dart';
import '../../screens/theme/app_colors.dart';

class CategoryProductWidget extends StatelessWidget {
  const CategoryProductWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final FilterCategoriesController controller = Get.find<FilterCategoriesController>();
    List<String> _categories = [
      "Rửa xe, thay dầu", "Sửa chữa xe", "Đồ chơi, phụ kiện", "Mua bán xe", "Chăm sóc xe", "Lốp và ác quy xe"
    ];
    return Padding(
        padding: EdgeInsets.symmetric(vertical: 5.h, horizontal: 10.w),
        child:  Column(
          children: [

            Container(
              width: double.infinity,
              child: Row(
                mainAxisSize: MainAxisSize.max,
                children: [

                  const Text("Danh mục",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const Spacer(),
                  IconButton(
                      onPressed: (){
                        controller.expand();
                      },
                      iconSize: 20,
                      icon: AnimatedBuilder(
                        animation: controller.expandFilterCategoriesController,
                        builder: (context, child){
                          return Transform.rotate(angle: controller.animationRotale.value, child: Icon(Icons.keyboard_arrow_down_outlined,) );
                        },
                      )
                  )
                ],
              ),
            ),
           SizeTransition(
              sizeFactor: controller.animationCategories,
              axisAlignment: 1.0,
              child: Container(
                width: double.infinity,
                child: Wrap(
                  spacing: 5.0.w,
                  children: _categories.map((e) => Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Obx((){
                        bool isContains = controller.isContains(e);
                        return Container(
                          child: ElevatedButton(
                            child: Text(e,
                              style: TextStyle(
                                  color: isContains ? Colors.white :  kTextColor
                              ),
                            ),
                            style: ElevatedButton.styleFrom(
                                primary: isContains ? kYellowColor : Colors.white,
                                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30.0)),
                                side: BorderSide(width: 1, color: isContains ? kYellowColor : kTextColor),
                                elevation: 0
                            ), onPressed: () {
                            controller.change_list(e);
                          },
                          ),
                        );
                      })
                    ],
                  )).toList(),
                )
            )
            )
            ,
          ],
        )
    );
  }
}
