import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../../../controller/home/api/category_controller.dart';
import '../../../theme/app_colors.dart';
import 'items/bottom_category_item.dart';

class CategoryBottomWidget extends StatelessWidget {
  CategoryBottomWidget({Key? key}) : super(key: key);
  final CategoryController _fetchDataController = Get.find();
  @override
  Widget build(BuildContext context) {
    return Container(
        color: AppColors.backgroundColor,
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
        );
  }
}


