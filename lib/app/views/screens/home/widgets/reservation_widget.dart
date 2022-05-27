
import 'package:app_casynet/app/views/widgets/loading_overlay.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../../../controller/home/api/reservation_controller.dart';
import '../../../../controller/home/radio_controller.dart';
import '../../../../routes/app_pages.dart';
import '../../../theme/textTheme.dart';
import '../../../widgets/shimmer/seller_shimmer.dart';
import 'items/product_item.dart';

class ReservationWidget extends StatelessWidget {
  ReservationWidget({Key? key}) : super(key: key);
  ReservationController _ReservationController = Get.find();

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
                          'reservation'.tr.toUpperCase(),
                          style: AppTextTheme.titleProduct,
                        )
                      ],
                    ),
                    GestureDetector(
                      behavior: HitTestBehavior.translucent,
                      onTap: (){
                        _view_more('reservation'.tr, 31);
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
                            groupValue: controller.isCarReservation.value,
                            onChanged: (value) {
                              controller.updateIsCarReservation();
                            },
                            activeColor: Color(0xffDFB400)),
                        Text("Ô tô"),
                        SizedBox(
                          width: 20,
                        ),
                        Radio(
                            value: false,
                            groupValue: controller.isCarReservation.value,
                            onChanged: (value) {
                              controller.updateIsCarReservation();
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
                      SvgPicture.asset("assets/home/store/icon_filter.svg", width: 15,),
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
            Obx(()=>
              LoadingOverlay(
                isLoading: _ReservationController.isLoadingDB.value,
                shimmer: ItemSellerShimmer(),
                child: Stack(
                  children: [
                    Padding(padding: EdgeInsets.only(bottom: 15.h),
                        child: _ReservationController.error == ''?
                        Wrap(
                          spacing: 5.0.w,
                          runSpacing: 10.0,
                          children: (_ReservationController.reservationProductList as List).map((e) =>
                              ItemProductWidget(
                                product: e
                              ),
                          ).toList(),
                        ): Column(
                          children: [
                            Text("${_ReservationController.error}"),
                            ElevatedButton(
                              child: Text('Thử lại'),
                              onPressed: (){
                                _ReservationController.getReservationProductsAPI();
                              },
                            )
                          ],
                        ),
                    ),
                    _ReservationController.isLoadingAPI.value ?
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
            )
          ],
        ),
      ),
    );
  }
  void _filter_product() {
    Get.toNamed(Routes.FILTER_PRODUCT, arguments: {
      'controller': _ReservationController
    });
  }

  void _view_more(title, id) {
    Get.toNamed(Routes.PRODUCTS_BY_CATEGORY, arguments: [title, id ]);
  }
}


class ItemSale extends StatelessWidget {
  final Color color;
  final double width;
  final int? sale;
  const ItemSale({Key? key, required this.color, required this.width, required this.sale}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 25,
      width: width,
      child: Stack(
        children: [
          ClipRRect(
          borderRadius: BorderRadius.circular(3.0),
            child: Stack(
              children: [
                SvgPicture.asset("assets/home/sale.svg", height: 20, fit: BoxFit.fitHeight, width: 25, color: color,),
                Positioned.fill(
                    child: Center(
                      child: Text("-$sale %",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 13
                        ),
                      ),
                    )
                ),
              ],
            )
          ),

          Positioned(
            bottom : 0.5,
            right: 4,
            child: SvgPicture.asset("assets/home/rect_sale.svg", height: 5, color: color,
            ),
          ),
        ],
      ),
    );
  }
}



