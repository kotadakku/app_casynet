import 'package:app_casynet/app/views/theme/textTheme.dart';
import 'package:app_casynet/app/views/widgets/loading_overlay.dart';
import 'package:app_casynet/app/views/widgets/shimmer/seller_shimmer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../../../controller/home/api/seller_controller.dart';
import '../../../../controller/home/radio_controller.dart';
import '../../../../routes/app_pages.dart';
import '../../../theme/app_colors.dart';
import 'items/seller_item.dart';

class StoreWidget extends StatelessWidget {
  StoreWidget({Key? key}) : super(key: key);
  SellerController _sellerController = Get.find();

  @override
  Widget build(BuildContext context) {
    RadioController controller = Get.find();
    return Column(
      mainAxisSize: MainAxisSize.max,
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
                      style: AppTextTheme.titleProduct,
                    )
                  ],
                ),
                GestureDetector(
                  onTap: () {
                    _view_more('store'.tr);
                  },
                  child: Row(
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
                          "assets/images/home/store/icon_xemthem.svg",
                          width: 6.0,
                        ),
                      )
                    ],
                  ),
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
                            _sellerController.getSellersAPI(
                                pageSize: 12,
                                curPage: 1,
                                type_filter: '5');
                            // _sellerController.getSellersAPI(pageSize: '12',cat: '11');
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
                            _sellerController.getSellersAPI(
                                pageSize: 12,
                                curPage: 1,
                                type_filter: '6');
                            // _sellerController.getSellersAPI(pageSize: '12',cat: '12', type_filter: '');
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
                  Get.toNamed(Routes.FILTER_MAP , arguments: [_sellerController.sellerList]);
                },
                child: Row(
                  children: [
                    SvgPicture.asset(
                      "assets/images/home/store/icon_filter.svg",
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
        Obx(() => LoadingOverlay(
            isLoading: _sellerController.isLoadingDB.value,
            shimmer: const ItemSellerShimmer(),
            child: Container(
                padding: EdgeInsets.only(bottom: 20.0.h),
                child: Stack(
                  children: [
                    GridView.builder(
                        shrinkWrap: true,
                        padding: EdgeInsets.symmetric(horizontal: 5.0.w),
                        physics: const NeverScrollableScrollPhysics(),
                        gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                            maxCrossAxisExtent: 200,
                            childAspectRatio: 2 / 2.3,
                            crossAxisSpacing: 5,
                            mainAxisSpacing: 5),
                        itemCount: _sellerController.sellerList.length,
                        itemBuilder: (BuildContext ctx, index) {
                          return ItemSellerWidget(
                            index: index,
                            sellers: _sellerController.sellerList,
                          );
                        }
                      ),
                    _sellerController.error == "" ?
                    SizedBox()
                        : Positioned.fill(
                        child: Container(
                          color: AppColors.kBackgroundColor.withOpacity(0.5),
                          padding: EdgeInsets.only(top: 100),
                          child: Column(
                            children: [
                              Text("${_sellerController.error}",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold
                                ),
                              ),
                              Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  ElevatedButton(
                                    child: Text('Thử lại'),
                                    onPressed: (){
                                      _sellerController.getSellersAPI(pageSize: 12, curPage: 1);
                                    },
                                  ),
                                  SizedBox(width: 10,),
                                  ElevatedButton(
                                    child: Text('Bỏ qua'),
                                    onPressed: (){
                                      _sellerController.error.value = '';
                                    },
                                  )
                                ],
                              )
                            ],
                          ),
                        )
                    ),
                    _sellerController.isLoadingAPI.value ?
                    Positioned.fill(child: Container(
                        color: Colors.grey.withOpacity(0.3),
                        padding: EdgeInsets.only(top: 100),
                        child: Align(
                          alignment: Alignment.topCenter,
                          child: CircularProgressIndicator.adaptive(),
                        )
                    )): SizedBox()
                  ],
                )
            )
        )
        )
      ],
    );
  }

  void _view_more(title) {
    Get.toNamed(Routes.STORE_HOME_MORE, arguments: [title]);
  }
}

