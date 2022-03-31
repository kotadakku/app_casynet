
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


                      },
                      iconSize: 20,
                      icon: Obx(()=>Icon( Get.find<FilterCategoriesController>().more_categories.value ? Icons.keyboard_arrow_up_outlined : Icons.keyboard_arrow_down_outlined))
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
                      Obx((){
                        bool isContains = Get.find<FilterCategoriesController>().isContains(e);
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
                            Get.find<FilterCategoriesController>().change_list(e);
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
