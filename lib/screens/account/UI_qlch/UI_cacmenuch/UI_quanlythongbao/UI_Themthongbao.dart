import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_switch/flutter_switch.dart';
import 'package:get/get.dart';

class themthongbao extends StatelessWidget {
  var statusgmkh = false.obs;
  var textgmkh = "Không".obs;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          "Thêm mới thông báo",
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
              padding: EdgeInsets.only(top: 20),
              color: Colors.white,
              height: 110,
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
              padding: EdgeInsets.only(left: 10,right: 10),
              decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border(
                    bottom: BorderSide(
                        width: 1.0, color: Color.fromRGBO(200, 200, 200, 200)),
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
              height: 50,
              child: RaisedButton(
                color: Colors.white,
                child: Row(
                  children: [
                    Expanded(
                      child: Text("Khách hàng"),
                    ),
                    Text("Lựa chọn"),
                    Icon(Icons.navigate_next),
                  ],
                ),
                onPressed: (){

                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
