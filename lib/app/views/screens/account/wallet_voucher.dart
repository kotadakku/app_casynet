
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../../controller/account/wallet_voucher_controller.dart';
import 'widgets/appbar_account_widget.dart';
import '../../theme/app_colors.dart';


class WalletVoucherPage extends StatelessWidget {
  const WalletVoucherPage({Key? key}) : super(key: key);

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
              color: kBackgroundColor,
              padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 10.h),
              child: Row(
                children: [
                  Text(
                    "Ví Voucher",
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
                        cursorColor: kTextColor,
                        style: TextStyle(
                          color: kTextColor,
                          fontSize: 14
                        ),
                        decoration: InputDecoration(
                            filled: true,
                            fillColor: Colors.white,
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(5.0),
                              borderSide: BorderSide(width: 1.0, color: kTextColor),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(5.0),
                              borderSide: BorderSide(width: 1.0, color: kYellowColor),
                            ),
                            contentPadding: EdgeInsets.all(5.0),
                            hintText: "Thêm mã giảm giá",
                            hintStyle: TextStyle(color: kTextColor)
                        ),
                      ),
                    )
                  ),
                  Container(
                    height: 35,
                    child: ElevatedButton(
                      onPressed: () {},
                      child: Text("Lưu"),
                      style: ElevatedButton.styleFrom(
                          primary: kYellowColor, elevation: 0),
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
                  indicatorColor: kYellowColor,
                  unselectedLabelColor: kTextColor,
                  labelColor: kYellowColor,
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
                                width: 1, color: kTextColor.withOpacity(0.5)
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
                                                          "Dùng ngay",
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
                                        decoration: BoxDecoration(color: kYellowColor),
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
                                                width: 1, color: kYellowColor)),
                                        child: Text(
                                          "AirPay- Tối đa 70k  ",
                                          style: TextStyle(color: kYellowColor),
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
                                            "Điều kiện",
                                            style: TextStyle(
                                                fontSize: 12, color: kTextLink),
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
                                    width: 1, color: kTextColor.withOpacity(0.5))),
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
                                                            "Dùng ngay",
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
                                      decoration: BoxDecoration(color: kYellowColor),
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
                                              width: 1, color: kYellowColor)),
                                      child: Text(
                                        "AirPay- Tối đa 70k  ",
                                        style: TextStyle(color: kYellowColor),
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
                                          "Điều kiện",
                                          style: TextStyle(
                                              fontSize: 12, color: kTextLink),
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
                                    width: 1, color: kTextColor.withOpacity(0.5)
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
