
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';


import '../../../../controller/store_detail/detail_store_controller.dart';
import '../../../../routes/app_pages.dart';
import '../../home/widgets/reservation_widget.dart';
import '../../../theme/app_colors.dart';
import '../../../theme/app_sizes.dart';
import '../../../widgets/loading_overlay.dart';
import 'gift_store_widget.dart';

class IntroStoreWidget extends StatelessWidget {
  IntroStoreWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var isReadMore = false.obs;

    return SingleChildScrollView(
      child: GetBuilder<DetailStoreController>(
        init: DetailStoreController(),
        builder: (controller){
          return LoadingOverlay(
            isLoading: controller.isLoading,
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
                        child: Icon(Icons.watch_later, size: sizeIcon.width, color: kYellowColor,),
                      )
                  ),

                  Text("Giờ mở cửa  "),
                  controller.store.time_open == 'null' ||  controller.store.time_close == 'null' ? Text("Đang tải ...") :
                  Text("${controller.store.time_open}  -  ${controller.store.time_close}",
                    style: TextStyle(
                        fontWeight: FontWeight.bold
                    ),
                  ),

                ],
              ),
              Row(
                children: [
                  Container(
                      margin: EdgeInsets.only(left: 10.0.w, top: 5.0.h, bottom: 5.0.h),
                      child: Padding(
                        padding: EdgeInsets.only(right: 5.0.w),
                        child: Icon(Icons.phone, size: sizeIcon.width, color: kYellowColor,),
                      )
                  ),
                  Text("Điện thoại  "),
                  Text(controller.store.sodienthoai.toString(),
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
                      margin: EdgeInsets.only(left: 10.0.w, top: 5.0.h, bottom: 5.0.h),
                      child: Padding(
                        padding: EdgeInsets.only(right: 5.0.w),
                        child: Icon(Icons.location_on_rounded, color: kYellowColor,size: sizeIcon.width,),
                      )
                  ),

                  Expanded(child: Text(controller.store.diachicuahang.toString()),)
                ],
              ),
              //Thống kê
              Container(
                padding: EdgeInsets.all(10.0.w),
                child: DottedBorder(
                  color: kYellowColor,
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
                              Icon(Icons.add, color: kYellowColor,),
                              controller.store.product_count.toString() == 'null'? Text("Đang tải ..."):
                              Text(controller.store.product_count.toString(), style: TextStyle(
                                  color: kYellowColor,
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold
                              ),)
                            ],
                          ),
                          Text("Sản phẩm",
                            style: TextStyle(
                                color: kTextColor,
                                fontSize: 18
                            ),
                          )

                        ],
                      ),
                      Column(
                        children: [
                          Row(
                            children: [
                              Icon(Icons.add, color: kYellowColor,),
                              Text("145", style: TextStyle(
                                  color: kYellowColor,
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold
                              ),)
                            ],
                          ),
                          Text("Giao dịch",
                            style: TextStyle(
                                color: kTextColor,
                                fontSize: 18
                            ),
                          )

                        ],
                      ),
                      Column(
                        children: [
                          Row(
                            children: [
                              Icon(Icons.add, color: kYellowColor,),
                              Text("75%", style: TextStyle(
                                  color: kYellowColor,
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold
                              ),)
                            ],
                          ),
                          Text("Tỷ lệ phản hồi",
                            style: TextStyle(
                                color: kTextColor,
                                fontSize: 18
                            ),
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
                      child: Icon(Icons.add, color: kYellowColor, size: sizeIcon.width,),
                    ),
                    Text("Tham gia: "),
                    Text("3 năm",
                      style: TextStyle(
                          fontWeight: FontWeight.bold
                      ),
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
                        Icon(Icons.star_outlined , size: sizeIcon.width, color: kYellowColor,),
                        Icon(Icons.star_outlined , size: sizeIcon.width, color: kYellowColor,),
                        Icon(Icons.star_outlined , size: sizeIcon.width, color: kYellowColor,),
                        Icon(Icons.star_outlined , size: sizeIcon.width, color: kYellowColor,),
                        Icon(Icons.star_outlined , size: sizeIcon.width, color: kYellowColor,),
                        SizedBox(width: 10),
                        Text(controller.store.slchiase.toString(),
                          style: TextStyle(
                              fontWeight: FontWeight.bold
                          ),
                        ),
                        Text(" Chất lượng")
                      ],
                    ),
                    Row(
                      children: [
                        Container(
                          margin: EdgeInsets.all(5.0),
                          child: Icon(Icons.add, color: kYellowColor, size: sizeIcon.width,),
                        ),
                        Text("Báo xấu: "),
                        Text("3",
                          style: TextStyle(
                              fontWeight: FontWeight.bold
                          ),
                        )
                      ],
                    )

                  ],
                ),
              ),
              SizedBox(height: 20,),
              // Giới thiệu cửa hàng
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 10.0.w),
                    child: Text("Giới thiệu cửa hàng",
                      style: TextStyle(
                          fontWeight: FontWeight.bold
                      ),
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
                      onTap: (){
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
                            Obx(()=>Text(isReadMore.value ? "Xem thêm": "Ẩn bớt",
                              style: TextStyle(
                                  color: kYellowColor
                              ),
                            )),
                            Container(
                              margin: EdgeInsets.all(5.0),
                              child: Obx(()=>Icon(isReadMore.value ? Icons.keyboard_arrow_down_sharp : Icons.keyboard_arrow_up_sharp, color: kYellowColor,)),
                            ),
                          ],
                        ),
                      )
                  )

                ],
              ),
              Container(
                color: kBackgroundColor,
                height: 10,
              ),
              ReservationWidget(),
              Container(
                color: kBackgroundColor,
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
                      child: Container(padding: EdgeInsets.only(top: 15.h, left: 10.w, bottom: 15.h),
                        width: ScreenUtil().screenWidth,
                        child: Text(
                          'Sản phẩm nổi bật',
                          style: TextStyle(
                              color: Color(0xffDFB400),
                              fontSize: 16,
                              fontWeight: FontWeight.bold
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 10,),

                    // GetBuilder<DetailStoreController>(
                    //   init: DetailStoreController(),
                    //   builder: (controller){
                    //     if(controller.products.length >0) return Wrap(
                    //       spacing: 5.0.w,
                    //       runSpacing: 10.0,
                    //       children: controller.products.map((e) {
                    //         return GestureDetector(
                    //           child: ItemProductWidget(
                    //               product: e,
                    //           ),
                    //           onTap: (){
                    //             Get.toNamed(Routes.PRODUCT_DETAIL);
                    //           },
                    //         );
                    //       },).toList()
                    //     );
                    //     else return CircularProgressIndicator();
                    // }
                    // ),
                    Material(
                      elevation: 1,
                      color: Colors.white,
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text("Xem thêm", style: TextStyle(
                              color: kYellowColor
                          ),),
                          Container(
                            margin: EdgeInsets.all(10.0),
                            child: Icon(Icons.keyboard_arrow_down_sharp, color: kYellowColor, size: 15,),
                          )
                        ],
                      ),
                    ),

                  ],
                ),
              )
            ],
          )
          );
        },
      )
    );
  }
}
