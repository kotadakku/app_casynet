
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import '../../../../controller/store_detail/detail_store_controller.dart';
import '../../../../routes/app_pages.dart';
import '../../../theme/app_colors.dart';
import '../../../widgets/loading_overlay_shimmer.dart';
import '../../../widgets/shimmer/seller_shimmer.dart';
import '../../home/widgets/items/product_item.dart';
import 'gift_store_widget.dart';


class ProductStoreWidget extends StatelessWidget {
  ProductStoreWidget({Key? key}) : super(key: key);
  final DetailStoreController _detailStoreController = Get.find<DetailStoreController>();

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          GiftStoreWidget(),
          Container(
            color: Colors.white,
            child: Column(
              children: [

                SizedBox(height: 5, child: Container(color: Color(0xffF1F3FD),),),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Obx(()=>Row(
                          children: [
                            Radio(
                                value: true,
                                groupValue: _detailStoreController.isCarReservation.value,
                                onChanged: (value){
                                  _detailStoreController.isCarReservation.value = !_detailStoreController.isCarReservation.value;
                                },
                                activeColor: Color(0xffDFB400)),
                            Text("Ô tô"),
                            SizedBox(width: 20,),
                            Radio(
                                value: false,
                                groupValue: _detailStoreController.isCarReservation.value,
                                onChanged: (value){
                                  _detailStoreController.isCarReservation.value = !_detailStoreController.isCarReservation.value;
                                },
                                activeColor: Color(0xffDFB400)
                            ),
                            Text("Xe máy")
                          ],
                        )),
                      ],
                    ),
                    GestureDetector(
                      behavior: HitTestBehavior.translucent,
                      child: Row(
                        children: [
                          SvgPicture.asset("assets/images/home/store/icon_filter.svg", width: 15,),
                          SizedBox(width: 5,),
                          Text(
                            'filter'.tr,
                            style: TextStyle(
                              color: Color(0xffB7BAC1),
                            ),
                          ),
                          SizedBox(width: 10,)
                        ],
                      ),
                      onTap: (){
                        _filter_product();
                      },
                    )

                  ],
                ),
                Obx(()=>LoadingOverlayShimmer(
                    isLoadingAPI: _detailStoreController.isLoadingFeatured.value,
                    isLoadingDB: false,
                    funcRetry: () => _detailStoreController.getProductSellerAPI(category_id: 12),
                    funcSkip: () => _detailStoreController.errorgetFeatures.value = '',
                    error: _detailStoreController.errorgetFeatures.value,
                    shimmer: ItemSellerShimmer(),
                    child: _detailStoreController.productFeaturedSellerList.length>0 ? GridView.builder(
                        shrinkWrap: true,
                        padding: EdgeInsets.symmetric(horizontal: 5.0.w),
                        physics: const NeverScrollableScrollPhysics(),
                        gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                            maxCrossAxisExtent: 200,
                            childAspectRatio: 2 / 3.3,
                            crossAxisSpacing: 5,
                            mainAxisSpacing: 5),
                        itemCount: _detailStoreController.productFeaturedSellerList.length,
                        itemBuilder: (BuildContext ctx, index) {
                          return ItemProductWidget(
                            index: index,
                            products: _detailStoreController.productFeaturedSellerList,
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
                Obx(()=>_detailStoreController.productFeaturedSellerList.length>0
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
            ),
          )
        ],
      ),
    );
  }
  void _filter_product() {
    Get.toNamed(Routes.FILTER_PRODUCT,
        arguments: {
          'controller': _detailStoreController
      }
    );
  }
}
