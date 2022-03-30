
import 'package:app_casynet/controller/filter_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../containts/colors.dart';

class CategoryProductWidget extends StatelessWidget {
  const CategoryProductWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<String> _categories = [
      "Rửa xe, thay dầu", "Sửa chữa xe", "Đồ chơi, phụ kiện", "Mua bán xe", "Chăm sóc xe", "Lốp và ác quy xe"
    ];
    return Padding(
        padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
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
                        if(Get.find<FilterController>().more_categories.value){
                          Get.find<FilterCategoriesController>().expandFilterCategoriesController.reverse();
                          Get.find<FilterController>().more_categories.value = !Get.find<FilterController>().more_categories.value;
                        }
                        else{
                          Get.find<FilterCategoriesController>().expandFilterCategoriesController.forward();
                          Get.find<FilterController>().more_categories.value = !Get.find<FilterController>().more_categories.value;
                        }

                      },
                      iconSize: 20,
                      icon: Obx(()=>Icon( Get.find<FilterController>().more_categories.value ? Icons.keyboard_arrow_up_outlined : Icons.keyboard_arrow_down_outlined))
                  )
                ],
              ),
            ),
           SizeTransition(
              sizeFactor: Get.find<FilterCategoriesController>().animationCategories,
              axisAlignment: 1.0,
              child: Container(
                width: double.infinity,
                child: Wrap(
                  spacing: 5.0,
                  children: _categories.map((e) => Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Obx(()=>Container(
                        child: ElevatedButton(
                          child: Text(e,
                            style: TextStyle(
                                color: Get.find<FilterController>().categories_active.contains(e) ? Colors.white :  kTextColor
                            ),
                          ),
                          style: ElevatedButton.styleFrom(
                              primary: Get.find<FilterController>().categories_active.contains(e) ? kYellowColor : Colors.white,
                              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30.0)),
                              side: BorderSide(width: 1, color: Get.find<FilterController>().categories_active.contains(e) ? kYellowColor : kTextColor),
                              elevation: 0
                          ), onPressed: () {
                          !Get.find<FilterController>().categories_active.contains(e) ?
                          Get.find<FilterController>().categories_active.add(e):
                          Get.find<FilterController>().categories_active.remove(e);
                        },
                        ),
                      ))
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
