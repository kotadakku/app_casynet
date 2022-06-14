import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:app_casynet/app/controller/controller.dart';
import 'package:app_casynet/app/views/views.dart';
import '../../../../routes/app_pages.dart';
import '../../../theme/app_colors.dart';



class InformationAddress extends StatelessWidget {
  InformationAddress({Key? key}) : super(key: key);
  AuthenticationManager _authenticationManager = Get.find();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarAccountWidget(),
      body: RefreshIndicator(
        onRefresh: () =>_authenticationManager.fetchUserAPI(),
        child: SingleChildScrollView(
          child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.only(left: 10.w, top: 10.h, bottom: 10.h),
                  child: Text('info_address'.tr,
                    style: TextStyle(
                        fontSize: 18.0,
                        fontWeight: FontWeight.bold
                    ),
                  ),
                ),
                Divider(
                  indent: 10.h,
                ),
                Obx(()=>_authenticationManager.user_current.value.addresses.isEmpty
                    ? Text("Chưa có địa chỉ nào")
                    : ListView.separated(
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    itemCount: _authenticationManager.user_current.value.addresses.length,
                    separatorBuilder: (context, index) => Container(height: 10.h, color: AppColors.backgroundColor, ),
                    itemBuilder: (context, index) =>  Padding(
                        padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 10.h),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(_authenticationManager.user_current.value.addresses[index].lastname.toString(),
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold
                                  ),
                                ),
                                GestureDetector(
                                  behavior: HitTestBehavior.translucent,
                                  onTap: (){
                                    Get.toNamed(Routes.ACCOUNT_ADDRESS_EDIT, arguments: [_authenticationManager.user_current.value.addresses[index]]);
                                  },
                                  child: SvgPicture.asset("assets/images/account/edit.svg", width: 15, color: AppColors.textGrayColor,),
                                )
                              ],
                            ),
                            SizedBox(height: 2.h,),
                            Text(_authenticationManager.user_current.value.addresses[index].phone.toString(),
                              style: TextStyle(
                                  color: AppColors.textGrayColor
                              ),
                            ),
                            SizedBox(height: 2.h,),
                            Text(_authenticationManager.user_current.value.addresses[index].street.toString(),
                              style: TextStyle(
                                  color: AppColors.textGrayColor
                              ),
                            ),
                            SizedBox(height: 2.h,),
                            Row(
                              children: [
                                Text(_authenticationManager.user_current.value.addresses[index].default_shipping ? "[ bỏ mặc định ]" : "[ mặc định ]",
                                  style: TextStyle(
                                      color: AppColors.yellowColor
                                  ),),

                                Text("[ Địa chỉ lấy hàng ]",
                                  style: TextStyle(
                                      color: AppColors.textLink
                                  ),)
                              ],
                            )
                          ],
                        )
                    )
                ),),

                Container(height: 10.h, color: AppColors.backgroundColor, ),
                SizedBox(height: 15.h,),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 10.w),
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {
                      Get.toNamed(Routes.ACCOUNT_ADDRESS_NEW);
                    },
                    child: Text('add_address'.tr),
                    style: ElevatedButton.styleFrom(
                        primary: AppColors.yellowColor
                    ),
                  ),
                ),
              ]
          ),
        ),
      )
    );
  }
}