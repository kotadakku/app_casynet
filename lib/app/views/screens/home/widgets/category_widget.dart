
import 'package:app_casynet/app/views/widgets/loading_overlay.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../../controller/home/api/category_controller.dart';
import '../../../theme/app_style.dart';
import '../../../widgets/shimmer/category_shimmer.dart';
import 'items/category_item.dart';

class CategoryWidget extends StatelessWidget {
  CategoryWidget({Key? key}) : super(key: key);
  final CategoryController _fetchDataController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Obx(()=>LoadingOverlay(
        isLoading: _fetchDataController.isLoadingDB.value,
        shimmer: const CategoryShimer(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(padding: EdgeInsets.symmetric(horizontal: 20.0.w, vertical: 15.0.h ),
              child: Text('category'.tr.toUpperCase(),
                style: AppStyle.textcategories,
              ),
            ),
            Stack(
              children: [
                SizedBox(height: 160,
                    child: Center(
                      child: LayoutBuilder(
                          builder: (context, constraints) {
                            int device = constraints.maxWidth>=780 ? 5 : 3;
                            return  Obx(()=>GridView.builder(
                              physics: const BouncingScrollPhysics(),
                              gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                                maxCrossAxisExtent: constraints.maxHeight/2,
                                childAspectRatio: 80/(ScreenUtil().screenWidth/device),
                              ),

                              scrollDirection: Axis.horizontal,
                              padding: const EdgeInsets.all(0.0),
                              shrinkWrap: true,
                              itemCount: _fetchDataController.categoriesList.length,
                              itemBuilder: (context, index)=>ItemCategoryWidget(
                                  image_url: _fetchDataController.categoriesList[index].imageUrl.toString(),
                                  title: _fetchDataController.categoriesList[index].name.toString(),
                                  id: _fetchDataController.categoriesList[index].id),
                            ),);
                          }
                      ),

                    )
                ),
                _fetchDataController.isLoadingAPI.value ?
                Container(height: 160,
                    color: Colors.grey.withOpacity(0.3),
                    child: const Center(
                      child: CircularProgressIndicator(),
                    )
                )
                    : Container()
              ],
            )
          ],
        ),
    ));
  }
}





