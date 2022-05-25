
import 'package:app_casynet/app/views/widgets/image_network_loading.dart';
import 'package:app_casynet/app/views/widgets/shimmer_loading.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import '../../../../controller/home/api/category_controller.dart';
import '../../../../routes/app_pages.dart';
import '../../../theme/app_colors.dart';
import '../../../theme/textTheme.dart';
import '../../../widgets/shimmer/category_shimmer.dart';
import 'items/category_item.dart';

class CategoryWidget extends StatelessWidget {
  CategoryWidget({Key? key}) : super(key: key);
  CategoryController _fetchDataController = Get.find();

  @override
  Widget build(BuildContext context) {
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
                  return  _fetchDataController.obx((state) =>
                      GridView.builder(
                        physics: BouncingScrollPhysics(),
                        gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                            maxCrossAxisExtent: constraints.maxHeight/2,
                            childAspectRatio: 80/(ScreenUtil().screenWidth/device),
                        ),

                        scrollDirection: Axis.horizontal,
                        padding: EdgeInsets.all(0.0),
                        shrinkWrap: true,
                        itemCount: state.length,
                        itemBuilder: (context, index)=>ItemCategoryWidget(image_url: state[index].imageUrl.toString(), title: state[index].name.toString(), id: state[index].id),
                      ),
                    onLoading: CategoryShimer(),
                  );
              }
            ),

          )
        )
      ],
    ) ;
  }
}





