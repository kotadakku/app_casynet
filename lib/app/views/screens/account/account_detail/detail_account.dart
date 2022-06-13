import 'dart:io';

import 'package:app_casynet/app/controller/account/account_detail/account_detail_controller.dart';
import 'package:app_casynet/app/views/widgets/image_network_loading.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:intl/intl.dart';
import '../../../../routes/app_pages.dart';
import '../../../theme/app_colors.dart';
import '../../../widgets/shadow_of_doubt.dart';
import '../../../widgets/appbar/appbar_account_widget.dart';

class AccountDetailPage extends StatelessWidget {
  const AccountDetailPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    AccountDetailController accountDetailController = Get.find();
    return Scaffold(
        backgroundColor: Colors.white,
        appBar:  AppBarAccountWidget(),
        body: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: Obx(()=>Column(
            children: [
              Container(
                  padding: EdgeInsets.symmetric(vertical: 20.h),
                  child: Stack(
                    alignment: Alignment.center,
                    children: [
                      ShadowOfDoubt(diameter: 100, origin: Offset(0,110),),
                      Container(
                          width: 100,
                          height: 100,
                          decoration: BoxDecoration(
                            border: Border.all(color: AppColors.yellowColor, width: 2),
                            color: Colors.white,
                            shape: BoxShape.circle,
                          ),
                          child:  Stack(
                            children: [
                              Positioned.fill(
                                  child: InkWell(
                                    onTap: (){
                                      accountDetailController.pickimagecamera();
                                    },
                                    child: ClipOval(
                                        child: Obx(()=> accountDetailController.image_selected.value == ""
                                            ? ImageNetworkLoading(image_url: accountDetailController.user.value.image.toString())
                                            : Image.file(File(accountDetailController.image_selected.value)))
                                    ),
                                  )
                              ),

                              Positioned(
                                right: 0,
                                bottom: 0,
                                child: Container(
                                  width: 30,
                                  height: 30,
                                  child: FloatingActionButton(
                                    onPressed: () {
                                      accountDetailController.pickimagecamera(isCamera: true);
                                    },
                                    child: Icon(
                                      Icons.camera_alt_outlined,
                                      size: 20,
                                    ),
                                    backgroundColor: AppColors.yellowColor,
                                  ),
                                ),
                              )

                            ],
                          )
                      ),


                    ],

                  )
              ),
              Divider(
                indent: 5.h,
                height: 1.h,
              ),
              Column(
                children: [
                  // Họ tên
                  InkWell(
                    onTap: (){
                      Get.toNamed(Routes.ACCOUNT_EDIT_INFO,
                          arguments: ['name',
                            accountDetailController.user.value.fullnameToString()])?.then((value){
                        if(value != null){
                          if(value != accountDetailController.user.value.fullnameToString()){
                            List<String> val = value.split(" ",);
                            accountDetailController.user.value.firstname = val[0];
                            val.removeAt(0);
                            accountDetailController.user.value.lastname = val.join(' ');
                            accountDetailController.user.value = accountDetailController.user.value;
                            accountDetailController.user.refresh();
                            accountDetailController.updateUser();
                            print(accountDetailController.user.value.fullnameToString());
                          }
                        }
                      });

                    },

                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 10.h),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'name'.tr,
                            style: TextStyle(),
                          ),
                          Row(
                            children: [
                              Text('${accountDetailController.user.value.fullnameToString()}'),
                              Padding(
                                padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 10.h),
                                child: Icon(
                                  Icons.arrow_forward_ios,
                                  size: 10,
                                  color: AppColors.textGrayColor,
                                ),
                              )
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                  Divider(
                    indent: 0.h,
                    height: 1.h,
                  ),
                  // Email
                  InkWell(
                    onTap: (){
                      Get.toNamed(Routes.ACCOUNT_EDIT_INFO,
                          arguments: ['Email',
                            accountDetailController.user.value.email])?.then((value){
                        if(value != null){
                          if(value != accountDetailController.user.value.email){
                            accountDetailController.user.value.email = value;
                            accountDetailController.user.refresh();
                            accountDetailController.updateUser();

                          }
                        }
                      });
                    },

                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 10.h),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text("Email"),
                          SizedBox(
                            width: 5.w,
                          ),
                          Expanded(child: Text( accountDetailController.user.value.email.toString(),
                            overflow: TextOverflow.ellipsis,
                            textAlign: TextAlign.end,
                          ),),
                          Row(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              SizedBox(
                                width: 5.w,
                              ),
                              Text(
                                'change'.tr,
                                style: TextStyle(color: AppColors.textLink),
                              ),
                              SizedBox(
                                width: 5.w,
                              ),
                              Padding(
                                padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 10.h),
                                child: Icon(
                                  Icons.arrow_forward_ios,
                                  size: 10,
                                  color: AppColors.textGrayColor,
                                ),
                              )
                            ],
                          )
                        ],
                      ),
                    ),
                  ),

