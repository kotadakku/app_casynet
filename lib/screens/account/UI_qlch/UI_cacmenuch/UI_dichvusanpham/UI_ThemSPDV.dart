import 'dart:io';

import 'package:app_casynet/screens/account/UI_qlch/UI_cacmenuch/UI_dichvusanpham/UI_Chonxuatxu.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'UI_Chondanhmuc.dart';
import 'UI_Chonloaisanpham.dart';
import 'UI_Dichvusanpham.dart';
import 'package:flutter_switch/flutter_switch.dart';
import 'package:image_picker/image_picker.dart';

class themspdv extends StatelessWidget {
  var _date = new DateTime.now().obs;
  final clsp = Get.put(chonloaisp());
  final chonqgs = Get.put(chonqg());
  final tensanpham = TextEditingController();
  var demtensanpham = 0.obs;
  var status = false.obs;
  var statushtsp = false.obs;
  var statushttc = false.obs;
  var textst = "không".obs;
  var textsthtsp = "không".obs;
  var textsthttc = "không".obs;
  var chon = "".obs;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          "Thêm Dịch vụ/ Sản phẩm",
          style: TextStyle(color: Colors.black),
        ),
        leading: Container(
          child: IconButton(
            icon: Icon(Icons.arrow_back_rounded),
            color: Colors.amberAccent,
            onPressed: () {
              Get.to(dichvusanpham());
            },
          ),
        ),
      ),
      body: themspdvs(context),
    );
  }

  Widget themspdvs(BuildContext context) {
    File file = new File(
        "/data/user/0/com.example.app_casynet/cache/image_picker2429502788362259276.jpg");
    List<dynamic> imagepicker = [].obs;
    var x = "".obs;
    File imagepk;
    Future pickimage() async {
      final image = await ImagePicker().pickImage(
        source: ImageSource.gallery,
      );
      if (image != null) {
        imagepk = File(image.path);
        imagepicker.add(imagepk);
      }
    }

    return Container(
      color: Color.fromRGBO(200, 200, 200, 200),
      child: Obx(
        () => SingleChildScrollView(
          child: ListView(
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            children: [
              Container(
                margin: EdgeInsets.only(bottom: 10),
                color: Colors.white,
                height: 100,
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: [
                      Obx(
                        () => ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: imagepicker.length,
                          shrinkWrap: true,
                          itemBuilder: (context, index) {
                            return Row(
                              children: [
                                Stack(
                                  overflow: Overflow.visible,
                                  children: [
                                    Container(
                                      margin: EdgeInsets.only(
                                          bottom: 5, left: 5, top: 5),
                                      color: Colors.red,
                                      child: Image.file(
                                        imagepicker[index],
                                        width: 100,
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                    Positioned(
                                      width: 30,
                                      height: 30,
                                      left: 80,
                                      child: Container(
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(20.0),
                                          color: Color.fromARGB(
                                              255, 179, 177, 177),
                                          border: Border.all(
                                            width: 1,
                                            style: BorderStyle.solid,
                                          ),
                                        ),
                                        child: IconButton(
                                          icon: Icon(
                                            Icons.close,
                                            size: 12,
                                          ),
                                          onPressed: () {
                                            imagepicker.removeAt(index);
                                          },
                                        ),
                                      ),
                                    )
                                  ],
                                ),

                                // Text(x.toString()),
                              ],
                            );
                          },
                        ),
                      ),
                      Center(
                        child: Container(
                          margin: EdgeInsets.only(left: 20),
                          width: 110,
                          height: 90,
                          child: OutlinedButton(
                            style: ElevatedButton.styleFrom(
                              side: BorderSide(
                                color: Colors.amber,
                                style: BorderStyle.solid,
                              ),
                            ),
                            child: Text("Thêm ảnh/ video",
                                maxLines: 2, textAlign: TextAlign.center),
                            onPressed: () {
                              x.value = x.value + " ";
                              pickimage();
                            },
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Container(
                height: 90,
                color: Colors.white,
                margin: EdgeInsets.only(bottom: 10),
                child: Column(
                  children: [
                    Container(
                      margin: EdgeInsets.only(top: 10, right: 10, left: 10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            child: Text(
                              "Tên sản phẩm",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 16,
                              ),
                            ),
                          ),
                          Container(
                            child: Text(demtensanpham.toString() + "/120"),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(left: 10, right: 10),
                      child: TextField(
                        decoration: InputDecoration(
                          hintText: "Nhập tên sản phẩm",
                          counterText: "",
                          border: InputBorder.none,
                        ),
                        maxLength: 120,
                        controller: tensanpham,
                        onChanged: (text) {
                          demtensanpham.value = text.length;
                        },
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.only(bottom: 10),
                color: Colors.white,
                height: 90,
                child: Column(
                  children: [
                    Container(
                      margin: EdgeInsets.only(top: 10, left: 10, right: 10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            child: Text(
                              "Mô tả sản phẩm",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 16,
                              ),
                            ),
                          ),
                          Container(
                            child: Text(demtensanpham.toString() + "/3000"),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(left: 10, right: 10),
                      child: TextField(
                        decoration: InputDecoration(
                          hintText: "Nhập mô tả sản phẩm",
                          counterText: "",
                          border: InputBorder.none,
                        ),
                        maxLength: 3000,
                        controller: tensanpham,
                        onChanged: (text) {
                          demtensanpham.value = text.length;
                        },
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                height: 50,
                decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border.all(
                    color: Color.fromRGBO(200, 200, 200, 200),
                  ),
                ),
                child: Container(
                  margin: EdgeInsets.only(right: 10, left: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: Text("Mã sản phẩm(SKU)"),
                      ),
                      Text("Mã sản phẩm(SKU)"),
                    ],
                  ),
                ),
              ),
              Container(
                height: 50,
                decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border.all(
                    color: Color.fromRGBO(200, 200, 200, 200),
                  ),
                ),
                child: Container(
                  margin: EdgeInsets.only(right: 10, left: 10),
                  child: Row(
                    children: [
                      Expanded(child: Text("Yêu cầu hẹn trước")),
                      Text(textst.toString()),
                      Container(
                        margin: EdgeInsets.only(left: 10),
                        child: Obx(
                          () => FlutterSwitch(
                            width: 60.0,
                            value: status.value,
                            padding: 8.0,
                            onToggle: (val) {
                              status.value = !status.value;
                              if (status.value == true) {
                                textst.value = "có";
                              } else {
                                textst.value = "không";
                              }
                              print(status);
                            },
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Container(
                height: 50,
                decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border.all(
                    color: Color.fromRGBO(200, 200, 200, 200),
                  ),
                ),
                child: Container(
                  margin: EdgeInsets.only(right: 10, left: 10),
                  child: Row(
                    children: [
                      Expanded(child: Text("Số lượng nhập kho")),
                      Text("0"),
                    ],
                  ),
                ),
              ),
              Container(
                height: 50,
                decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border.all(
                    color: Color.fromRGBO(200, 200, 200, 200),
                  ),
                ),
                child: Container(
                  margin: EdgeInsets.only(left: 10),
                  child: Row(
                    children: [
                      Expanded(child: Text("Ngày hết hạn")),
                      OutlinedButton(
                        style: ElevatedButton.styleFrom(
                          side: BorderSide(color: Colors.white),
                        ),
                        child: Row(
                          children: [
                            Container(
                              child: Obx(() => Text(_date.value.day.toString() +
                                  "/" +
                                  _date.value.month.toString() +
                                  "/" +
                                  _date.value.year.toString())),
                            ),
                            Container(
                              margin: EdgeInsets.only(left: 10),
                              child: ImageIcon(
                                  AssetImage("assets/Icon/icon_date.png")),
                            ),
                          ],
                        ),
                        onPressed: () async {
                          DateTime? newdate = await showDatePicker(
                            context: context,
                            initialDate: _date.value,
                            firstDate: DateTime(2000),
                            lastDate: DateTime(2025),
                          );
                          if (newdate != null) {
                            _date.value = newdate;
                          }
                        },
                      ),
                    ],
                  ),
                ),
              ),
              Container(
                height: 50,
                decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border(
                      bottom: BorderSide(
                    color: Color.fromRGBO(200, 200, 200, 200),
                  )),
                ),
                child: Container(
                  margin: EdgeInsets.only(right: 10, left: 10),
                  child: Row(
                    children: [
                      Expanded(child: Text("Giá")),
                      Text("0"),
                      Container(
                        margin: EdgeInsets.only(left: 10),
                        child: RaisedButton(
                          color: Colors.red,
                          child: Text("Giá khuyến mãi",
                              style: TextStyle(color: Colors.white)),
                          onPressed: () {},
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Container(
                height: 50,
                decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border.all(
                    color: Color.fromRGBO(200, 200, 200, 200),
                  ),
                ),
                child: Container(
                  margin: EdgeInsets.only(right: 10, left: 10),
                  child: Row(
                    children: [
                      Expanded(
                        child: Text("Số lượng còn lại"),
                      ),
                    ],
                  ),
                ),
              ),
              Container(
                height: 50,
                color: Colors.white,
                child: RaisedButton(
                  color: Colors.white,
                  child: Row(
                    children: [
                      Expanded(child: Text("Tình trạng kho hàng")),
                      Text("Còn hàng"),
                      Icon(Icons.navigate_next),
                    ],
                  ),
                  onPressed: () {},
                ),
              ),
              Container(
                height: 50,
                color: Colors.white,
                child: RaisedButton(
                  color: Colors.white,
                  child: Row(
                    children: [
                      Expanded(child: Text("Danh mục")),
                      Text("Lựa chọn danh mục"),
                      Icon(Icons.navigate_next),
                    ],
                  ),
                  onPressed: () {
                    Get.to(chondanhmuc());
                  },
                ),
              ),
              Container(
                height: 50,
                color: Colors.white,
                child: RaisedButton(
                  color: Colors.white,
                  child: Row(
                    children: [
                      Expanded(child: Text("Hiện thị")),
                      Text("Danh mục, tìm kiếm"),
                      Icon(Icons.navigate_next),
                    ],
                  ),
                  onPressed: () {},
                ),
              ),
              Container(
                height: 50,
                color: Colors.white,
                child: RaisedButton(
                  color: Colors.white,
                  child: Row(
                    children: [
                      Expanded(child: Text("Xuất xứ")),
                      Text(chonqgs.quocgia.toString()),
                      Icon(Icons.navigate_next),
                    ],
                  ),
                  onPressed: () {
                    Get.to(chonxuatxu());
                  },
                ),
              ),
              Container(
                height: 50,
                color: Colors.white,
                child: RaisedButton(
                  color: Colors.white,
                  child: Row(
                    children: [
                      Expanded(child: Text("Loại sản phẩm")),
                      Text(clsp.lsp.toString()),
                      Icon(Icons.navigate_next),
                    ],
                  ),
                  onPressed: () {
                    Get.to(chonloaisanpham());
                  },
                ),
              ),
              Container(
                height: 50,
                decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border.all(
                    color: Color.fromRGBO(200, 200, 200, 200),
                  ),
                ),
                child: Container(
                  margin: EdgeInsets.only(right: 10, left: 10),
                  child: Row(
                    children: [
                      Expanded(child: Text("Hiện thị sản phẩm")),
                      Text(textsthtsp.toString()),
                      Container(
                        margin: EdgeInsets.only(left: 10),
                        child: Obx(
                          () => FlutterSwitch(
                            width: 60.0,
                            value: statushtsp.value,
                            padding: 8.0,
                            onToggle: (val) {
                              statushtsp.value = !statushtsp.value;
                              if (statushtsp.value == true) {
                                textsthtsp.value = "có";
                              } else {
                                textsthtsp.value = "không";
                              }
                            },
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Container(
                height: 50,
                decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border.all(
                    color: Color.fromRGBO(200, 200, 200, 200),
                  ),
                ),
                child: Container(
                  margin: EdgeInsets.only(right: 10, left: 10),
                  child: Row(
                    children: [
                      Expanded(child: Text("Hiện thị ở trang chính")),
                      Text(textsthttc.toString()),
                      Container(
                        margin: EdgeInsets.only(left: 10),
                        child: Obx(
                          () => FlutterSwitch(
                            width: 60.0,
                            value: statushttc.value,
                            padding: 8.0,
                            onToggle: (val) {
                              statushttc.value = !statushttc.value;
                              if (statushttc.value == true) {
                                textsthttc.value = "có";
                              } else {
                                textsthttc.value = "không";
                              }
                            },
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Container(
                height: 50,
                decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border.all(
                    color: Color.fromRGBO(200, 200, 200, 200),
                  ),
                ),
                child: Container(
                  margin: EdgeInsets.only(right: 10, left: 10),
                  child: Row(
                    children: [
                      Expanded(
                        child: Text("Nổi bật"),
                      ),
                    ],
                  ),
                ),
              ),
              Container(
                height: 50,
                margin: new EdgeInsets.only(top: 20, bottom: 20),
                child: Row(
                  children: [
                    Expanded(
                      child: Container(
                        margin: new EdgeInsets.only(right: 5, left: 10),
                        child: RaisedButton(
                          color: Colors.white,
                          child: Text("Trở lại"),
                          onPressed: () {},
                        ),
                      ),
                    ),
                    Expanded(
                      child: Container(
                        margin: new EdgeInsets.only(right: 10, left: 5),
                        child: RaisedButton(
                          color: Colors.amber,
                          child: Text("Lưu thông tin"),
                          onPressed: () {},
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class chonloaisp extends GetxController {
  var lsp = "Chọn loại sp".obs;
}

class chonqg extends GetxController {
  var quocgia = "Chọn quốc gia".obs;
}
