import 'package:app_casynet/screens/account/UI_qlch/UI_cacmenuch/UI_quanlydonhang/UI_chitietdonhang.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


import 'package:get/get.dart';

import '../../Bottommenu.dart';
import '../../UI_cuahang.dart';

class doiduyet extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final widthdt = MediaQuery.of(context).size.width;
    final heightdt = MediaQuery.of(context).size.height;
    var xemthem=10.obs;
    var x = "".obs;
    var isSelected = [true, false, false, false].obs;
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          "Quản lý đơn hàng",
          style: TextStyle(color: Colors.amber),
        ),
        leading: Container(
          child: IconButton(
            icon: Icon(Icons.arrow_back_rounded),
            color: Colors.amberAccent,
            onPressed: () {
              Get.to(menucuahang());
            },
          ),
        ),
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Obx(
                    () => Container(
                  height: 50,
                  color: Colors.amber,
                  child: ListView(
                    scrollDirection: Axis.horizontal,
                    children: [
                      Row(
                        children: [
                          Container(
                            margin: new EdgeInsets.only(top: 10, left: 10),
                            height: 50,
                            child: ToggleButtons(
                              fillColor: Colors.white,
                              renderBorder: false,
                              children: <Widget>[
                                Container(
                                  width: 100,
                                  child: Center(
                                    child: Text(
                                      "Đợi duyệt",
                                      style: TextStyle(color: Colors.black),
                                    ),
                                  ),
                                ),
                                Container(
                                  width: 100,
                                  child: Center(
                                    child: Text(
                                      "Đang giao",
                                      style: TextStyle(color: Colors.black),
                                    ),
                                  ),
                                ),
                                Container(
                                  width: 100,
                                  child: Center(
                                    child: Text(
                                      "Đã giao",
                                      style: TextStyle(color: Colors.black),
                                    ),
                                  ),
                                ),
                                Container(
                                  width: 100,
                                  child: Center(
                                    child: Text(
                                      "Đã giao",
                                      style: TextStyle(color: Colors.black),
                                    ),
                                  ),
                                ),
                              ],
                              onPressed: (int index) {
                                isSelected[index] = true;
                                if (isSelected[3] == true) {
                                  isSelected[0] = false;
                                  isSelected[1] = false;
                                  isSelected[2] = false;
                                  isSelected[3] = false;
                                  isSelected[index] = true;
                                  print("2");
                                }
                                if (isSelected[2] == true) {
                                  isSelected[0] = false;
                                  isSelected[1] = false;
                                  isSelected[3] = false;
                                  isSelected[index] = true;
                                  print("2");
                                }
                                if (isSelected[1] == true) {
                                  isSelected[0] = false;
                                  isSelected[2] = false;
                                  isSelected[1] = false;
                                  isSelected[3] = false;
                                  isSelected[index] = true;
                                }
                                if (isSelected[0] == true) {
                                  isSelected[1] = false;
                                  isSelected[2] = false;
                                  isSelected[0] = false;
                                  isSelected[3] = false;
                                  isSelected[index] = true;

                                  print("0");
                                }
                              },
                              isSelected: isSelected,
                            ),
                          ),
                          Text(x.toString()),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              Obx(()=>Container(
                color: Color.fromRGBO(200, 200, 200, 200),
                child: ListView.builder(
                  itemCount: xemthem.toInt(),
                  physics: NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemBuilder: (context, index) {
                    if(index==(xemthem.toInt()-1)){
                      return Container(
                        margin: new EdgeInsets.only(left: 10,right: 10,bottom: 10),
                        height: 50,
                        child: RaisedButton(
                          child: Text("Xem hêm"),
                          color: Colors.amber,
                          onPressed: () {
                            xemthem+=5;
                          },
                        ),
                      );
                    }
                    return Container(
                      margin: new EdgeInsets.only(bottom: 10),
                      child: Column(
                        children: [
                          RaisedButton(
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
                                    mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text("ĐƠN HÀNG: "),
                                      Expanded(
                                        child: Text("DH001"),
                                      ),
                                      Text("Trần thế quyền"),
                                      Icon(Icons.navigate_next),
                                    ],
                                  ),
                                ),
                                Container(
                                  margin: new EdgeInsets.only(top: 15),
                                  height: 60,
                                  child: Row(
                                    children: [
                                      Column(
                                        crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                        children: [
                                          Container(
                                            margin: new EdgeInsets.only(bottom: 10),
                                            child: Text("Ngày: "),
                                          ),
                                          Text("Trạng thái: "),
                                        ],
                                      ),
                                      Expanded(
                                        child: Column(
                                          crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                          children: [
                                            Container(
                                              margin:
                                              new EdgeInsets.only(bottom: 10),
                                              child: Text("15/09/2021"),
                                            ),
                                            Text(
                                              "Đợi duyệt",
                                              style: TextStyle(color: Colors.amber),
                                            ),
                                          ],
                                        ),
                                      ),
                                      Column(
                                        crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                        children: [
                                          Container(
                                            margin: new EdgeInsets.only(bottom: 10),
                                            child: Text("Tổng tiền: "),
                                          ),
                                          Text("Chiếu khấu: "),
                                        ],
                                      ),
                                      Column(
                                        crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                        children: [
                                          Container(
                                            margin: new EdgeInsets.only(bottom: 10),
                                            child: Text(
                                              "3.000.000",
                                              style: TextStyle(color: Colors.blue),
                                            ),
                                          ),
                                          Text("10%"),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                            onPressed: () {
                              Get.to(chitietdonhang());
                            },
                          ),

                        ],
                      ),
                    );

                  },

                ),
              ),),

            ],
          ),
        ),
      ),
      bottomNavigationBar: Bottommenu(),
    );
  }
}
