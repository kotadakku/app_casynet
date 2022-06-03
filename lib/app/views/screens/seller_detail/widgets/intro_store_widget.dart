import 'package:app_casynet/app/views/widgets/shimmer/seller_shimmer.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
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
  HomeController _homeController = Get.find();

  @override
  Widget build(BuildContext context) {
    var isReadMore = false.obs;

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
            Text("Giờ mở cửa  "),
            controller.store.value.timeOpen == 'null' ||
                    controller.store.value.timeClose == 'null'
                ? Text("Đang tải ...")
                : Text(
                    "${controller.store.value.timeOpen}  -  ${controller.store.value.timeClose}",
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
            Text("Điện thoại  "),
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
                        controller.store.value.totalProduct.toString() ==
                                'null'
                            ? Text("Đang tải ...")
                            : Text(
                                controller.store.value.totalProduct.toString(),
                                style: TextStyle(
                                    color: AppColors.yellowColor,
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold),
                              )
                      ],
                    ),
                    Text(
                      "Sản phẩm",
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
                          "145",
                          style: TextStyle(
                              color: AppColors.yellowColor,
                              fontSize: 16,
                              fontWeight: FontWeight.bold),
                        )
                      ],
                    ),
                    Text(
                      "Giao dịch",
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
                          "75%",
                          style: TextStyle(
                              color: AppColors.yellowColor,
                              fontSize: 16,
                              fontWeight: FontWeight.bold),
                        )
                      ],
                    ),
                    Text(
                      "Tỷ lệ phản hồi",
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
              Text("Tham gia: "),
              Text(
                controller.store.value.participationTime ??
                    'Chưa có thông tin',
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
                    controller.store.value.rate.toString(),
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  Text(" Chất lượng")
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
                  Text("Báo xấu: "),
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
                "Giới thiệu cửa hàng",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
            // Padding(
            //   padding: EdgeInsets.symmetric(horizontal: 10.0.w),
            //   child: Obx(()=> AnimatedSize(
            //       duration: const Duration(milliseconds: 300),
            //       child: ConstrainedBox(
            //           constraints: isReadMore.value
            //               ? const BoxConstraints()
            //               : const BoxConstraints(maxHeight: 70),
            //           child: controller.store.intro_store.toString() == 'null' ? Text("Đang tải...") : Text(
            //             controller.store.intro_store.toString(),
            //             style: const TextStyle(fontSize: 16),
            //             softWrap: true,
            //             overflow: TextOverflow.fade,
            //           )))),
            // ),

            GestureDetector(
                behavior: HitTestBehavior.translucent,
                onTap: () {
                  isReadMore.value = !isReadMore.value;
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
                            isReadMore.value ? "Xem thêm" : "Ẩn bớt",
                            style: TextStyle(color: AppColors.yellowColor),
                          )),
                      Container(
                        margin: EdgeInsets.all(5.0),
                        child: Obx(() => Icon(
                              isReadMore.value
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
        Container(
          color: Colors.white,
          child: Column(
            children: [
              Material(
                elevation: 2,
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
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Obx(() => Row(
                            children: [
                              Radio(
                                  value: true,
                                  groupValue:
                                  _homeController.isCarReservation.value,
                                  onChanged: (value) {
                                    _homeController.updateIsCarReservation();
                                  },
                                  activeColor: Color(0xffDFB400)),
                              Text("Ô tô"),
                              SizedBox(
                                width: 20,
                              ),
                              Radio(
                                  value: false,
                                  groupValue:
                                  _homeController.isCarReservation.value,
                                  onChanged: (value) {
                                    _homeController.updateIsCarReservation();
                                  },
                                  activeColor: Color(0xffDFB400)),
                              Text("Xe máy")
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
              controller.obx(
                (state) => Padding(
                    padding: EdgeInsets.only(bottom: 15.h),
                    child: state.isEmpty
                        ? Text("Không có sẳn phẩm nào để hiển thi")
                        : Wrap(
                            spacing: 5.0.w,
                            runSpacing: 10.0,
                            children: (state as List)
                                .map(
                                  (e) => ItemProductWidget(
                                      products: state,
                                    index:1,

                                  ),
                                )
                                .toList(),
                          )),
                onLoading: ItemSellerShimmer(),
                onEmpty: Text('Không có sản phẩm nào để hiển thị'),
              )
            ],
          ),
        ),

        Container(
          color: AppColors.backgroundColor,
          height: 10,
        ),
        Container(
          color: Colors.white,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Material(
                elevation: 5,
                color: Colors.white,
                child: Container(
                  padding: EdgeInsets.only(top: 15.h, left: 10.w, bottom: 15.h),
                  width: ScreenUtil().screenWidth,
                  child: Text(
                    'Sản phẩm nổi bật',
                    style: TextStyle(
                        color: Color(0xffDFB400),
                        fontSize: 16,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              controller.obx((state) => Padding(
                    padding: EdgeInsets.only(bottom: 15.h),
                    child: state.isEmpty
                        ? Center(child: CircularProgressIndicator(),)
                        : Wrap(
                            spacing: 5.0.w,
                            runSpacing: 10.0,
                            children: controller.productFeaturedSellerList.map(
                              (e) {
                                return GestureDetector(
                                  child: ItemProductWidget(
                                    products: controller.productFeaturedSellerList,
                                    index: 1,
                                  ),
                                  onTap: () {
                                    Get.toNamed(Routes.PRODUCT_DETAIL);
                                  },
                                );
                              },
                            ).toList()),
                  )),
              Material(
                elevation: 1,
                color: Colors.white,
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Xem thêm",
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
              ),
            ],
          ),
        )
      ],
    ));
  }

  void _filter_product() {
    Get.toNamed(Routes.FILTER_PRODUCT, arguments: {'controller': controller});
  }

  void _view_more(title, id) {
    Get.toNamed(Routes.PRODUCTS_BY_CATEGORY, arguments: [title, id]);
  }
}
