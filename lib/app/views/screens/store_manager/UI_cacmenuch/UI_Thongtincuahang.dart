import 'package:app_casynet/app/controller/store/new_address_store_controller.dart';
import 'package:app_casynet/app/routes/app_pages.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class ThongTinCuaHang extends StatelessWidget {
  const ThongTinCuaHang({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    final widthdt = MediaQuery.of(context).size.width;

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
          child: Container(
            color: Colors.white,
            child: ListView(
              physics: NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              children: [
                Container(
                  child: Image.network(
                      "https://xemaynghean.com/wp-content/uploads/2019/03/50272791_137653880484230_7970165378053570560_n-1024x554.jpg"),
                ),
                Container(
                  padding: EdgeInsets.only(left: 10.0.w,right: 10.0.w),
                  height: 50,
                  child: InkWell(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Expanded(
                          child: Text(
                            "Tên",
                            style: TextStyle(fontSize: 15),
                          ),
                        ),
                        Text("Cửa hàng xe máy Hùng Sơn",
                            style: TextStyle(fontSize: 15)),
                        Icon(Icons.navigate_next),
                      ],
                    ),
                    onTap: () {},
                  ),
                ),
                Container(
                    padding: EdgeInsets.only(left: 10.0.w,right: 10.0.w),
                    height: 50,
                    child: InkWell(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Expanded(
                            child: Text("Link", style: TextStyle(fontSize: 15)),
                          ),
                          Text("cuahangxemayhungson",
                              style: TextStyle(fontSize: 15)),
                          Icon(Icons.navigate_next),
                        ],
                      ),
                      onTap: () {},
                    )),
                Container(
                    padding: EdgeInsets.only(left: 10.0.w,right: 10.0.w),
                    height: 50,
                    child: InkWell(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Expanded(
                            child: Text("Số diện thoại",
                                style: TextStyle(fontSize: 15)),
                          ),
                          Text("0974745553", style: TextStyle(fontSize: 15)),
                          Icon(Icons.navigate_next),
                        ],
                      ),
                      onTap: () {

                      },
                    )),
                /*SizedBox(
                  height: 50,
                  child:
                ),*/

                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Container(
                      padding: EdgeInsets.only(left: 10.0.w),
                      height: 50,
                      width: widthdt/2-1.0.w,
                      color: Colors.white,
                      child: InkWell(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Expanded(child: Text("Giờ mở", style: TextStyle(fontSize: 15)),),
                            Obx(() => Text(controller.open_hours.value == "" ? "08:00" : controller.open_hours.value, style: TextStyle(fontSize: 15)),),
                            Container(
                              child: ImageIcon(
                                AssetImage("assets/Icon/icon_dongho.png"),
                                color: Colors.blue,
                              ),
                            ),
                          ],
                        ),
                        onTap: () {
                          DatePicker.showTimePicker(
                            context,
                            showTitleActions: true,
                            onConfirm: (s){
                              controller.open_hours.value = DateFormat('HH:mm').format(s).toString();
                            },
                            currentTime: DateTime.now(),
                            locale: LocaleType.vi
                          );
                        },
                      ),
                    ),
                    SizedBox(

                    ),
                    Container(
                      padding: EdgeInsets.only(right: 10.0.w),
                      height: 50,
                      width: widthdt/2 -1.0.w,
                      color: Colors.white,
                      child: InkWell(
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Expanded(
                              child:Text("Giờ đóng", style: TextStyle(fontSize: 15)),
                            ),

                            Obx(() => Text(controller.closer_hours.value == "" ? "20:00" : controller.closer_hours.value, style: TextStyle(fontSize: 15)),),
                            ImageIcon(
                              AssetImage("assets/Icon/icon_dongho.png"),
                              color: Colors.blue,
                            ),
                          ],
                        ),
                        onTap: () {
                          DatePicker.showTimePicker(
                              context,
                              showTitleActions: true,
                              onConfirm: (s){
                                controller.closer_hours.value = DateFormat('HH:mm').format(s).toString();
                              },
                              currentTime: DateTime.now(),
                              locale: LocaleType.vi
                          );
                        },
                      ),
                    ),
                  ],
                ),
                Container(
                  margin: new EdgeInsets.only(top: 10),
                  height: 50,
                  child: InkWell(
                    child: Row(
                      children: [
                        Expanded(
                          child: Text("Địa chỉ", style: TextStyle(fontSize: 15)),
                        ),
                        Obx(()=> Text(controller.provinceShop.value == "" ? "Chọn Tỉnh/Thành phố" : controller.provinceShop.value,
                            style: TextStyle(fontSize: 15)),),
                        Icon(Icons.navigate_next),
                      ],
                    ),
                    onTap: () {
                      var data = Get.toNamed(Routes.SELECT_REGION, arguments: {
                        "title": "Chọn tỉnh/ thành phố", "regions": controller.provinceShops
                      });
                      if(data != null){
                        data.then((value) {
                          controller.provinceShop.value = value['name'];
                          controller.updateDistrictShop(value['id']);
                          controller.districtShop.value == " " ;
                          controller.communeShop.value == " " ;
                        });
                      }
                    },
                  ),

                ),
                SizedBox(
                  height: 50,
                  child: InkWell(
                    child: Row(
                      children: [
                        Expanded(
                          child: Text("Quận/Huyện", style: TextStyle(fontSize: 15)),
                        ),
                        Obx(()=>Text(controller.districtShop.value == "" ? "Chọn Quận/Huyện" : controller.districtShop.value,
                            style: TextStyle(fontSize: 15)),),
                        Icon(Icons.navigate_next),
                      ],
                    ),
                    onTap: () {
                      var data = Get.toNamed(Routes.SELECT_REGION, arguments: {
                        "title": "Chọn Quận/Huyện", "regions": controller.districtShops
                      });
                      if(data != null){
                        data.then((value) {
                          controller.districtShop.value = value['name'];
                          controller.updateCommuneShop(value['id']);
                          controller.communeShop.value == " ";
                        });
                      }
                    },
                  ),

                ),
                Container(
                  padding: EdgeInsets.only(left: 10.0.w,right: 10.0.w),
                  height: 50,
                  child: InkWell(
                    child: Row(
                      children: [
                        Expanded(
                          child: Text("Xã/Phường", style: TextStyle(fontSize: 15)),
                        ),
                        Obx(()=> Text(controller.communeShop.value == "" ? "Chọn Xã/Phường" : controller.communeShop.value,
                            style: TextStyle(fontSize: 15)),),
                        Icon(Icons.navigate_next),
                      ],
                    ),
                    onTap: () {
                      var data = Get.toNamed(Routes.SELECT_REGION, arguments: {
                        "title": "Chọn Xã/Phường", "regions": controller.communeShops
                      });
                      if(data != null){
                        data.then((value) {
                          controller.communeShop.value = value['name'];
                          controller.updateCommuneShop(value['id']);
                        });
                      }
                    },
                  ),

                ),
                Container(
                  padding: EdgeInsets.only(left: 10.0.w,right: 10.0.w),
                  height: 50,
                  child: InkWell(
                    child: Row(
                      children: [
                        Expanded(
                          child: Text("Số nhà, tên đường", style: TextStyle(fontSize: 15)),
                        ),
                        Container(
                          width: 150,
                          child: TextField(
                            decoration: InputDecoration(
                              border: InputBorder.none,
                              hintText: "Nhập Số nhà, tên đường",
                            ),
                          ),
                        ),
                        Icon(Icons.navigate_next),
                      ],
                    ),
                    onTap: () {

                    },
                  ),

                ),
                Container(
                  color: Colors.white,
                  height: 300,
                  child: Image.network("https://media-cdn-v2.laodong.vn/Storage/newsportal/2018/11/29/643923/Screen-Shot-2018-11-.png"),
                ),
                Container(
                  padding: EdgeInsets.only(left: 10.0.w,right: 10.0.w),
                  height: 50,
                  child: InkWell(
                    child: Row(
                      children: [
                        Expanded(
                          child: Text("Danh mục ngành nghề chính", style: TextStyle(fontSize: 15)),
                        ),
                        ElevatedButton(
                          /*color: Colors.red,*/
                          child: Text("Mua bán xe",style: TextStyle(color: Colors.white),),
                          onPressed: () {

                          },
                        ),
                      ],
                    ),
                    onTap: () {

                    },
                  ),
                ),
                Container(
                  height: 50,
                  child: RaisedButton(
                    color: Colors.white,
                    child: Row(
                      children: [
                        Expanded(
                          child: Text("Danh mục ngành nghề", style: TextStyle(fontSize: 15)),
                        ),
                        Icon(Icons.navigate_next),
                      ],
                    ),
                    onPressed: () {

                    },
                  ),

                ),
                SizedBox(
                  height: 50,
                  child: RaisedButton(
                    color: Colors.white,
                    child: Row(
                      children: [
                        Expanded(
                          child: Text("Loại cửa hàng", style: TextStyle(fontSize: 15)),
                        ),
                        Text("Xe máy",style: TextStyle(fontSize: 15)),
                        Icon(Icons.navigate_next),
                      ],
                    ),
                    onPressed: () {

                    },
                  ),

                ),
                Container(
                  height: 145,
                  color: Colors.white,
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Text("Giới thiệu cửa hàng"),
                          Container(
                            margin: new EdgeInsets.only(right: 20),
                            child: ImageIcon(AssetImage("assets/Icon/icon_butchi.png"),),
                          ),

                        ],
                      ),
                      SingleChildScrollView(
                        child: TextField(
                          maxLines: 5,
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: "Nhập giới thiệu cửa hàng",
                          ),
                        ),
                      ),

                    ],
                  ),
                ),
                Container(
                  margin: new EdgeInsets.only(top: 10),
                  height: 50,
                  child: RaisedButton(
                    color: Colors.white,
                    child: Row(
                      children: [
                        Expanded(child: Text("Loại giao diện",style: TextStyle(fontSize: 15))),
                        Text("NCI CASYNET",style: TextStyle(fontSize: 15)),
                        Icon(Icons.navigate_next),
                      ],
                    ),
                    onPressed: () {

                    },
                  ),
                ),
                SizedBox(
                  height: 50,
                  child: RaisedButton(
                    color: Colors.white,
                    child: Row(
                      children: [
                        Expanded(child: Text("SĐT Zalo",style: TextStyle(fontSize: 15))),
                        Container(
                          width: 150,
                          child: TextField(
                            decoration: InputDecoration(
                              border: InputBorder.none,
                              hintText: "Nhập số điện thoại",
                            ),
                          ),
                        ),
                        Icon(Icons.navigate_next),
                      ],
                    ),
                    onPressed: () {

                    },
                  ),
                ),
                SizedBox(
                  height: 50,
                  child: RaisedButton(
                    color: Colors.white,
                    child: Row(
                      children: [
                        Expanded(child: Text("Mã cộng tác viên",style: TextStyle(fontSize: 15))),
                        Text("bht123456",style: TextStyle(fontSize: 15)),
                        Icon(Icons.navigate_next),
                      ],
                    ),
                    onPressed: () {

                    },
                  ),
                ),
                Container(
                  height: 50,
                  margin: new EdgeInsets.only(left: 10,right: 10,bottom: 20,top: 20),
                  width: widthdt,
                  child: RaisedButton(
                    color: Colors.amber,
                    child: Text("Lưu thông tin",style: TextStyle(fontSize: 16,color: Colors.white),),
                    onPressed: () {
                    },
                  ),
                )
              ],
            ),
          ),
        ),
      ),
      // bottomNavigationBar: Bottommenu(),
    );
  }
}