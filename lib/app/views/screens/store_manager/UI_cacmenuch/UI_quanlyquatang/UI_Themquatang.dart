import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_switch/flutter_switch.dart';
import 'package:image_picker/image_picker.dart';

class ThemQuaTang extends StatelessWidget {
  var statusht = false.obs;
  var statusgmkh = false.obs;
  var textht = "không".obs;
  var textgmkh = "không".obs;
  var colorht = Colors.grey.obs;
  var ngaybatdau = new DateTime.now().obs;
  var ngayketthuc = new DateTime.now().obs;
  @override
  Widget build(BuildContext context) {
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

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        centerTitle: true,
        title: Text(
          "Thêm mới quà tặng",
          style: TextStyle(color: Colors.black),
        ),
        leading: Container(
          child: IconButton(
            icon: Icon(Icons.arrow_back_rounded),
            color: Colors.amberAccent,
            onPressed: () {
              Get.back();
            },
          ),
        ),
      ),
      body: Container(
        color: Color.fromARGB(255, 241, 243, 253),
        child: Column(
          children: [
            Container(
              margin: EdgeInsets.only(bottom: 10),
              color: Colors.white,
              height: 100,
              width: MediaQuery.of(context).size.width,
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
                                        color:
                                            Color.fromARGB(255, 241, 243, 253),
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
              margin: EdgeInsets.only(bottom: 10),
              color: Colors.white,
              height: 100,
              child: Container(
                margin: EdgeInsets.only(left: 10, right: 10),
                child: Column(
                  children: [
                    Row(
                      children: [
                        Expanded(
                          child: Text(
                            "Tiêu đề",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                            ),
                          ),
                        ),
                        Text("0/120"),
                      ],
                    ),
                    Container(
                      child: TextField(
                        decoration: InputDecoration(
                          hintText: "Nhập tiêu đề",
                          counterText: "",
                          border: InputBorder.none,
                        ),
                        maxLength: 120,
                        maxLines: 2,
                        // controller: tensanpham,
                        // onChanged: (text) {
                        //   demtensanpham.value = text.length;
                        // },
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.only(bottom: 10),
              color: Colors.white,
              height: 100,
              child: Container(
                margin: EdgeInsets.only(left: 10, right: 10),
                child: Column(
                  children: [
                    Row(
                      children: [
                        Expanded(
                          child: Text(
                            "Mô tả",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                            ),
                          ),
                        ),
                        Text("0/3000"),
                      ],
                    ),
                    Container(
                      child: TextField(
                        decoration: InputDecoration(
                          hintText: "Nhập mô tả",
                          counterText: "",
                          border: InputBorder.none,
                        ),
                        maxLength: 120,
                        maxLines: 2,
                        // controller: tensanpham,
                        // onChanged: (text) {
                        //   demtensanpham.value = text.length;
                        // },
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Container(
              padding: EdgeInsets.only(left: 10, right: 10),
              color: Colors.white,
              child: Column(
                children: [
                  Container(
                    decoration: BoxDecoration(
                        border: Border(
                      bottom: BorderSide(
                          width: 1.0,
                          color: Color.fromRGBO(200, 200, 200, 200)),
                    )),
                    height: 50,
                    child: Row(
                      children: [
                        Expanded(child: Text("Hiện thị")),
                        Obx(
                          () => ImageIcon(
                            AssetImage("assets/Icon/icon_dung2.png"),
                            size: 18,
                            color: colorht.value,
                          ),
                        ),
                        Obx(
                          () => Text(textht.value),
                        ),
                        Container(
                          margin: EdgeInsets.only(left: 10),
                          child: Obx(
                            () => FlutterSwitch(
                              width: 60.0,
                              value: statusht.value,
                              padding: 8.0,
                              onToggle: (val) {
                                statusht.value = !statusht.value;
                                if (statusht.value == true) {
                                  textht.value = "Có";
                                  colorht.value = Colors.green;
                                } else {
                                  textht.value = "Không";
                                  colorht.value = Colors.grey;
                                }
                              },
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    decoration: BoxDecoration(
                        border: Border(
                      bottom: BorderSide(
                          width: 1.0,
                          color: Color.fromRGBO(200, 200, 200, 200)),
                    )),
                    height: 50,
                    child: Row(
                      children: [
                        Expanded(child: Text("Ngày bắt đầu")),
                        OutlinedButton(
                          style: ElevatedButton.styleFrom(
                            side: BorderSide(color: Colors.white),
                          ),
                          child: Row(
                            children: [
                              Container(
                                child: Obx(() => Text(
                                    ngaybatdau.value.day.toString() +
                                        "/" +
                                        ngaybatdau.value.month.toString() +
                                        "/" +
                                        ngaybatdau.value.year.toString())),
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
                              initialDate: ngaybatdau.value,
                              firstDate: DateTime(2000),
                              lastDate: DateTime(2025),
                            );
                            if (newdate != null) {
                              ngaybatdau.value = newdate;
                            }
                          },
                        ),
                      ],
                    ),
                  ),
                  Container(
                    decoration: BoxDecoration(
                        border: Border(
                      bottom: BorderSide(
                          width: 1.0,
                          color: Color.fromRGBO(200, 200, 200, 200)),
                    )),
                    height: 50,
                    child: Row(
                      children: [
                        Expanded(child: Text("Ngày kết thúc")),
                        OutlinedButton(
                          style: ElevatedButton.styleFrom(
                            side: BorderSide(color: Colors.white),
                          ),
                          child: Row(
                            children: [
                              Container(
                                child: Obx(() => Text(
                                    ngayketthuc.value.day.toString() +
                                        "/" +
                                        ngayketthuc.value.month.toString() +
                                        "/" +
                                        ngayketthuc.value.year.toString())),
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
                              initialDate: ngayketthuc.value,
                              firstDate: DateTime(2000),
                              lastDate: DateTime(2025),
                            );
                            if (newdate != null) {
                              ngayketthuc.value = newdate;
                            }
                          },
                        ),
                      ],
                    ),
                  ),
                  Container(
                    decoration: BoxDecoration(
                        border: Border(
                      bottom: BorderSide(
                          width: 1.0,
                          color: Color.fromRGBO(200, 200, 200, 200)),
                    )),
                    height: 50,
                    child: Row(
                      children: [
                        Expanded(child: Text("Gửi mail cho tất cả khách hàng")),
                        Obx(
                          () => Text(textgmkh.value),
                        ),
                        Container(
                          margin: EdgeInsets.only(left: 10),
                          child: Obx(
                            () => FlutterSwitch(
                              width: 60.0,
                              value: statusgmkh.value,
                              padding: 8.0,
                              onToggle: (val) {
                                statusgmkh.value = !statusgmkh.value;
                                if (statusgmkh.value == true) {
                                  textgmkh.value = "Có";
                                } else {
                                  textgmkh.value = "Không";
                                }
                              },
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    decoration: BoxDecoration(
                        border: Border(
                      bottom: BorderSide(
                          width: 1.0,
                          color: Color.fromRGBO(200, 200, 200, 200)),
                    )),
                    height: 50,
                    child: Row(
                      children: [
                        Expanded(child: Text("Khách hàng")),
                      ],
                    ),
                  ),
                ],
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
                        onPressed: () {

                        },
                      ),
                    ),
                  ),
                  Expanded(
                    child: Container(
                      margin: new EdgeInsets.only(right: 10, left: 5),
                      child: RaisedButton(
                        color: Colors.amber,
                        child: Text("Lưu quà tặng"),
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
    );
  }
}
