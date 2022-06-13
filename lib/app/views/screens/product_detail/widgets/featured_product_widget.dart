
import 'package:app_casynet/app/controller/controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../theme/app_colors.dart';
import '../../../widgets/loading_overlay_shimmer.dart';
import '../../../widgets/shimmer/seller_shimmer.dart';
import '../../home/widgets/items/product_item.dart';

class FeaturedProductWidget extends StatelessWidget {
  FeaturedProductWidget({Key? key}) : super(key: key);
  final DetailProductController _detailProductController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: EdgeInsets.only(top: 10.h, left: 10.w),
          width: double.infinity,
          child: Text('featured_product'.tr,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: AppColors.yellowColor,
              fontSize: 18
            ),
          ),
        ),
        Divider(
          height: 20,
          color: AppColors.textGrayColor,
        ),
        Obx(()=>LoadingOverlayShimmer(
            isLoadingAPI: _detailProductController.isLoadingFeatured.value,
            isLoadingDB: false,
            funcRetry: () => _detailProductController.getProductFeatureAPI(category_id: 12),
            funcSkip: () => _detailProductController.errorgetFeatures.value = '',
            error: _detailProductController.errorgetFeatures.value,
            shimmer: ItemSellerShimmer(),
            child: _detailProductController.productFeaturedList.length>0 ? GridView.builder(
                shrinkWrap: true,
                padding: EdgeInsets.symmetric(horizontal: 5.0.w),
                physics: const NeverScrollableScrollPhysics(),
                gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                    maxCrossAxisExtent: 200,
                    childAspectRatio: 2 / 3.3,
                    crossAxisSpacing: 5,
                    mainAxisSpacing: 5),
                itemCount: _detailProductController.productFeaturedList.length,
                itemBuilder: (BuildContext ctx, index) {
                  return ItemProductWidget(
                    index: index,
                    products: _detailProductController.productFeaturedList,
                  );
                }
            ): SizedBox(
              height: 30,
              child: Center(
                child: Text('Không có sản phẩm để hiển thị'),
              ),
            )
        ),
        ),
        Divider(height: 20,),
        Obx(()=>_detailProductController.productFeaturedList.length>0
            ?Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('more'.tr, style: TextStyle(
                color: AppColors.yellowColor
            ),),
            Container(
              margin: EdgeInsets.all(5.0),
              child: Icon(Icons.keyboard_arrow_down_sharp, color: AppColors.yellowColor, size: 15,),
            )
          ],
        ): SizedBox()
        )
      ],
    );
  }
}
