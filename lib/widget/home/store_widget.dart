import 'package:app_casynet/controller/cuahang_controller.dart';
import 'package:app_casynet/data/model/cuahang.dart';
import 'package:app_casynet/routes/app_pages.dart';
import 'package:app_casynet/theme/app_sizes.dart';
import 'package:app_casynet/widget/loading_overlay.dart';
import 'package:app_casynet/widget/shimmer_loading.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../theme/app_colors.dart';
import '../image_network_loading.dart';

/* */
class StoreWidget extends StatelessWidget {
  StoreWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
                        "Cửa hàng".toUpperCase(),
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
                        "Xem thêm",
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
                    GetBuilder<CuaHangController>(
                        init: CuaHangController(),
                        builder: (controller){
                          return Row(
                            children: [
                              Radio(
                                  value: true,
                                  groupValue:
                                  controller.isCar,
                                  onChanged: (value) {
                                    controller.updateIsCar(controller.isCar);
                                    controller.updateAPI();
                                  },
                                  activeColor: Color(0xffDFB400)),
                              Text("Ô tô"),
                              SizedBox(
                                width: 20,
                              ),
                              Radio(
                                  value: false,
                                  groupValue: controller.isCar,
                                  onChanged: (value) {
                                    controller.updateIsCar(controller.isCar);
                                    controller.updateAPI();
                                  },
                                  activeColor: Color(0xffDFB400)),
                              Text("Xe máy")
                            ],
                          );
                        })
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
                        "Lọc",
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


          GetBuilder<CuaHangController>(
            init: CuaHangController(),
            builder: (controller) {
              return LoadingOverlay(
                isLoading: controller.isLoadStore,
                shimmer: ItemCuaHangShimmer(),
                child: Container(
                padding: EdgeInsets.only(bottom: 20.0.h),
                child: Wrap(
                    spacing: 5.0.w,
                    runSpacing: 10.0,
                    children: controller.cuahangList.map((e) =>
                        ItemCuaHangWidget(
                          store: e,
                        ))
                        .toList()),
              ),
              );
            }
          )
        ],
      ),
    );
  }
}

class ItemCuaHangWidget extends StatelessWidget {
 final CuaHang store;

  const ItemCuaHangWidget({
    Key? key,
    required this.store
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    CuaHangController controller = Get.put(CuaHangController());
    return Container(
      width: 0.5.sw -7.5.w,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          GestureDetector(
            onTap: () {
              if (store != null) Get.toNamed(
                  Routes.STORE_DETAIL, arguments: { 'store': store});
              FocusScope.of(context).unfocus();
            },
            child: Container(
              height: 120.w,
              width:  0.5.sw - 7.5.w,
              child: ImageNetworkLoading(
                image_url: store.anhsanpham.toString(),
                fit: BoxFit.fill,
              ),
            )
          ),
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
                    Text(store.slthich.toString(), style: TextStyle(fontSize: 13))
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
                    Text(store.slbinhluan.toString(),
                        style: TextStyle(fontSize: 13))
                  ],
                ),
                Row(
                  children: [
                    Text(store.slchiase.toString(),
                        style: TextStyle(fontSize: 15)
                    ),
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
                    if (store != null) Get.toNamed(
                        Routes.STORE_DETAIL, arguments: { 'store': store});
                    FocusScope.of(context).unfocus();
                  },
                  child: Text(
                    store.tencuahang.toString(),
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                        fontSize: 15.sp
                    ),
                  ),
                ),
              ),
              GestureDetector(

                onTap: (){
                  controller.callPhone(store.sodienthoai.toString());
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
                          store.diachicuahang.toString(),
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
                    "${store.khoangcachtoicuahang} km",
                    style: TextStyle(fontSize: 12.sp),
                  )
                ],
              ),
            ],
          ),
        ],
      ),
    );
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
          children:  List.generate(12, (index) => Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ShimmerLoading(isLoading: true,
                child: Container(
                  height: 120.w,
                  width:  0.5.sw - 7.5.w,
                  margin: EdgeInsets.only(bottom: 5.h),
                  decoration: BoxDecoration(
                    color: Colors.grey,
                    borderRadius: BorderRadius.circular(16.0),
                  ),
                ),
              ),
              ShimmerLoading(isLoading: true,
                child: Container(
                  height: 12,
                  margin: EdgeInsets.only(bottom: 5.h),
                  width:  0.5.sw - 7.5.w,
                  decoration: BoxDecoration(
                    color: Colors.grey,
                    borderRadius: BorderRadius.circular(16.0),
                  ),
                ),
              ),
              ShimmerLoading(isLoading: true,
                child: Container(
                  height: 12,
                  margin: EdgeInsets.only(bottom: 5.h),
                  width:  0.2.sw - 7.5.w,
                  decoration: BoxDecoration(
                    color: Colors.grey,
                    borderRadius: BorderRadius.circular(16.0),
                  ),
                ),
              ),
              ShimmerLoading(isLoading: true,
                child: Container(
                  height: 12,
                  margin: EdgeInsets.only(bottom: 5.h),
                  width:  0.3.sw - 7.5.w,
                  decoration: BoxDecoration(
                    color: Colors.grey,
                    borderRadius: BorderRadius.circular(16.0),
                  ),
                ),
              ),
            ],
          )
          )
      ),
    );
  }
}

