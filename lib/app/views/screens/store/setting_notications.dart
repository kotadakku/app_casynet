
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../theme/app_colors.dart';

class SettingNotications extends StatelessWidget {
  const SettingNotications({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var isSwitchedCapNhatDonHangEmail = true.obs;
    var isSwitchedTinTucEmail = false.obs;
    var isSwitchedThongBaoCuaHangEmail = true.obs;
    var isSwitchedNoiDungCaNhanEmail = false.obs;
    var isSwitchedCapNhatDonHang = true.obs;
    var isSwitchedTinNhan = false.obs;
    var isSwitchedKhuyenMaiCasynet = true.obs;
    var isSwitchedTheoDoiBinhLuan = false.obs;
    var isSwitchedSanPhamHetHang = false.obs;

    /*var isbtnBoEmail = false.obs;
    var isbtnBoThongbao = false.obs;*/


    return Scaffold(
      appBar: AppBar(
        title: Text("Cài đăt thông báo",),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Divider(
              height: 3.0.h,
            ),
            Container(
              margin: EdgeInsets.only(left: 10.0.w, right: 10.0.w),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(width: 40.0.w,
                    height: 40.0.h,
                    child: Image.asset("assets/store/ic_thongbao_email.png",),),
                  SizedBox(width: 10.0.w,),
                  Text("Thông báo Email",
                    style: TextStyle(fontWeight: FontWeight.bold),),
                  Expanded(child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      OutlinedButton(

                          onPressed: () {
                            isSwitchedCapNhatDonHangEmail.value = false;
                            isSwitchedTinTucEmail.value = false;
                            isSwitchedThongBaoCuaHangEmail.value = false;
                            isSwitchedNoiDungCaNhanEmail.value = false;
                          },
                          child: Text("Bỏ Email", style: TextStyle(
                              color: Colors.black),)),
                      /*Obx(
                        () => OutlinedButton(

                            onPressed: () {
                              isSwitchedCapNhatDonHangEmail.value = false;
                              isSwitchedThongBaoCuaHangEmail.value = false;
                            },
                            child: Text("Bỏ Email", style: TextStyle(
                                color: Colors.black),)),
                      )*/
                    ],
                  ))
                ],
              ),
            ),
            Divider(
              height: 1.0.h,
            ),
            Container(
              margin: EdgeInsets.only(left: 10.0.w, right: 10.0.w),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(width: 30.0.w,
                    height: 30.0.h,
                    child: Image.asset("assets/store/ic_thongbao_email.png",),),
                  SizedBox(width: 10.0.w,),
                  Text(
                    "Cập nhật đơn hàng", style: TextStyle(color: kTextColor),),
                  Expanded(child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Obx(
                            () =>
                            Switch.adaptive(
                                activeColor: Colors.white,
                                activeTrackColor: Colors.green,
                                value: isSwitchedCapNhatDonHangEmail.value,
                                onChanged: (value) {
                                  isSwitchedCapNhatDonHangEmail.value = value;
                                  print(isSwitchedCapNhatDonHangEmail);
                                }),
                      )
                    ],
                  ))
                ],
              ),
            ),
            Divider(
              height: 1.0.h,
            ),
            Container(
              margin: EdgeInsets.only(left: 10.0.w, right: 10.0.w),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(width: 30.0.w,
                    height: 30.0.h,
                    child: Image.asset("assets/store/ic_thongbao_email.png",),),
                  SizedBox(width: 10.0.w,),
                  Text("Tin tức", style: TextStyle(color: kTextColor),),
                  Expanded(child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Obx(
                      ()=> Switch.adaptive(
                            activeColor: Colors.white,
                            activeTrackColor: Colors.green,
                            value: isSwitchedTinTucEmail.value,
                            onChanged: (value) {
                              isSwitchedTinTucEmail.value = value;
                              print(isSwitchedTinTucEmail);
                            }),
                      )
                    ],
                  ))
                ],
              ),
            ),
            Divider(
              height: 1.0.h,
            ),
            Container(
              margin: EdgeInsets.only(left: 10.0.w, right: 10.0.w),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(width: 30.0.w,
                    height: 30.0.h,
                    child: Image.asset("assets/store/ic_thongbao_email.png",),),
                  SizedBox(width: 10.0.w,),
                  Text(
                    "Thông báo cửa hàng", style: TextStyle(color: kTextColor),),
                  Expanded(child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Obx(
                      ()=> Switch.adaptive(
                            activeColor: Colors.white,
                            activeTrackColor: Colors.green,
                            value: isSwitchedThongBaoCuaHangEmail.value,
                            onChanged: (value) {
                              isSwitchedThongBaoCuaHangEmail.value = value;
                              print(isSwitchedThongBaoCuaHangEmail);
                            }),
                      )
                    ],
                  ))
                ],
              ),
            ),
            Divider(
              height: 1.0.h,
            ),
            Container(
              margin: EdgeInsets.only(left: 10.0.w, right: 10.0.w),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(width: 30.0.w,
                    height: 30.0.h,
                    child: Image.asset("assets/store/ic_thongbao_email.png",),),
                  SizedBox(width: 10.0.w,),
                  Text(
                    "Nội dung cá nhân", style: TextStyle(color: kTextColor),),
                  Expanded(child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Obx(
                      ()=> Switch.adaptive(
                            activeColor: Colors.white,
                            activeTrackColor: Colors.green,
                            value: isSwitchedNoiDungCaNhanEmail.value,
                            onChanged: (value) {
                              isSwitchedNoiDungCaNhanEmail.value = value;
                              print(isSwitchedNoiDungCaNhanEmail);
                            }),
                      )
                    ],
                  ))
                ],
              ),
            ),
            Container(
              height: 20.0.h, color: Color.fromARGB(255, 241, 243, 253),),

            Container(
              margin: EdgeInsets.only(left: 10.0.w, right: 10.0.w),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(width: 40.0.w,
                    height: 40.0.h,
                    child: Image.asset("assets/store/ic_thongbao_email.png",),),
                  SizedBox(width: 10.0.w,),
                  Text("Thông báo",
                    style: TextStyle(fontWeight: FontWeight.bold),),
                  Expanded(child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      OutlinedButton(onPressed: () {
                         isSwitchedCapNhatDonHang.value = false;
                         isSwitchedTinNhan.value = false;
                         isSwitchedKhuyenMaiCasynet.value = false;
                         isSwitchedTheoDoiBinhLuan.value = false;
                         isSwitchedSanPhamHetHang.value = false;
                      },
                          child: Text("Bỏ thông báo", style: TextStyle(
                              color: Colors.black),))
                    ],
                  ))
                ],
              ),
            ),
            Divider(
              height: 1.0.h,
            ),
            Container(
              margin: EdgeInsets.only(left: 10.0.w, right: 10.0.w),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(width: 30.0.w,
                    height: 30.0.h,
                    child: Image.asset("assets/store/ic_thongbao_email.png",),),
                  SizedBox(width: 10.0.w,),
                  Text(
                    "Cập nhật đơn hàng", style: TextStyle(color: kTextColor),),
                  Expanded(child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Obx(
                      ()=> Switch.adaptive(
                            activeColor: Colors.white,
                            activeTrackColor: Colors.green,
                            value: isSwitchedCapNhatDonHang.value,
                            onChanged: (value) {
                              isSwitchedCapNhatDonHang.value = value;

                            }),
                      )
                    ],
                  ))
                ],
              ),
            ),
            Divider(
              height: 1.0.h,
            ),
            Container(
              margin: EdgeInsets.only(left: 10.0.w, right: 10.0.w),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(width: 30.0.w,
                    height: 30.0.h,
                    child: Image.asset("assets/store/ic_thongbao_email.png",),),
                  SizedBox(width: 10.0.w,),
                  Text("Tin nhắn", style: TextStyle(color: kTextColor),),
                  Expanded(child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Obx(
                      ()=> Switch.adaptive(
                            activeColor: Colors.white,
                            activeTrackColor: Colors.green,
                            value: isSwitchedTinNhan.value,
                            onChanged: (value) {
                              isSwitchedTinNhan.value = value;
                            }),
                      )
                    ],
                  ))
                ],
              ),
            ),
            Divider(
              height: 1.0.h,
            ),
            Container(
              margin: EdgeInsets.only(left: 10.0.w, right: 10.0.w),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(width: 30.0.w,
                    height: 30.0.h,
                    child: Image.asset("assets/store/ic_thongbao_email.png",),),
                  SizedBox(width: 10.0.w,),
                  Text(
                    "Khuyến mãi Casynet", style: TextStyle(color: kTextColor),),
                  Expanded(child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Obx(
                      ()=> Switch.adaptive(
                            activeColor: Colors.white,
                            activeTrackColor: Colors.green,
                            value: isSwitchedKhuyenMaiCasynet.value,
                            onChanged: (value) {
                              isSwitchedKhuyenMaiCasynet.value = value;

                            }),
                      )
                    ],
                  ))
                ],
              ),
            ),
            Divider(
              height: 1.0.h,
            ),
            Container(
              margin: EdgeInsets.only(left: 10.0.w, right: 10.0.w),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(width: 30.0.w,
                    height: 30.0.h,
                    child: Image.asset("assets/store/ic_thongbao_email.png",),),
                  SizedBox(width: 10.0.w,),
                  Text(
                    "Theo dõi bình luận", style: TextStyle(color: kTextColor),),
                  Expanded(child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Obx(
                      ()=> Switch.adaptive(
                            activeColor: Colors.white,
                            activeTrackColor: Colors.green,
                            value: isSwitchedTheoDoiBinhLuan.value,
                            onChanged: (value) {
                              isSwitchedTheoDoiBinhLuan.value = value;
                            }),
                      )
                    ],
                  ))
                ],
              ),
            ),
            Divider(
              height: 1.0.h,
            ),
            Container(
              margin: EdgeInsets.only(left: 10.0.w, right: 10.0.w),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(width: 30.0.w,
                    height: 30.0.h,
                    child: Image.asset("assets/store/ic_thongbao_email.png",),),
                  SizedBox(width: 10.0.w,),
                  Text(
                    "Sản phẩm hết hàng", style: TextStyle(color: kTextColor),),
                  Expanded(child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Obx(
                      ()=> Switch.adaptive(
                            activeColor: Colors.white,
                            activeTrackColor: Colors.green,
                            value: isSwitchedSanPhamHetHang.value,
                            onChanged: (value) {
                              isSwitchedSanPhamHetHang.value =value;
                            }),
                      )
                    ],
                  ))
                ],
              ),
            ),
            Container(
              height: 10.0.h, color: Color.fromARGB(255, 241, 243, 253),),

          ],
        ),
      ),
    );
  }
}
