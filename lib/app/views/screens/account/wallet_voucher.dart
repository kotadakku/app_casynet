
import 'package:app_casynet/app/controller/account/api/voucher_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../../controller/account/wallet_voucher_controller.dart';
import '../../widgets/appbar/appbar_account_widget.dart';
import '../../theme/app_colors.dart';


class WalletVoucherPage extends StatelessWidget {
  WalletVoucherPage({Key? key}) : super(key: key);
  VoucherController _voucherController = Get.find();

  @override
  Widget build(BuildContext context) {
    final WalletVoucherController _tabx = Get.find<WalletVoucherController>();
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBarAccountWidget(),
      body: SafeArea(
        child: Column(
          children: [
            Container(
              color: AppColors.backgroundColor,
              padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 10.h),
              child: Row(
                children: [
                  Text(
                    'wallet_voucher'.tr,
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
                  ),
                  SizedBox(
                    width: 10.w,
                  ),
                  Expanded(
                    child: Container(
                      height: 35,
                      margin: EdgeInsets.all(5.0),
                      child: TextField(
                        cursorColor: AppColors.textGrayColor,
                        style: TextStyle(
                          color: AppColors.textGrayColor,
                          fontSize: 14
                        ),
                        decoration: InputDecoration(
                            filled: true,
                            fillColor: Colors.white,
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(5.0),
                              borderSide: BorderSide(width: 1.0, color: AppColors.textGrayColor),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(5.0),
                              borderSide: BorderSide(width: 1.0, color: AppColors.yellowColor),
                            ),
                            contentPadding: EdgeInsets.all(5.0),
                            hintText: 'add_voucher'.tr,
                            hintStyle: TextStyle(color: AppColors.textGrayColor)
                        ),
                      ),
                    )
                  ),
                  Container(
                    height: 35,
                    child: ElevatedButton(
                      onPressed: () {},
                      child: Text('delete'.tr),
                      style: ElevatedButton.styleFrom(
                          primary: AppColors.yellowColor, elevation: 0),
                    ),
                  )

                ],
              ),
            ),
            // Tabbar
            Container(
              decoration: BoxDecoration(color: Colors.white),
              child: TabBar(
                  controller: _tabx.controller,
                  indicatorColor: AppColors.yellowColor,
                  unselectedLabelColor: AppColors.textGrayColor,
                  labelColor: AppColors.yellowColor,
                  tabs: _tabx.listTab
                      .map((e) => Tab(
                    child: Text(
                      e,
                      style: TextStyle(),
                    ),
                  )).toList()),
            ),
            Expanded(
                child: TabBarView(
                  controller: _tabx.controller,
                  children: [
                    ListView.builder(
                        scrollDirection: Axis.vertical,
                        shrinkWrap: true,
                        itemBuilder: (context, index) => Container(
                          margin: EdgeInsets.all(5.0),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10.0),
                            border: Border.all(
                                width: 1, color: AppColors.textGrayColor.withOpacity(0.5)
                            )
                          ),
                          child: IntrinsicHeight(
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.stretch,
                              children: [
                                Container(
                                  child: Stack(
                                    children: [
                                      Image.asset(
                                        "assets/images/account/right_background.png",
                                        width: 100,
                                        height: 100,
                                      ),
                                      Positioned(
                                          left: 0,
                                          child: Image.asset(
                                              "assets/images/account/background.png")),
                                      Positioned(
                                          right: -5,
                                          child: Image.asset(
                                            "assets/images/account/right_background.png",
                                            fit: BoxFit.fitHeight,
                                            height: 100,
                                          )),
                                      Positioned.fill(
                                          child: Align(
                                              alignment: Alignment.centerRight,
                                              child: Container(
                                                padding: EdgeInsets.all(5.0),
                                                child: Column(
                                                  mainAxisSize: MainAxisSize.min,
                                                  children: [
                                                    Text(
                                                      "MIỄN PHÍ VẪN CHUYỂN",
                                                      textAlign: TextAlign.center,
                                                      style: TextStyle(
                                                          fontSize: 14,
                                                          color: Colors.white),
                                                    ),
                                                    SizedBox(
                                                      height: 10,
                                                    ),
                                                    Container(
                                                      height: 30,
                                                      child: ElevatedButton(
                                                        onPressed: () {},
                                                        child: Text(
                                                          'use_now'.tr,
                                                          style: TextStyle(
                                                              color: Colors.blue),
                                                        ),
                                                        style: ElevatedButton.styleFrom(
                                                          padding:  EdgeInsets.all(5.0),
                                                          primary:
                                                          Colors.white
                                                        )
                                                      ),
                                                    )
                                                  ],
                                                ),
                                              ))),
                                    ],
                                  ),
                                ),
                                SizedBox(
                                  width: 10,
                                ),
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      Container(
                                        padding: EdgeInsets.all(2.0),
                                        decoration: BoxDecoration(color: AppColors.yellowColor),
                                        child: Text(
                                          "AirPay- Tối đa 70k  ",
                                          style: TextStyle(color: Colors.white),
                                        ),
                                      ),
                                      Text("Mã miễn phí vận chuyển"),
                                      Container(
                                        padding: EdgeInsets.all(3.0),
                                        decoration: BoxDecoration(
                                            border: Border.all(
                                                width: 1, color: AppColors.yellowColor)),
                                        child: Text(
                                          "AirPay- Tối đa 70k  ",
                                          style: TextStyle(color: AppColors.yellowColor),
                                        ),
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                        children: [
                                          Expanded(child: Text(
                                            "Có hiệu lực từ: 16.03.2020  00:00",
                                            overflow: TextOverflow.fade,
                                            style: TextStyle(fontSize: 12),
                                          ),),
                                          Text(
                                            'condition'.tr,
                                            style: TextStyle(
                                                fontSize: 12, color: AppColors.textLink),
                                          ),
                                          SizedBox(width: 10.w,),
                                        ],
                                      )
                                    ],
                                  ),
                                )
                              ],
                            ),
                          )
                        )
                    ),
                    ListView.builder(
                        scrollDirection: Axis.vertical,
                        shrinkWrap: true,
                        itemBuilder: (context, index) => Stack(
                          fit: StackFit.passthrough,
                          children: [
                            Container(
                            width: 100,
                            height: 100,
                            margin: EdgeInsets.all(5.0),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10.0),
                                border: Border.all(
                                    width: 1, color: AppColors.textGrayColor.withOpacity(0.5))),
                            child: Row(
                              children: [
                                Container(
                                  child: Stack(
                                    children: [
                                      Image.asset(
                                        "assets/images/account/right_background.png",
                                        width: 100,
                                        height: 100,
                                      ),
                                      Positioned(
                                          left: 0,
                                          child: Image.asset(
                                              "assets/images/account/background.png")),
                                      Positioned(
                                          right: -5,
                                          child: Image.asset(
                                            "assets/images/account/right_background.png",
                                            fit: BoxFit.fitHeight,
                                            height: 100,
                                          )),
                                      Positioned.fill(
                                          child: Align(
                                              alignment: Alignment.centerRight,
                                              child: Container(
                                                padding: EdgeInsets.all(5.0),
                                                child: Column(
                                                  mainAxisSize: MainAxisSize.min,
                                                  children: [
                                                    Text(
                                                      "MIỄN PHÍ VẪN CHUYỂN",
                                                      textAlign: TextAlign.center,
                                                      style: TextStyle(
                                                          fontSize: 14,
                                                          color: Colors.white),
                                                    ),
                                                    SizedBox(
                                                      height: 10,
                                                    ),
                                                    Container(
                                                      height: 30,
                                                      child: ElevatedButton(
                                                          onPressed: () {},
                                                          child: Text(
                                                            'use_now'.tr,
                                                            style: TextStyle(
                                                                color: Colors.blue),
                                                          ),
                                                          style: ElevatedButton
                                                              .styleFrom(
                                                              padding:
                                                              EdgeInsets.all(
                                                                  5.0),
                                                              primary:
                                                              Colors.white)),
                                                    )
                                                  ],
                                                ),
                                              ))),
                                    ],
                                  ),
                                ),
                                SizedBox(
                                  width: 10,
                                ),
                                Column(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Container(
                                      padding: EdgeInsets.all(2.0),
                                      decoration: BoxDecoration(color: AppColors.yellowColor),
                                      child: Text(
                                        "AirPay- Tối đa 70k  ",
                                        style: TextStyle(color: Colors.white,
                                          fontSize: 12
                                        ),
                                      ),
                                    ),
                                    Text("Mã miễn phí vận chuyển"),
                                    Container(
                                      padding: EdgeInsets.all(3.0),
                                      decoration: BoxDecoration(
                                          border: Border.all(
                                              width: 1, color: AppColors.yellowColor)),
                                      child: Text(
                                        "AirPay- Tối đa 70k  ",
                                        style: TextStyle(color: AppColors.yellowColor),
                                      ),
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          "Có hiệu lực từ: 16.03.2020  00:00",
                                          style: TextStyle(fontSize: 12),
                                        ),
                                        SizedBox(
                                          width: 30,
                                        ),
                                        Text(
                                          'condition'.tr,
                                          style: const TextStyle(
                                              fontSize: 12, color: AppColors.textLink),
                                        )
                                      ],
                                    )
                                  ],
                                )
                              ],
                            )),

                            Container(
                              width: 100,
                              height: 100,
                              margin: EdgeInsets.all(5.0),
                              decoration: BoxDecoration(
                                color: Colors.grey.withOpacity(0.5),
                                borderRadius: BorderRadius.circular(10.0),
                                border: Border.all(
                                    width: 1, color: AppColors.textGrayColor.withOpacity(0.5)
                                )
                              ),
                            )
                          ],
                        )
                    )
                  ],
                )),
          ],
        ),
      )
    );
  }
}
