import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../theme/app_colors.dart';

class AddNotication extends StatelessWidget {
  const AddNotication({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var checkSendMail = false.obs;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: InkWell(
          onTap: (){
            Get.back();
          },
          child: Icon(
            Icons.arrow_back,
          ),
        ),
        title: Text(
          "Gửi Thông báo",),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Divider(
              height: 5.h,
            ),
            Container(
              height: 50.0.h,
              margin: EdgeInsets.only(left: 10.0.w, right: 10.0.w),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    "Tiêu đề thông báo",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
                  ),
                ],
              ),
            ),
            Divider(
              height: 3.h,
            ),
            Container(
                height: 50.h,
                margin: EdgeInsets.only(left: 10.w, right: 10.w),
                child: TextField(
                  decoration: const InputDecoration(
                      hintText: "Nhập tên tên chương trình khuyến mãi",
                      hintStyle: TextStyle(color: AppColors.textGrayColor),
                      counterText: "",
                      border: InputBorder.none,
                      suffixIcon: Icon(
                        Icons.edit_outlined,
                        color: AppColors.textGrayColor,
                      )),
                  maxLength: 120,
                  maxLines: 2,
                  // controller: name,
                  onChanged: (value) {},
                )),
            Container(
              height: 10.h,
              color: const Color.fromARGB(255, 241, 243, 253),
            ),
            Container(
              height: 50.h,
              margin: EdgeInsets.only(left: 10.w, right: 10.w),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    "Mô tả sản phẩm",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  /*Switch(value: true, onChanged: (value){}),*/
                ],
              ),
            ),
            Divider(
              height: 1.h,
            ),
            Container(
                height: 150.h,
                margin: EdgeInsets.only(left: 10.w, right: 10.w),
                child: TextField(
                  decoration: const InputDecoration(
                    hintText: "Nhập mô tả sản phẩm",
                    hintStyle: TextStyle(color: AppColors.textGrayColor),
                    counterText: "",
                    border: InputBorder.none,
                    suffixIcon: Icon(
                      Icons.edit_outlined,
                      color: AppColors.textGrayColor,
                    ),
                  ),
                  maxLength: 400,
                  maxLines: null,
                  // controller: name,
                  onChanged: (value) {},
                )),
            Container(
              height: 10.h,
              color: const Color.fromARGB(255, 241, 243, 253),
            ),
            Container(
              height: 50.h,
              margin: EdgeInsets.only(left: 10.w, right: 10.w),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'send_mail'.tr,
                    style: TextStyle(color: Color.fromARGB(255, 137, 144, 166)),
                  ),
                  /*Switch(value: true, onChanged: (value){}),*/
                  Obx(() => CupertinoSwitch(
                      value: checkSendMail.value,
                      onChanged: (value) {
                        checkSendMail.value = value;
                        print(checkSendMail);
                      }))
                ],
              ),
            ),
            Container(
                margin: EdgeInsets.only(left: 10.0.w, right: 10.0.w),
                height: 50.0,
                child: InkWell(
                  splashColor: const Color.fromARGB(255, 188, 195, 216),
                  onTap: () {
                    // Get.to(const ChonDanhMuc());
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                          child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text('customer'.tr,
                              style: TextStyle(
                                  color: Color.fromARGB(255, 127, 141, 171)))
                        ],
                      )),
                      Expanded(
                          child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Text(
                            'select'.tr,
                            /*controller.chonDanhmuc.toString(),*/
                            style: TextStyle(color: AppColors.textGrayColor),
                          ),
                          const Icon(
                            Icons.navigate_next,
                            color: AppColors.textGrayColor,
                          ),
                        ],
                      ))
                    ],
                  ),
                )),
            Container(
              height: 10.h,
              color: const Color.fromARGB(255, 241, 243, 253),
            ),
            Container(
              height: 50.h,
              width: MediaQuery.of(context).size.width,
              margin: EdgeInsets.only(left: 10.0.w, right: 10.0.w,top: 10.0.h),
              child: TextButton(
                style: TextButton.styleFrom(
                  padding: EdgeInsets.only(left: 80, right: 80),
                  backgroundColor: Color.fromARGB(255, 223, 180, 0),
                  primary: Colors.white,
                  textStyle: const TextStyle(fontSize: 20),
                ),
                // sự kiện chuyển màn
                onPressed: () {},
                child: const Text(
                  'Lưu thông báo',
                  style: TextStyle(
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
