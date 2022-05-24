import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../../../controller/home/api/seller_controller.dart';
import '../../../../controller/home/cuahang_controller.dart';
import '../../../../controller/home/radio_controller.dart';
import '../../../../data/model/seller.dart';
import '../../../../routes/app_pages.dart';
import '../../../theme/app_colors.dart';
import '../../../theme/app_sizes.dart';
import '../../../widgets/image_network_loading.dart';
import '../../../widgets/shimmer/seller_shimmer.dart';
import '../../../widgets/shimmer_loading.dart';
import 'items/seller_item.dart';

class StoreWidget extends StatelessWidget {
  StoreWidget({Key? key}) : super(key: key);
  SellerController _sellerController = Get.find();

  @override
  Widget build(BuildContext context) {
    RadioController controller = Get.find();
    return Container(
      color: Colors.white,
      child: Column(
        children: [
          Material(
            elevation: 2,
            child: Padding(
              padding: EdgeInsets.symmetric(vertical: 10.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Container(
                        padding: EdgeInsets.only(left: 15.0.w, right: 15.0),
                        child: CircleAvatar(
                          child: Text(
                            "123",
                            style: TextStyle(color: Colors.white),
                          ),
                          backgroundColor: Color(0xffDFB400),
                        ),
                      ),
                      Text(
                        'store'.tr.toUpperCase(),
                        style: TextStyle(
                            color: Color(0xffDFB400),
                            fontSize: 18.sp,
                            fontWeight: FontWeight.bold),
                      )
                    ],
                  ),
                  Row(
                    children: [
                      Text(
                        'more'.tr,
                        style: TextStyle(
                          color: Color(0xffB7BAC1),
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.only(left: 10.0, right: 10.0.w),
                        child: SvgPicture.asset(
                          "assets/home/store/icon_xemthem.svg",
                          width: 6.0,
                        ),
                      )
                    ],
                  )
                ],
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(right: 10.0.w),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Obx(() => Row(
                          children: [
                            Radio(
                                value: true,
                                groupValue: controller.isCarStore.value,
                                onChanged: (value) {
                                  controller.updateIsCarStore();
                                  _sellerController.getSellersAPI(pageSize: '12',cat: '11');
                                },
                                activeColor: Color(0xffDFB400)),
                            Text("Ô tô"),
                            SizedBox(
                              width: 20,
                            ),
                            Radio(
                                value: false,
                                groupValue: controller.isCarStore.value,
                                onChanged: (value) {
                                  controller.updateIsCarStore();
                                  _sellerController.getSellersAPI(pageSize: '12',cat: '12');
                                },
                                activeColor: Color(0xffDFB400)),
                            Text("Xe máy")
                          ],
                        ))
                  ],
                ),
                GestureDetector(
                  behavior: HitTestBehavior.translucent,
                  onTap: () {
                    Get.toNamed(Routes.FILTER_MAP);
                  },
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
                    ],
                  ),
                )
              ],
            ),
          ),
          controller.isCarStore.value == true
              ? _sellerController.obx(
                  (state) => Container(
                        padding: EdgeInsets.only(bottom: 20.0.h),
                        child: state.isEmpty
                            ? Text("Không có cửa hàng để hiển thị")
                            : Wrap(
                                spacing: 5.0.w,
                                runSpacing: 10.0,
                                children: (state as List)
                                    .map((e) => ItemCuaHangWidget(
                                          store: e,
                                        ))
                                    .toList()),
                      ),
                  onLoading: ItemCuaHangShimmer(),
                  onError: (error) => InkWell(
                        onTap: () {},
                        child: Text("Tải lại"),
                      )
                  /*ElevatedButton(onPressed: (){}, child: Text("Thử Lại"))*/
                  )
              : _sellerController.obx(
                  (state) => Container(
                        padding: EdgeInsets.only(bottom: 20.0.h),
                        child: state.isEmpty
                            ? Text("Không có cửa hàng để hiển thị")
                            : Wrap(
                                spacing: 5.0.w,
                                runSpacing: 10.0,
                                children: (state as List)
                                    .map((e) => ItemCuaHangWidget(
                                          store: e,
                                        ))
                                    .toList()),
                      ),
                  onLoading: ItemCuaHangShimmer(),
                  onEmpty: SizedBox(
                    height: 100,
                    child: Column(
                      children: [
                        Text("Tải dữ liệu thất bại!!"),
                        InkWell(
                          onTap: () {
                            print('Tải lại');
                          },
                          child: Text("Tải lại"),
                        )
                      ],
                    ),
                  ),
                  onError: (error) => Column(
                    children: [
                      Text('$error'),
                      InkWell(
                        onTap: () {
                          print('Tải lại');
                        },
                        child: Text("Tải lại"),
                      )
                      /*ElevatedButton(onPressed: (){}, child: Text("Thử Lại"))*/
                    ],
                  )
                  ),

          _sellerController.obx((state) =>
              Container(
                padding: EdgeInsets.only(bottom: 20.0.h),
                child: state.isEmpty ? Text("Không có cửa hàng để hiển thị")
                    : Wrap(
                    spacing: 5.0.w,
                    runSpacing: 10.0,
                    children: (state as List) .map((e) =>
                        ItemSellerWidget(
                          store: e,
                        ))
                        .toList()),
              ),
            onLoading: ItemSellerShimmer(),
          ),

        ],
      ),
    );
  }
}

class ItemCuaHangWidget extends StatelessWidget {
  final Seller store;

