import 'package:app_casynet/screens/account/address/edit_address.dart';
import 'package:app_casynet/screens/account/address/new_address.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../../data.dart';
import '../../../model/address.dart';
import '../../../theme/app_colors.dart';
import '../../../widget/account/top_account_widget.dart';

class InformationAddress extends StatelessWidget {
  const InformationAddress({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
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
                ListView.separated(
                    scrollDirection: Axis.vertical,
                    physics: NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: address.length,
                    separatorBuilder: (context, index) => Container(height: 10, color: kBackgroundColor, ),
                    itemBuilder: (context, index) =>  Padding(
                        padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(address[index]['name'],
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold
                                  ),
                                ),
                                GestureDetector(
                                  onTap: (){
                                    Get.to(EditAddress(), arguments: Address.fromJson(address[index]));
                                  },
                                  child: SvgPicture.asset("assets/account/edit.svg", width: 15, color: kTextColor,),
                                )
                              ],
                            ),
                            SizedBox(height: 2,),
                            Text(address[index]['phone'],
                              style: TextStyle(
                                  color: kTextColor
                              ),
                            ),
                            SizedBox(height: 2,),
                            Text(address[index]['detail_address'],
                              style: TextStyle(
                                  color: kTextColor
                              ),
                            ),
                            SizedBox(height: 2,),
                            Row(
                              children: [
                                Text(address[index]['default_address'] ? "[ bỏ mặc định ]" : "[ mặc định ]",
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
                ),
                Container(height: 10, color: kBackgroundColor, ),
                SizedBox(height: 15,),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 10),
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {
                      Get.to(NewAddress());
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