                  Divider(
                    indent: 1.h,
                  ),
                  // Số điện thoại
                  InkWell(
                    onTap: (){
                      Get.toNamed(Routes.ACCOUNT_EDIT_INFO,
                          arguments: ['phone',
                            accountDetailController.user.value.phone])?.then((value){
                        if(value != null){
                          if(value != accountDetailController.user.value.phone){
                            accountDetailController.user.value.phone = value;
                            accountDetailController.user..refresh();
                            accountDetailController.updateUser();
                          }
                        }
                      });
                    },
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 10.w),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text('phone'.tr),
                          Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Text(
                                accountDetailController.user.value.phone == null ? 'add'.tr:  accountDetailController.user.value.phone.toString(),
                                style: TextStyle(color: AppColors.textLink),
                              ),
                              Padding(
                                padding: EdgeInsets.all(10),
                                child: Icon(
                                  Icons.arrow_forward_ios,
                                  size: 10,
                                  color: AppColors.textGrayColor,
                                ),
                              )
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                  Divider(
                    indent: 10,
                  ),
                  // Tên của hàng
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 10.0.w),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("Tên cửa hàng"),
                        Row(
                          children: [
                            Text(
                              "Thêm tên cửa hàng",
                              style: TextStyle(color: AppColors.textGrayColor),
                            ),
                            Padding(
                              padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 10.h),
                              child: Icon(
                                Icons.arrow_forward_ios,
                                size: 10,
                                color: AppColors.textGrayColor,
                              ),
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                  Divider(
                    indent: 10.h,
                  ),

                  // Giới tính
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 10.w),
                    child: Row(
                      children: [
                        Text('sex'.tr),
                        Spacer(),
                        Row(
                          children: [
                            Obx(()=>DropdownButtonHideUnderline(
                              child: DropdownButton2(
                                  hint: Text(
                                    'Select Item',
                                    style: TextStyle(
                                      fontSize: 14,
                                      color: Theme
                                          .of(context)
                                          .hintColor,
                                    ),
                                  ),
                                  items: ['Nam', 'Nữ', 'Khác']
                                      .map((item) =>
                                      DropdownMenuItem<String>(
                                        value: item,
                                        child: Text(
                                          item,
                                          style: const TextStyle(
                                            fontSize: 14,
                                          ),
                                        ),
                                      ))
                                      .toList(),
                                  value:  accountDetailController.user.value.gender != null
                                      ? ( accountDetailController.user.value.gender == 0 ? 'Nam':(accountDetailController.user.value.gender == 1 ? 'Nữ': 'Khác')): 'no-info'.tr,
                                  onChanged: (value) {
                                    int gender = value.toString() == "Nam" ? 0 :(value.toString() == "Nữ" ? 1: 2);
                                    accountDetailController.user.value.gender = gender;
                                    accountDetailController.user.refresh();
                                    accountDetailController.updateUser();
                                  },

                                  alignment: Alignment.centerRight,
                                  icon: Padding(
                                    padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 10.h),
                                    child: Icon(
                                      Icons.arrow_forward_ios,
                                      size: 10,
                                      color: AppColors.textGrayColor,
                                    ),
                                  )
                              ),
                            ),)
                          ],
                        )
                      ],
                    ),
                  ),
                  Divider(
                    indent: 10.h,
                  ),
                  // Ngày sinh
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 10.w),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('birthday'.tr),

                        GestureDetector(
                            child: Row(
                              children: [
                                accountDetailController.user.value.birthday == null ?

                                Obx(()=>Text(
                                  accountDetailController.date_birthday.value == "" ? 'setup_now'.tr :accountDetailController.date_birthday.value,
                                  style: TextStyle(color: AppColors.textGrayColor),
                                ),): Text( accountDetailController.user.value.birthday.toString()),
                                Padding(
                                  padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 10.h),
                                  child: Icon(
                                    Icons.arrow_forward_ios,
                                    size: 10,
                                    color: AppColors.textGrayColor,
                                  ),
                                )
                              ],
                            ),
                            onTap: () async {
                              DateTime? date = await showDatePicker(
                                  context: context,
                                  initialDate: DateTime.now().subtract(
                                      Duration(days: 1)),
                                  firstDate: DateTime(1900, 01, 01),
                                  lastDate: DateTime.now().subtract(
                                    Duration(days: 1),
                                  )
                              );
                              accountDetailController.date_birthday.value = DateFormat('yyyy-MM-dd')
                                  .format(date!)
                                  .toString();
                              accountDetailController.user.value.birthday = accountDetailController.date_birthday.value;
                              accountDetailController.user.refresh();
                              accountDetailController.updateUser();
                            }
                        )
                      ],
                    ),
                  ),
                  Divider(
                    indent: 10.h,
                  ),
                  // Mật khẩu
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 10.h),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('password'.tr),
                        GestureDetector(
                          child: Row(
                            children: [
                              Text(
                                'change_pass'.tr,
                                style: TextStyle(color: AppColors.textLink),
                              ),
                              Padding(
                                padding: EdgeInsets.all(10),
                                child: Icon(
                                  Icons.arrow_forward_ios,
                                  size: 10,
                                  color: AppColors.textGrayColor,
                                ),
                              )
                            ],
                          ),
                          onTap: () {
                            Get.toNamed(Routes.ACCOUNT_CHANGE_PASS);
                          },
                        )
                      ],
                    ),
                  ),
                ],
              )
            ],
          ))
        )
    );
  }
}
