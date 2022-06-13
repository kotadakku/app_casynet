import 'package:app_casynet/app/views/widgets/loading_overlay_shimmer.dart';
import 'package:app_casynet/app/views/widgets/shimmer/seller_shimmer.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../../../controller/home/home_controller.dart';
import '../../../../controller/store_detail/detail_store_controller.dart';
import '../../../../routes/app_pages.dart';
import '../../../theme/app_colors.dart';
import '../../../theme/app_sizes.dart';
import '../../../theme/app_style.dart';
import '../../home/widgets/items/product_item.dart';
import 'gift_store_widget.dart';

class IntroStoreWidget extends StatelessWidget {
  IntroStoreWidget({Key? key, required this.controller}) : super(key: key);
  DetailStoreController controller = Get.find();

  @override
  Widget build(BuildContext context) {


    return SingleChildScrollView(
        child: Column(
      children: [
        GiftStoreWidget(),
        // Thông tin chi tiết
        Row(
          children: [
            Container(
                margin: EdgeInsets.only(left: 10.0, top: 10.0, bottom: 5.0),
                child: Padding(
                  padding: EdgeInsets.only(right: 5.0),
                  child: Icon(
                    Icons.watch_later,
                    size: AppSize.iconSize,
                    color: AppColors.yellowColor,
                  ),
                )),
            Text('time_open'.tr),
            Text(
                " ${controller.store.value.timeOpen ?? '00:00'}  -  ${controller.store.value.timeClose??'00:00'}",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
          ],
        ),
        Row(
          children: [
            Container(
                margin:
                    EdgeInsets.only(left: 10.0.w, top: 5.0.h, bottom: 5.0.h),
                child: Padding(
                  padding: EdgeInsets.only(right: 5.0.w),
                  child: Icon(
                    Icons.phone,
                    size: AppSize.iconSize,
                    color: AppColors.yellowColor,
                  ),
                )),
            Text('phone'.tr),
            SizedBox(width: 5.0.w,),
            Text(
              controller.store.value.phone.toString(),
              style: TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
        Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
                margin:
                    EdgeInsets.only(left: 10.0.w, top: 5.0.h, bottom: 5.0.h),
                child: Padding(
                  padding: EdgeInsets.only(right: 5.0.w),
                  child: Icon(
                    Icons.location_on_rounded,
                    color: AppColors.yellowColor,
                    size: AppSize.iconSize,
                  ),
                )),
            Expanded(
              child: Text(controller.store.value.address.toString()),
            )
          ],
        ),
        //Thống kê
        Container(
          padding: EdgeInsets.all(10.0.w),
          child: DottedBorder(
            color: AppColors.yellowColor,
            padding: EdgeInsets.symmetric(horizontal: 10.0.w, vertical: 10.0.h),
            strokeWidth: 1,
            borderType: BorderType.RRect,
            radius: Radius.circular(10.0),
            dashPattern: [6, 4, 6, 4, 6, 4],
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Column(
                  children: [
                    Row(
                      children: [
                        Icon(
                          Icons.add,
                          color: AppColors.yellowColor,
                        ),
                        Text(
                          '${controller.store.value.totalProduct ?? 0}',
                          style: TextStyle(
                              color: AppColors.yellowColor,
                              fontSize: 16,
                              fontWeight: FontWeight.bold),
                        )
                      ],
                    ),
                    Text(
                      'product'.tr,
                      style: TextStyle(color: AppColors.textGrayColor, fontSize: 18),
                    )
                  ],
                ),
                Column(
                  children: [
                    Row(
                      children: [
                        Icon(
                          Icons.add,
                          color: AppColors.yellowColor,
                        ),
                        Text(
                          '${controller.store.value.totalTransaction ?? 0}',
                          style: TextStyle(
                              color: AppColors.yellowColor,
                              fontSize: 16,
                              fontWeight: FontWeight.bold),
                        )
                      ],
                    ),
                    Text(
                      'transactions'.tr,
                      style: TextStyle(color: AppColors.textGrayColor, fontSize: 18),
                    )
                  ],
                ),
                Column(
                  children: [
                    Row(
                      children: [
                        Icon(
                          Icons.add,
                          color: AppColors.yellowColor,
                        ),
                        Text(
                            '${controller.store.value.rateFeedback ?? 0}',
                          style: TextStyle(
                              color: AppColors.yellowColor,
                              fontSize: 16,
                              fontWeight: FontWeight.bold),
                        )
                      ],
                    ),
                    Text(
                      'response_rate'.tr,
                      style: TextStyle(color: AppColors.textGrayColor, fontSize: 18),
                    )
                  ],
                ),
              ],
            ),
          ),
        ),
        // Năm tham gia

        Padding(
          padding: EdgeInsets.symmetric(horizontal: 10.0.w, vertical: 10.0.h),
          child: Row(
            children: [
              Container(
                margin: EdgeInsets.all(5.0),
                child: Icon(
                  Icons.add,
                  color: AppColors.yellowColor,
                  size: AppSize.iconSize,
                ),
              ),
              Text("${'participation'.tr}: "),
              Text(
                controller.store.value.participationTime ??
                    'no-info'.tr,
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ],
          ),
        ),
        //Chất lượng
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 10.0.w),
          child: Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  RatingBarIndicator(
                    rating: controller.store.value.rate ?? 0.0,
                    unratedColor: Colors.amber.withOpacity(0.2),
                    itemBuilder: (context, index) => const Icon(
                      Icons.star_outlined,
                      color: Colors.amber,
                    ),
                    itemCount: 5,
                    itemSize: 18.0,
                    direction: Axis.horizontal,
                  ),
                  SizedBox(width: 10),
                  Text(
                    '${controller.store.value.rate??0.0} ',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  Text('quality'.tr)
                ],
              ),
              Row(
                children: [
                  Container(
                    margin: EdgeInsets.all(5.0),
                    child: Icon(
                      Icons.add,
                      color: AppColors.yellowColor,
                      size: AppSize.iconSize,
                    ),
                  ),
                  Text("${'bad_report'.tr}: "),
                  Text(
                    '${controller.store.value.bad_message ?? 0}',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  )
                ],
              )
            ],
          ),
        ),
        SizedBox(
          height: 20,
        ),
        // Giới thiệu cửa hàng
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 10.0.w),
              child: Text(
                'introduce_seller'.tr,
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
            Obx(()=>AnimatedContainer(
              duration: const Duration(microseconds: 500),
              height: controller.isReadMore.value ? null : 100,
              child: Html(
              data: controller.store.value.description ?? '<h5>Chưa có thông tin</h5>',
              ),
            ),),

            GestureDetector(
                behavior: HitTestBehavior.translucent,
                onTap: () {
                  controller.isReadMore.value = !controller.isReadMore.value;
                },
                child: Material(
                  elevation: 1,
                  color: Colors.white,
                  shadowColor: Colors.white,
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Obx(() => Text(
                        controller.isReadMore.value ? 'more'.tr : 'hide'.tr,
                            style: TextStyle(color: AppColors.yellowColor),
                          )),
                      Container(
                        margin: EdgeInsets.all(5.0),
                        child: Obx(() => Icon(
                          controller.isReadMore.value
                                  ? Icons.keyboard_arrow_down_sharp
                                  : Icons.keyboard_arrow_up_sharp,
                              color: AppColors.yellowColor,
                            )),
                      ),
                    ],
                  ),
                ))
          ],
        ),
        Container(
          color: AppColors.backgroundColor,
          height: 10,
        ),
        // ReservationWidget(),

        // Đặt chỗ
        Column(
          children: [
            Material(
              elevation: 1,
              color: Colors.white,
              child: Padding(
                padding: EdgeInsets.symmetric(vertical: 12.0.h),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Container(
                          padding: EdgeInsets.only(left: 10.w),
                          child: const CircleAvatar(
                            child: Text(
                              "123",
                              style: TextStyle(color: Colors.white),
                            ),
                            backgroundColor: Color(0xffDFB400),
                          ),
                        ),
                        const SizedBox(
                          width: 15,
                        ),
                        Text(
                          'reservation'.tr.toUpperCase(),
                          style: AppStyle.texttitleProduct,
                        )
                      ],
                    ),
                    GestureDetector(
                      behavior: HitTestBehavior.translucent,
                      onTap: () {
                        _view_more('reservation'.tr, 31);
                      },
                      child: Row(
                        children: [
                          Text(
                            'more'.tr,
                            style: const TextStyle(
                              color: Color(0xffB7BAC1),
                            ),
                          ),
                          const SizedBox(
                            width: 5.0,
                          ),
                          Container(
                            padding: EdgeInsets.only(right: 10.0),
                            child: SvgPicture.asset(
                              "assets/home/store/icon_xemthem.svg",
                              width: 5,
                            ),
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
            Material(
              elevation: 1,
              color: Colors.white,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Obx(() => Row(
                        children: [
                          Radio(
                              value: true,
                              groupValue:
                              controller.isCarReservation.value,
                              onChanged: (value) {
                                controller.updateIsCarReservation();
                              },
                              activeColor: Color(0xffDFB400)),
                          Text('car'.tr),
                          SizedBox(
                            width: 20,
                          ),
                          Radio(
                              value: false,
                              groupValue:
                              controller.isCarReservation.value,
                              onChanged: (value) {
                                controller.updateIsCarReservation();
                              },
                              activeColor: Color(0xffDFB400)),
                          Text('motorcycle'.tr)
                        ],
                      ))
                    ],
                  ),
                  GestureDetector(
                    behavior: HitTestBehavior.translucent,
                    child: Row(
                      children: [
                        SvgPicture.asset(
                          "assets/home/store/icon_filter.svg",
                          width: 15,
                        ),
                        SizedBox(
                          width: 5,
                        ),
                        Text(
                          'filter'.tr,
                          style: TextStyle(
                            color: Color(0xffB7BAC1),
                          ),
                        ),
                        SizedBox(
                          width: 10,
                        )
                      ],
                    ),
                    onTap: () {
                      _filter_product();
                    },
                  )
                ],
              ),
            )
          ],
        ),

        Obx(()=>LoadingOverlayShimmer(
            isLoadingAPI: controller.isLoadingProduct.value,
            isLoadingDB: false,
            shimmer: ItemSellerShimmer(),
            funcRetry: () => controller.getProductSellerAPI(category_id: 12),
            funcSkip: () => controller.errorGetProduct.value = '',
            error: controller.errorGetProduct.value,
            child: controller.productSellerList.length>0? GridView.builder(
                shrinkWrap: true,
                padding: EdgeInsets.symmetric(horizontal: 5.0.w),
                physics: const NeverScrollableScrollPhysics(),
                gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                    maxCrossAxisExtent: 200,
                    childAspectRatio: 2 / 3.3,
                    crossAxisSpacing: 5,
                    mainAxisSpacing: 5),
                itemCount: controller.productSellerList.length,
                itemBuilder: (BuildContext ctx, index) {
                  return ItemProductWidget(
                    index: index,
                    products: controller.productSellerList,
                  );
                }
            ) : SizedBox(
              height: 30,
              child: Center(
                child: Text('Không có sản phẩm để hiển thị'),
              ),
            )
        ),),
        Divider(),
        Container(
          color: Colors.white,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Material(
                elevation: 1,
                color: Colors.white,
                child: Container(
                  padding: EdgeInsets.only(top: 15.h, left: 10.w, bottom: 15.h),
                  width: ScreenUtil().screenWidth,
                  child: Text(
                    'featured_product'.tr,
                    style: TextStyle(
                        color: Color(0xffDFB400),
                        fontSize: 16,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ),


              Obx(()=>LoadingOverlayShimmer(
                  isLoadingAPI: controller.isLoadingFeatured.value,
                  isLoadingDB: false,
                  funcRetry: () => controller.getProductSellerAPI(category_id: 12),
                  funcSkip: () => controller.errorgetFeatures.value = '',
                  error: controller.errorgetFeatures.value,
                  shimmer: ItemSellerShimmer(),
                  child: controller.productFeaturedSellerList.length>0 ? GridView.builder(
                      shrinkWrap: true,
                      padding: EdgeInsets.symmetric(horizontal: 5.0.w),
                      physics: const NeverScrollableScrollPhysics(),
                      gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                          maxCrossAxisExtent: 200,
                          childAspectRatio: 2 / 3.3,
                          crossAxisSpacing: 5,
                          mainAxisSpacing: 5),
                      itemCount: controller.productFeaturedSellerList.length,
                      itemBuilder: (BuildContext ctx, index) {
                        return ItemProductWidget(
                          index: index,
                          products: controller.productFeaturedSellerList,
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
              Obx(()=>controller.productFeaturedSellerList.length>0
                ? Material(
                elevation: 1,
                color: Colors.white,
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'more'.tr,
                      style: TextStyle(color: AppColors.yellowColor),
                    ),
                    Container(
                      margin: EdgeInsets.all(10.0),
                      child: Icon(
                        Icons.keyboard_arrow_down_sharp,
                        color: AppColors.yellowColor,
                        size: 15,
                      ),
                    )
                  ],
                ),
              ): SizedBox()
              )

            ],
          ),
        )
      ],
    ));
  }

  void _filter_product() {
    Get.toNamed(Routes.FILTER_PRODUCT,
        arguments: {
          'controller': controller
        }
    );
  }

  void _view_more(title, id) {
    Get.toNamed(Routes.PRODUCTS_BY_CATEGORY, arguments: ['reservation', 12, controller.productSellerList]);
  }
}
