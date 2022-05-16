
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
                        physics: ClampingScrollPhysics(),
                        gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                            maxCrossAxisExtent: constraints.maxHeight/2,
                            childAspectRatio: 80/(ScreenUtil().screenWidth/device),
                        ),

                        scrollDirection: Axis.horizontal,
                        padding: EdgeInsets.all(0.0),
                        shrinkWrap: true,
                        itemCount: state.length,
                        itemBuilder: (context, index)=>ItemCategoryWidget(image_url: state[index].imageUrl.toString(), title: state[index].name.toString()),
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
              ImageNetworkLoading(image_url: image_url, width: 50, height: 50,),
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
          child: Stack(
            children: [
              LayoutBuilder(
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
              CircularProgressIndicator(),
            ],
          ),
        )
    );
  }
}

