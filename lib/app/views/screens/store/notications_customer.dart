
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '../../../controller/store/datetime_range_controller.dart';
import '../../theme/app_colors.dart';
import 'new_notications.dart';


class NotificationCustomer extends StatelessWidget {
  NotificationCustomer({Key? key}) : super(key: key);

  var arrThongBao = [].obs;

  @override
  Widget build(BuildContext context) {
    final DateTimeRangeController ThongBaoController =
    Get.put(DateTimeRangeController());
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        // elevation: 5.0,
        backgroundColor: Colors.white,
        leading: InkWell(
          onTap: (){
            Get.back();
          },
          child: Icon(
            Icons.arrow_back,
          ),
        ),
        title: Text("Thông báo tới khách hàng",),
        actions: [
          InkWell(
              onTap: (){
                Get.to(AddNotication());
              },
              child: Container(margin: EdgeInsets.only(right: 10.0.w),
                child: Icon(CupertinoIcons.add_circled, ),)
          ),

        ],
      ),
      body:SingleChildScrollView(
        child:Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              color: Color.fromARGB(255, 241, 243, 253),
              padding: EdgeInsets.all(10.0),
              height: 70.0,
              child: Row(
                mainAxisAlignment:
                MainAxisAlignment.spaceBetween,
                children: [
                  Obx(
                        () =>
                        Text(
                          "${'from'.tr} : " +
                              DateFormat("dd/MM/yyyy")
                                  .format(ThongBaoController
                                  .dateRange
                                  .value
                                  .start)
                                  .toString(),
                          style: TextStyle(fontSize: 15),
                        ),
                  ),
                  Obx(
                        () =>
                        Text(
                          "Đến : " +
                              DateFormat("dd/MM/yyyy")
                                  .format(ThongBaoController
                                  .dateRange
                                  .value
                                  .end)
                                  .toString(),
                          style: TextStyle(fontSize: 15),
                        ),
                  ),
                  InkWell(
                    splashColor: Color.fromARGB(
                        255, 188, 195, 216),
                    onTap: () {
                      ThongBaoController.chooseDateRangePicker();
                    },
                    child: Row(
                      mainAxisAlignment:
                      MainAxisAlignment.end,
                      children: [
                        Icon(Icons.filter_alt_outlined),
                      ],
                    ),
                  ),
                ],
              ),


            ),
            ListView.builder(
              itemCount: 6,
              shrinkWrap: true,
              itemBuilder: (context, i) {
                return Column(
                  children: [
                    Container(
                      height: 100.h,
                      // width: MediaQuery.of(context).size.width,
                      margin: EdgeInsets.only(left: 10.0.w,right: 10.0.w, top: 5.0.h,bottom: 5.0.h ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text("Đặt nhanh khuyến mãi lớn"),
                              PopupMenuButton(
                                  elevation: 20,//độ nổi của nút
                                  enabled: true, //đươc kích hoạt
                                  offset: const Offset(0, 0),// vị trí hiện nút

                                  child: const Icon(
                                    Icons.more_horiz,
                                    color: AppColors.textGrayColor,
                                  ),
                                  onSelected: (value) {
                                    switch (value) {
                                      case 'product':
                                        Get.toNamed(
                                            '/product/seen_product');
                                        break;
                                      case 'account':
                                        Get.toNamed(
                                            '/account/login');
                                    }
                                  },
                                  itemBuilder:
                                      (context) => [
                                    PopupMenuItem(
                                      child:
                                      Row(
                                        children: [
                                          Container(
                                            child:
                                            Image.asset(
                                              "assets/images/store/ic_trash.png",
                                              color: AppColors.textGrayColor,
                                              width: 20,
                                              height: 20,
                                            ),
                                            padding:
                                            const EdgeInsets.only(bottom: 15, right: 10),
                                          ),
                                          Expanded(
                                              child: Column(
                                                mainAxisAlignment:
                                                MainAxisAlignment.start,
                                                crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                                children: [
                                                  Text('delete'.tr,
                                                    style: TextStyle(color: AppColors.textGrayColor),
                                                  ),
                                                  Divider(
                                                    color: AppColors.textGrayColor,
                                                    height: 20,
                                                    thickness: 1,
                                                  ),
                                                ],
                                              ))
                                        ],
                                      ),
                                      value:
                                      "product",
                                    ),
                                    PopupMenuItem(
                                      child:
                                      Row(
                                        children: [
                                          Container(
                                            child:
                                            Image.asset(
                                              "assets/images/store/ic_edit.png",
                                              color: AppColors.textGrayColor,
                                              width: 20,
                                              height: 20,
                                            ),
                                            padding:
                                            const EdgeInsets.only(bottom: 15, right: 10),
                                          ),
                                          Expanded(
                                              child: Column(
                                                mainAxisAlignment:
                                                MainAxisAlignment.start,
                                                crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                                children: [
                                                  Text(
                                                    'edit'.tr,
                                                    style: TextStyle(color: AppColors.textGrayColor),
                                                  ),
                                                  Divider(
                                                    color: AppColors.textGrayColor,
                                                    height: 20,
                                                    thickness: 1,
                                                  ),
                                                ],
                                              ))
                                        ],
                                      ),
                                      value:
                                      "account",
                                    ),
                                  ])
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [Text("000001", style: TextStyle(color: AppColors.textGrayColor),),],),
                          Row(mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text("Đã gửi: 15:00 17/03/2022", style: TextStyle(color: AppColors.textGrayColor), )
                          ],
                          )

                        ],
                      ),
                    ),
                    Divider(height: 5,)
                  ],
                );
              }
              ,)
          ],
        ),
      ),
    );
  }
}
