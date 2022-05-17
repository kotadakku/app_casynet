import 'package:app_casynet/app/controller/store/new_address_shop_controller.dart';
import 'package:app_casynet/app/routes/app_pages.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '../../../../controller/store/choose_category_controller.dart';
import '../../../theme/app_colors.dart';
import '../../store/chon_danh_muc.dart';

class ThongTinCuaHang extends StatelessWidget {
  const ThongTinCuaHang({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final widthdt = MediaQuery.of(context).size.width;

    final ChooseCategoryController controllerCate = Get.put(ChooseCategoryController());
    NewAddressShopController controller = Get.put(NewAddressShopController());

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        centerTitle: true,
        title: const Text(
          "Thông tin cửa hàng",
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Form(
            key: controller.formStateKeyShop,
            child: Column(
              children: [
                Container(
                  child: Image.network(
                      "https://xemaynghean.com/wp-content/uploads/2019/03/50272791_137653880484230_7970165378053570560_n-1024x554.jpg"),
                ),
                Padding(
                    padding: EdgeInsets.only(left: 10.0.w),
                    child: Row(
                      children: [
                        Text(
                          "Tên",
                          style: TextStyle(
                            color: kTextColor_gray,
                          ),
                        ),
                        Expanded(
                          child: TextFormField(
                            cursorColor: Colors.black,
                            textAlign: TextAlign.end,
                            onSaved: (value) {
                              // if()
                            },
                            decoration: InputDecoration(
                                // contentPadding: EdgeInsets.symmetric(vertical: 15.0),
                                border: InputBorder.none,
                                hintText: "Cửa hàng xe máy Hùng Sơn",
                                hintStyle: TextStyle(color: Colors.black),
                                suffixIcon: Container(
                                  height: 10.0.h,
                                  width: 10.0.w,
                                  child: Icon(
                                    Icons.arrow_forward_ios,
                                    size: 12,
                                    color: kTextColor_gray,
                                  ),
                                )),
                          ),
                        )
                      ],
                    )),
                Divider(
                  indent: 10,
                ),
                Padding(
                    padding: EdgeInsets.only(
                      left: 10.0.w,
                    ),
                    child: Row(
                      children: [
                        Text(
                          "Link",
                          style: TextStyle(
                            color: kTextColor_gray,
                          ),
                        ),
                        Expanded(
                          child: TextFormField(
                            cursorColor: Colors.black,
                            textAlign: TextAlign.end,
                            onSaved: (value) {
                              // if()
                            },
                            decoration: InputDecoration(
                                // contentPadding: EdgeInsets.symmetric(vertical: 15.0),
                                border: InputBorder.none,
                                hintText: "cuahangxemayhungson",
                                hintStyle: TextStyle(color: Colors.black),
                                suffixIcon: Container(
                                  height: 10.0.h,
                                  width: 10.0.w,
                                  child: Icon(
                                    Icons.arrow_forward_ios,
                                    size: 12,
                                    color: kTextColor_gray,
                                  ),
                                )),
                          ),
                        )
                      ],
                    )),
                Divider(
                  indent: 10,
                ),
                Padding(
                    padding: EdgeInsets.only(
                      left: 10.0.w,
                    ),
                    child: Row(
                      children: [
                        Text(
                          "Số điện thoại",
                          style: TextStyle(
                            color: kTextColor_gray,
                          ),
                        ),
                        Expanded(
                          child: TextFormField(
                            cursorColor: Colors.black,
                            textAlign: TextAlign.end,
                            onSaved: (value) {
                              // if()
                            },
                            decoration: InputDecoration(
                                // contentPadding: EdgeInsets.symmetric(vertical: 15.0),
                                border: InputBorder.none,
                                hintText: "0978666555",
                                hintStyle: TextStyle(color: Colors.black),
                                suffixIcon: Container(
                                  height: 10.0.h,
                                  width: 10.0.w,
                                  child: Icon(
                                    Icons.arrow_forward_ios,
                                    size: 12,
                                    color: kTextColor_gray,
                                  ),
                                )),
                          ),
                        )
                      ],
                    )),
                Divider(
                  indent: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Container(
                      padding: EdgeInsets.only(left: 10.0.w, right: 5.0.w),
                      height: 50,
                      width: widthdt / 2 - 1.0.w,
                      child: InkWell(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Expanded(
                              child: Text("Giờ mở",
                                  style: TextStyle(
                                      fontSize: 15, color: kTextColor_gray)),
                            ),
                            Obx(
                              () => Text(
                                  controller.open_hours.value == ""
                                      ? "08:00"
                                      : controller.open_hours.value,
                                  style: TextStyle(fontSize: 15)),
                            ),
                            Icon(
                              Icons.access_time,
                              color: Color.fromARGB(255, 0, 74, 165),
                              size: 15,
                            ),
                          ],
                        ),
                        onTap: () {
                          DatePicker.showTimePicker(context,
                              showTitleActions: true, onConfirm: (s) {
                            controller.open_hours.value =
                                DateFormat('HH:mm').format(s).toString();
                          },
                              currentTime: DateTime.now(),
                              locale: LocaleType.vi);
                        },
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(top: 1.0.h, bottom: 1.0.h),
                      color: Colors.black12,
                      width: 1.0.w,
                      height: 50.0.h,
                    ),
                    Container(
                      padding: EdgeInsets.only(left: 5.0.w, right: 15.0.w),
                      height: 50,
                      width: widthdt / 2 - 1.0.w,
                      child: InkWell(
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Expanded(
                              child: Text("Giờ đóng",
                                  style: TextStyle(
                                      fontSize: 15, color: kTextColor_gray)),
                            ),
                            Obx(
                              () => Text(
                                  controller.closer_hours.value == ""
                                      ? "20:00"
                                      : controller.closer_hours.value,
                                  style: TextStyle(fontSize: 15)),
                            ),
                            Icon(
                              Icons.access_time,
                              color: Color.fromARGB(255, 0, 74, 165),
                              size: 15,
                            ),
                          ],
                        ),
                        onTap: () {
                          DatePicker.showTimePicker(context,
                              showTitleActions: true, onConfirm: (s) {
                            controller.closer_hours.value =
                                DateFormat('HH:mm').format(s).toString();
                          },
                              currentTime: DateTime.now(),
                              locale: LocaleType.vi);
                        },
                      ),
                    ),
                  ],
                ),
                Container(
                  color: Color.fromARGB(255, 243, 242, 255),
                  height: 15.0.h,
                ),
                Container(
                  padding: EdgeInsets.only(left: 10.0.w, right: 20.0.w),
                  height: 50,
                  child: InkWell(
                    child: Row(
                      children: [
                        Expanded(
                          child: Text(
                            "Địa chỉ",
                            style:
                                TextStyle(fontSize: 15, color: kTextColor_gray),
                          ),
                        ),
                        Obx(
                          () => Text(
                              controller.provinceShop.value == ""
                                  ? "Chọn Tỉnh/Thành phố"
                                  : controller.provinceShop.value,
                              style: TextStyle(fontSize: 15)),
                        ),
                        Icon(
                          Icons.navigate_next,
                          color: kTextColor_gray,
                          size: 20,
                        ),
                      ],
                    ),
                    onTap: () {
                      var data = Get.toNamed(Routes.SELECT_REGION, arguments: {
                        "title": "Chọn tỉnh/ thành phố",
                        "regions": controller.provinceShops
                      });
                      if (data != null) {
                        data.then((value) {
                          controller.provinceShop.value = value['name'];
                          controller.updateDistrictShop(value['id']);
                        });
                      }
                    },
                  ),
                ),
                Divider(
                  indent: 10,
                ),
                Container(
                  padding: EdgeInsets.only(left: 10.0.w, right: 20.0.w),
                  height: 50.0.h,
                  child: InkWell(
                    child: Row(
                      children: [
                        Expanded(
                          child: Text("Quận/Huyện",
                              style: TextStyle(
                                  fontSize: 15, color: kTextColor_gray)),
                        ),
                        Obx(
                          () => Text(
                              controller.districtShop.value == ""
                                  ? "Chọn Quận/Huyện"
                                  : controller.districtShop.value,
                              style: TextStyle(fontSize: 15)),
                        ),
                        Icon(
                          Icons.navigate_next,
                          color: kTextColor_gray,
                          size: 20,
                        ),
                      ],
                    ),
                    onTap: () {
                      var data = Get.toNamed(Routes.SELECT_REGION, arguments: {
                        "title": "Chọn Quận/Huyện",
                        "regions": controller.districtShops
                      });
                      if (data != null) {
                        data.then((value) {
                          controller.districtShop.value = value['name'];
                          controller.updateCommuneShop(value['id']);
                        });
                      }
                    },
                  ),
                ),
                Divider(
                  indent: 10,
                ),
                Container(
                  padding: EdgeInsets.only(left: 10.0.w, right: 20.0.w),
                  height: 50.0.h,
                  child: InkWell(
                    child: Row(
                      children: [
                        Expanded(
                          child: Text("Xã/Phường",
                              style: TextStyle(
                                  fontSize: 15, color: kTextColor_gray)),
                        ),
                        Obx(
                          () => Text(
                              controller.communeShop.value == ""
                                  ? "Chọn Xã/Phường"
                                  : controller.communeShop.value,
                              style: TextStyle(fontSize: 15)),
                        ),
                        Icon(
                          Icons.navigate_next,
                          color: kTextColor_gray,
                          size: 20,
                        ),
                      ],
                    ),
                    onTap: () {
                      var data = Get.toNamed(Routes.SELECT_REGION, arguments: {
                        "title": "Chọn Xã/Phường",
                        "regions": controller.communeShops
                      });
                      if (data != null) {
                        data.then((value) {
                          controller.communeShop.value = value['name'];
                          controller.updateCommuneShop(value['id']);
                        });
                      }
                    },
                  ),
                ),
                Divider(
                  indent: 10,
                ),
                Padding(
                  padding: EdgeInsets.only(left: 10, right: 10),
                  child: Row(
                    children: [
                      Text(
                        "Số nhà, tên đường",
                        style: TextStyle(color: kTextColor_gray),
                      ),
                      Expanded(
                          child: TextFormField(
                        cursorColor: kTextColor_gray,
                        textAlign: TextAlign.end,
                        onSaved: (value) {},
                        decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: "Nhập số nhà, tên đường",
                            hintStyle: TextStyle(
                              color: Colors.black,
                            )),
                      ))
                    ],
                  ),
                ),
                Container(
                  color: Colors.white,
                  height: 300,
                  child: Image.network(
                      "https://media-cdn-v2.laodong.vn/Storage/newsportal/2018/11/29/643923/Screen-Shot-2018-11-.png"),
                ),
                Container(
                  padding: EdgeInsets.only(left: 10.0.w, right: 15.0.w),
                  height: 50,
                  child: InkWell(
                    child: Row(
                      children: [
                        Expanded(
                          child: Text("Danh mục ngành nghề chính",
                              style: TextStyle(fontSize: 15, color: kTextColor_gray)),
                        ),
                        ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            primary: Colors.red,
                          ),
                          child: Text(
                            "Mua bán xe",
                            style: TextStyle(color: Colors.white),
                          ),
                          onPressed: () {},
                        ),
                      ],
                    ),
                    onTap: () {},
                  ),
                ),
                Divider(
                  indent: 10,
                ),
                Container(
                  padding: EdgeInsets.only(left: 10.0.w, right: 20.0.w),
                  height: 50,
                  child: InkWell(
                    child: Row(
                      children: [
                        Expanded(
                          child: Text(
                            "Danh mục ngành nghề",
                            style:
                            TextStyle(fontSize: 15, color: kTextColor_gray),
                          ),
                        ),
                        Text(
                            "Chọn danh mục"/*controllerCate.chooseCategory.toString()*/,
                            style: TextStyle(fontSize: 15)),
                        Icon(
                          Icons.navigate_next,
                          color: kTextColor_gray,
                          size: 20,
                        ),
                      ],
                    ),
                    onTap: () {
                      Get.to(()=>const ChonDanhMuc());
                    },
                  ),
                ),
                Divider(
                  indent: 10,
                ),
                Padding(
                    padding: EdgeInsets.only(
                      left: 10.0.w,
                    ),
                    child: Row(
                      children: [
                        Text(
                          "Loại cửa hàng",
                          style: TextStyle(
                            color: kTextColor_gray,
                          ),
                        ),
                        Expanded(
                          child: TextFormField(
                            cursorColor: Colors.black,
                            textAlign: TextAlign.end,
                            onSaved: (value) {
                              // if()
                            },
                            decoration: InputDecoration(
                              // contentPadding: EdgeInsets.symmetric(vertical: 15.0),
                                border: InputBorder.none,
                                hintText: "Xe máy",
                                hintStyle: TextStyle(color: Colors.black),
                                suffixIcon: Container(
                                  height: 10.0.h,
                                  width: 10.0.w,
                                  child: Icon(
                                    Icons.arrow_forward_ios,
                                    size: 12,
                                    color: kTextColor_gray,
                                  ),
                                )),
                          ),
                        )
                      ],
                    )),
                Divider(
                  indent: 10,
                ),
                Container(
                  padding: EdgeInsets.only(left: 10.0.w,right: 10.0.w),
                  height: 145,
                  color: Colors.white,
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Text("Giới thiệu cửa hàng", style: TextStyle(color: kTextColor_gray, fontSize: 15),),
                          Container(
                            margin: new EdgeInsets.only(right: 20),
                            child: ImageIcon(
                              AssetImage("assets/Icon/icon_butchi.png"),
                            ),
                          ),
                        ],
                      ),
                      Expanded(
                        child: TextField(
                        maxLines: 5,
                        style: TextStyle(color: Colors.black),
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: "Nhập giới thiệu cửa hàng",
/*                          fillColor: Colors.red,*/

                        ),
                      ),)
                    ],
                  ),
                ),
                Divider(
                  indent: 10,
                ),
                Padding(
                    padding: EdgeInsets.only(
                      left: 10.0.w,
                    ),
                    child: Row(
                      children: [
                        Text(
                          "Loại giao diện",
                          style: TextStyle(
                            color: kTextColor_gray,
                          ),
                        ),
                        Expanded(
                          child: TextFormField(
                            cursorColor: Colors.black,
                            textAlign: TextAlign.end,
                            onSaved: (value) {
                              // if()
                            },
                            decoration: InputDecoration(
                              // contentPadding: EdgeInsets.symmetric(vertical: 15.0),
                                border: InputBorder.none,
                                hintText: "NCI CASYNET",
                                hintStyle: TextStyle(color: Colors.black),
                                suffixIcon: Container(
                                  height: 10.0.h,
                                  width: 10.0.w,
                                  child: Icon(
                                    Icons.arrow_forward_ios,
                                    size: 12,
                                    color: kTextColor_gray,
                                  ),
                                )),
                          ),
                        )
                      ],
                    )),
                Divider(
                  indent: 10,
                ),
                Padding(
                    padding: EdgeInsets.only(
                      left: 10.0.w,
                    ),
                    child: Row(
                      children: [
                        Text(
                          "SĐT Zalo",
                          style: TextStyle(
                            color: kTextColor_gray,
                          ),
                        ),
                        Expanded(
                          child: TextFormField(
                            cursorColor: Colors.black,
                            textAlign: TextAlign.end,
                            onSaved: (value) {
                              // if()
                            },
                            decoration: InputDecoration(
                              // contentPadding: EdgeInsets.symmetric(vertical: 15.0),
                                border: InputBorder.none,
                                hintText: "Nhập số điện thoại",
                                hintStyle: TextStyle(color: Colors.black),
                                suffixIcon: Container(
                                  height: 10.0.h,
                                  width: 10.0.w,
                                  child: Icon(
                                    Icons.arrow_forward_ios,
                                    size: 12,
                                    color: kTextColor_gray,
                                  ),
                                )),
                          ),
                        )
                      ],
                    )),
                Divider(
                  indent: 10,
                ),
                Padding(
                    padding: EdgeInsets.only(
                      left: 10.0.w,
                    ),
                    child: Row(
                      children: [
                        Text(
                          "Mã cộng tác viên",
                          style: TextStyle(
                            color: kTextColor_gray,
                          ),
                        ),
                        Expanded(
                          child: TextFormField(
                            cursorColor: Colors.black,
                            textAlign: TextAlign.end,
                            onSaved: (value) {
                              // if()
                            },
                            decoration: InputDecoration(
                              // contentPadding: EdgeInsets.symmetric(vertical: 15.0),
                                border: InputBorder.none,
                                hintText: "bht123456",
                                hintStyle: TextStyle(color: Colors.black),
                                suffixIcon: Container(
                                  height: 10.0.h,
                                  width: 10.0.w,
                                  child: Icon(
                                    Icons.arrow_forward_ios,
                                    size: 12,
                                    color: kTextColor_gray,
                                  ),
                                )),
                          ),
                        )
                      ],
                    )),

                Container(
                  height: 50,
                  margin: new EdgeInsets.only(
                      left: 10, right: 10, bottom: 20, top: 20),
                  width: widthdt,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      primary: Color.fromARGB(255,222, 180, 0),
                    ),
                    child: Text(
                      "Lưu thông tin",
                      style: TextStyle(fontSize: 16, color: Colors.white),
                    ),
                    onPressed: () {},
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      // bottomNavigationBar: Bottommenu(),
    );
  }
}
