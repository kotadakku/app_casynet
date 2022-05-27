
import 'package:app_casynet/app/views/widgets/loading_overlay.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../../../controller/home/api/recommend_controller.dart';
import '../../../../controller/home/radio_controller.dart';
import '../../../../routes/app_pages.dart';
import '../../../theme/textTheme.dart';
import '../../../widgets/shimmer/seller_shimmer.dart';
import 'items/product_item.dart';

class RecommendWidget extends StatelessWidget {

  RecommendWidget({Key? key}) : super(key: key);
  RecommendController _recommendController = Get.find();
  @override
  Widget build(BuildContext context) {
    RadioController controller = Get.find();
    return Material(
      elevation: 3,
      child: Container(
        color: Colors.white,
        child: Column(
          children: [
            Material(
              elevation: 2,
              child: Padding(padding: EdgeInsets.symmetric(vertical: 12.0.h),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [

                        Container(
                          padding: EdgeInsets.only(left: 10.w),
                          child: CircleAvatar(
                            child: Text(
                              "123",
                              style: TextStyle(
                                  color: Colors.white
                              ),
                            ),
                            backgroundColor: Color(0xffDFB400),
                          ),),
                        SizedBox(width: 15,),
                        Text(
                            'recommend'.tr.toUpperCase(),
                            style: AppTextTheme.titleProduct
                        )
                      ],
                    ),
                    GestureDetector(
                      behavior: HitTestBehavior.translucent,
                      onTap: (){
                        _view_more('recommed'.tr, 32);
                      },
                      child: Row(
                        children: [
                          Text(
                            'more'.tr,
                            style: TextStyle(
                              color: Color(0xffB7BAC1),
                            ),
                          ),
                          SizedBox(width: 5.0,),
                          Container(
                            padding: EdgeInsets.only(right: 10.0),
                            child: SvgPicture.asset("assets/home/store/icon_xemthem.svg", width: 5,),
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Obx(()=>Row(
                      children: [
                        Radio(
                            value: true,
                            groupValue: controller.isCarRecommend.value,
                            onChanged: (value){
                              controller.updateIsCarRecommend();
                            },
                            activeColor: Color(0xffDFB400)),
                        Text("Ô tô"),
                        SizedBox(width: 20,),
                        Radio(
                            value: false,
                            groupValue: controller.isCarRecommend.value,
                            onChanged: (value){
                              controller.updateIsCarRecommend();
                            },
                            activeColor: Color(0xffDFB400)
                        ),
                        Text("Xe máy")
                      ],
                    ))

                  ],
                ),
                GestureDetector(
                  behavior: HitTestBehavior.translucent,
                  child: Row(
                    children: [
                      SvgPicture.asset("assets/home/store/icon_filter.svg", width: 15,),
                      SizedBox(width: 5,),
                      Text(
                        "Lọc",
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
            Obx(()=>LoadingOverlay(
                isLoading: _recommendController.isLoadingDB.value,
                shimmer: ItemSellerShimmer(),
                child: Stack(
                  children: [
                    Padding(padding: EdgeInsets.only(bottom: 15.h),
                      child: _recommendController.error == '' ?
                      Wrap(
                        spacing: 5.0.w,
                        runSpacing: 10.0,
                        children: (_recommendController.recommendProductList as List).map((e) => ItemProductWidget(
                            product: e
                        ),).toList(),
                      ): Column(
                        children: [
                          Text("${_recommendController.error}"),
                          ElevatedButton(
                            child: Text('Thử lại'),
                            onPressed: (){
                              _recommendController.getRecommendProductsAPI();
                            },
                          )
                        ],
                      ),
                    ),
                    _recommendController.isLoadingAPI.value ?
                    Container(height: 160,
                        color: Colors.grey.withOpacity(0.3),
                        child: Center(
                          child: CircularProgressIndicator(),
                        )
                    )
                        : SizedBox()

                  ],
                )
              )
            ),
          ],
        ),
      ),
    );
  }
  void _filter_product() {
    Get.toNamed(Routes.FILTER_PRODUCT,
        arguments: {
          'controller': _recommendController
        }
    );
  }

  void _view_more(title, id) {
    Get.toNamed(Routes.PRODUCTS_BY_CATEGORY, arguments: [title, id]);
  }
}