  const ItemCuaHangWidget({Key? key, required this.store}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    CuaHangController controller = Get.put(CuaHangController());
    return LayoutBuilder(builder: (context, constraints) {
      var divide = constraints.maxWidth > 785 ? 3 : 2;
      return Container(
        width: (1 / divide).sw - 7.5.w,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            GestureDetector(
                onTap: () {
                  if (store != null)
                    Get.toNamed(Routes.STORE_DETAIL,
                        arguments: {'store': store});
                  FocusScope.of(context).unfocus();
                },
                child: Container(
                  height: 120.w,
                  width: (1 / divide).sw - 7.5.w,
                  child: ImageNetworkLoading(
                    image_url: store.avatar_image.toString(),
                    fit: BoxFit.fill,
                  ),
                )),
            Container(
              padding: EdgeInsets.all(5.0),
              color: Color(0xffEFF1FC),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Icon(
                        Icons.thumb_up_alt_rounded,
                        color: kTextColor_gray,
                        size: IconSize.iconSize,
                      ),
                      SizedBox(
                        width: 2,
                      ),
                      Text(
                          this.store.likeQty == null
                              ? '0'
                              : store.likeQty.toString(),
                          style: TextStyle(fontSize: 13))
                    ],
                  ),
                  Row(
                    children: [
                      FaIcon(
                        FontAwesomeIcons.comment,
                        size: IconSize.iconSize,
                        color: kTextColor_gray,
                      ),
                      SizedBox(
                        width: 2,
                      ),
                      Text(
                          store.commentQty == null
                              ? '0'
                              : store.commentQty.toString(),
                          style: TextStyle(fontSize: 13))
                    ],
                  ),
                  Row(
                    children: [
                      Text(store.rate == null ? '0.0' : store.rate.toString(),
                          style: TextStyle(fontSize: 15)),
                      SizedBox(
                        width: 2,
                      ),
                      Icon(
                        Icons.star_outlined,
                        color: kTextColor_gray,
                        size: 12,
                      ),
                    ],
                  )
                ],
              ),
            ),
            SizedBox(
              height: 10.0.h,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: GestureDetector(
                    onTap: () {
                      if (store != null)
                        Get.toNamed(Routes.STORE_DETAIL,
                            arguments: {'store': store});
                      FocusScope.of(context).unfocus();
                    },
                    child: Text(
                      store.name.toString(),
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(fontSize: 15.sp),
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    controller.callPhone(store.phone.toString());
                  },
                  child: Container(
                    padding: EdgeInsets.all(5.0),
                    child: FaIcon(
                      FontAwesomeIcons.phoneFlip,
                      color: kTextColor_gray,
                      size: IconSize.iconSize,
                    ),
                  ),
                )
              ],
            ),
            SizedBox(
              height: 10.0.h,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      FaIcon(
                        FontAwesomeIcons.mapLocationDot,
                        color: kTextColor_gray,
                        size: 15,
                      ),
                      SizedBox(
                        width: 3.0.w,
                      ),
                      Expanded(
                          child: Text(
                        store.address == null
                            ? 'Chưa có thông tin'
                            : store.address.toString(),
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(fontSize: 12.sp),
                      ))
                    ],
                  ),
                ),
                Row(
                  children: [
                    FaIcon(
                      FontAwesomeIcons.locationArrow,
                      color: kTextColor_gray,
                      size: 15.0,
                    ),
                    SizedBox(
                      width: 3,
                    ),
                    Text(
                      "${store.distance == null ? 0.0 : store.distance} km",
                      style: TextStyle(fontSize: 12.sp),
                    )
                  ],
                ),
              ],
            ),
          ],
        ),
      );
    });
  }
}

class ItemCuaHangShimmer extends StatelessWidget {
  const ItemCuaHangShimmer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Wrap(
          spacing: 5.0.w,
          runSpacing: 10.0,
          children: List.generate(
              12,
              (index) => Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ShimmerLoading(
                        isLoading: true,
                        child: Container(
                          height: 120.w,
                          width: 0.5.sw - 7.5.w,
                          margin: EdgeInsets.only(bottom: 5.h),
                          decoration: BoxDecoration(
                            color: Colors.grey,
                            borderRadius: BorderRadius.circular(16.0),
                          ),
                        ),
                      ),
                      ShimmerLoading(
                        isLoading: true,
                        child: Container(
                          height: 12,
                          margin: EdgeInsets.only(bottom: 5.h),
                          width: 0.5.sw - 7.5.w,
                          decoration: BoxDecoration(
                            color: Colors.grey,
                            borderRadius: BorderRadius.circular(16.0),
                          ),
                        ),
                      ),
                      ShimmerLoading(
                        isLoading: true,
                        child: Container(
                          height: 12,
                          margin: EdgeInsets.only(bottom: 5.h),
                          width: 0.2.sw - 7.5.w,
                          decoration: BoxDecoration(
                            color: Colors.grey,
                            borderRadius: BorderRadius.circular(16.0),
                          ),
                        ),
                      ),
                      ShimmerLoading(
                        isLoading: true,
                        child: Container(
                          height: 12,
                          margin: EdgeInsets.only(bottom: 5.h),
                          width: 0.3.sw - 7.5.w,
                          decoration: BoxDecoration(
                            color: Colors.grey,
                            borderRadius: BorderRadius.circular(16.0),
                          ),
                        ),
                      ),
                    ],
                  ))),
    );
  }
}
