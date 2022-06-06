import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ThemThongBao extends StatelessWidget {
  var statusgmkh = false.obs;
  var textgmkh = "Không".obs;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        centerTitle: true,
        title: Text(
          'add_noti'.tr,
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
                            'title'.tr,
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
                          hintText: 'enter_title'.tr,
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
                            'description'.tr,
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
                          hintText: 'enter_descrip'.tr,
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
                  Expanded(child: Text('send_mail'.tr)),
                  Obx(
                    () => Text(textgmkh.value),
                  ),
                  Container(
                    margin: EdgeInsets.only(left: 10),
                    child: Obx(
                      () => Switch.adaptive(
                        value: statusgmkh.value,
                        onChanged: (bool value) {
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
                      child: Text('customer'.tr),
                    ),
                    Text('select'.tr),
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
