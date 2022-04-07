import 'package:app_casynet/routes/app_pages.dart';
import 'package:app_casynet/screens/account/address/edit_address.dart';
import 'package:app_casynet/screens/account/address/new_address.dart';
import 'package:app_casynet/widget/account/top_account_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../../controller/account/information_address_controller.dart';
import '../../../data.dart';
import '../../../data/model/address.dart';
import '../../../theme/app_colors.dart';

class InformationAddress extends StatelessWidget {
  const InformationAddress({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var c1 = Get.find<InformationAddressController>();
    return Scaffold(
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: SafeArea(
          child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TopAccountWidget(),
                SizedBox(height: 30,),
                Text("Thông tin địa chỉ",
                  style: TextStyle(
                      fontSize: 18.0,
                      fontWeight: FontWeight.bold
                  ),
                ),
                Divider(
                  indent: 10,
                ),
                GetBuilder<InformationAddressController>(
                  init: InformationAddressController(),
                  builder:  (c)=> NotificationListener<ScrollEndNotification>(
                      onNotification: (scrollEnd) {
                        final metrics = scrollEnd.metrics;
                        if (metrics.atEdge) {
                          bool isTop = metrics.pixels == 0;
                          if (isTop) {
                            c.updateAddress();
                          } else {
                            print('At the bottom');
                          }
                        }
                        return true;
                      },
                    child: ListView.separated(
                      shrinkWrap: true,
                      itemCount: c.addressList.length,
                      separatorBuilder: (context, index) => Container(height: 10, color: kBackgroundColor, ),
                      itemBuilder: (context, index) =>  Padding(
                        padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(c.addressList[index].name,
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold
                                  ),
                                ),
                                GestureDetector(
                                  onTap: (){
                                    Get.toNamed(Routes.ACCOUNT_ADDRESS_EDIT, arguments: c.addressList[index]);
                                  },
                                  child: SvgPicture.asset("assets/account/edit.svg", width: 15, color: kTextColor,),
                                )
                              ],
                            ),
                            SizedBox(height: 2,),
                            Text(c.addressList[index].phone,
                              style: TextStyle(
                                  color: kTextColor
                              ),
                            ),
                            SizedBox(height: 2,),
                            Text(c.addressList[index].detail_address,
                              style: TextStyle(
                                  color: kTextColor
                              ),
                            ),
                            SizedBox(height: 2,),
                            Row(
                              children: [
                                Text(c.addressList[index].default_address ? "[ bỏ mặc định ]" : "[ mặc định ]",
                                  style: TextStyle(
                                      color: kYellowColor
                                  ),),
                                Text("[ Địa chỉ lấy hàng ]",
                                  style: TextStyle(
                                      color: kTextLink
                                  ),)
                              ],
                            )
                          ],
                        )
                    )
                )),

                ),

                Container(height: 10, color: kBackgroundColor, ),
                SizedBox(height: 15,),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 10),
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {
                      Get.toNamed(Routes.ACCOUNT_ADDRESS_NEW);
                    },
                    child: Text("Thêm địa chỉ mới"),
                    style: ElevatedButton.styleFrom(
                        primary: kYellowColor
                    ),
                  ),
                )
              ]
          ),
        ),
      ),
    );;
  }
}