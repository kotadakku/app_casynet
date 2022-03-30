import 'package:app_casynet/containts/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../controller/tabview_controller.dart';

class WalletVoucher extends StatelessWidget {
  const WalletVoucher({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final TabWalletVoucherController _tabx =
        Get.put(TabWalletVoucherController());
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          Container(
            color: kBackgroundColor,
            padding: EdgeInsets.symmetric(horizontal: 10, vertical: 15),
            child: Row(
              children: [
                Text(
                  "Ví Voucher",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
                ),
                SizedBox(
                  width: 20,
                ),
                Expanded(
                    child: TextField(
                  decoration: InputDecoration(
                      filled: true,
                      fillColor: Colors.white,
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5.0),
                        borderSide: BorderSide(width: 1.0, color: kTextColor),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5.0),
                        borderSide: BorderSide(width: 1.0, color: kTextColor),
                      ),
                      contentPadding: EdgeInsets.all(5.0),
                      hintText: "Thêm mã giảm giá",
                      hintStyle: TextStyle(color: kTextColor)),
                )),
                ElevatedButton(
                  onPressed: () {},
                  child: Text("Lưu"),
                  style: ElevatedButton.styleFrom(
                      primary: kYellowColor, elevation: 0),
                )
              ],
            ),
          ),
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
                        ))
                    .toList()),
          ),
          Expanded(
              child: TabBarView(
            controller: _tabx.controller,
            children: [
              ListView.builder(
                  scrollDirection: Axis.vertical,
                  shrinkWrap: true,
                  itemBuilder: (context, index) => Container(
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
                                  "assets/account/right_background.png",
                                  width: 100,
                                  height: 100,
                                ),
                                Positioned(
                                    left: 0,
                                    child: Image.asset(
                                        "assets/account/background.png")),
                                Positioned(
                                    right: -5,
                                    child: Image.asset(
                                      "assets/account/right_background.png",
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
                      ))),
              Text("123"),
            ],
          )),
        ],
      ),
    );
  }
}
