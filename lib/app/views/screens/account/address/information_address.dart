
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../../../controller/account/information_address_controller.dart';
import '../../../../routes/app_pages.dart';
import '../../../widgets/account/appbar_account_widget.dart';
import '../../theme/app_colors.dart';



class InformationAddress extends StatelessWidget {
  const InformationAddress({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var c1 = Get.find<InformationAddressController>();
    return Scaffold(
      appBar: AppBarAccountWidget(),
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.only(left: 10.w, top: 10.h, bottom: 10.h),
                child: Text("Thông tin địa chỉ",
                  style: TextStyle(
                      fontSize: 18.0,
                      fontWeight: FontWeight.bold
                  ),
                ),
              ),
              Divider(
                indent: 10.h,
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
                        physics: NeverScrollableScrollPhysics(),
                        itemCount: c.addressList.length,
                        separatorBuilder: (context, index) => Container(height: 10.h, color: kBackgroundColor, ),
                        itemBuilder: (context, index) =>  Padding(
                            padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 10.h),
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
                                SizedBox(height: 2.h,),
                                Text(c.addressList[index].phone,
                                  style: TextStyle(
                                      color: kTextColor
                                  ),
                                ),
                                SizedBox(height: 2.h,),
                                Text(c.addressList[index].detail_address,
                                  style: TextStyle(
                                      color: kTextColor
                                  ),
                                ),
                                SizedBox(height: 2.h,),
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

              Container(height: 10.h, color: kBackgroundColor, ),
              SizedBox(height: 15.h,),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 10.w),
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
    );
  }
}