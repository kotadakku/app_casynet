
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../../../routes/app_pages.dart';
import '../../widgets/Bottommenu.dart';
import '../../UI_cuahang.dart';
import 'UI_chitietdonhang.dart';

var xemthem = 10.obs;
var x = "".obs;

class QuanLyDonHang extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final widthdt = MediaQuery.of(context).size.width;
    final heightdt = MediaQuery.of(context).size.height;

    var isSelected = [true, false, false, false].obs;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        centerTitle: true,
        title: Text(
          "Quản lý đơn hàng",
          style: TextStyle(color: Colors.amber),
        ),
      ),
      body: Container(
          child: DefaultTabController(
            length: 4,
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
                            Text(x.toString()),
                            Container(
                              margin: new EdgeInsets.only(top: 10, left: 10),
                              height: 50,
                              width: 400,
                              child: TabBar(
                                indicator: BoxDecoration(color: Colors.white),
                                labelColor: Colors.black,
                                unselectedLabelColor: Colors.white,
                                tabs: [
                                  Tab(
                                    text: "Đợi duyệt",
                                  ),
                                  Tab(
                                    text: "Đang giao",
                                  ),
                                  Tab(
                                    text: "Đã giao",
                                  ),
                                  Tab(
                                    text: "Đã hủy",
                                  ),
                                ],
                                onTap: (indext) {
                                  print(indext);
                                },
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),

                Expanded(
                    child: TabBarView(
                      children: [
                        cs(),
                        cs(),
                        cs(),
                        cs(),
                      ],

                    ),
                ),
                // Obx(() =>
                //     Container(
                //     color: Color.fromRGBO(200, 200, 200, 200),
                //     child: ListView.builder(
                //       itemCount: xemthem.toInt(),
                //       physics: NeverScrollableScrollPhysics(),
                //       shrinkWrap: true,
                //       itemBuilder: (context, index) {
                //         if (index == (xemthem.toInt() - 1)) {
                //           return Container(
                //             margin: new EdgeInsets.only(
                //                 left: 10, right: 10, bottom: 10),
                //             height: 50,
                //             child: RaisedButton(
                //               child: Text("Xem hêm"),
                //               color: Colors.amber,
                //               onPressed: () {
                //                 xemthem += 5;
                //               },
                //             ),
                //           );
                //         }
                //         return Container(
                //           margin: new EdgeInsets.only(bottom: 10),
                //           child: Column(
                //             children: [
                //               RaisedButton(
                //                 color: Colors.white,
                //                 child: Column(
                //                   children: [
                //                     Container(
                //                       decoration: BoxDecoration(
                //                           border: Border(
                //                         bottom: BorderSide(
                //                             width: 1.0,
                //                             color: Color.fromRGBO(
                //                                 200, 200, 200, 200)),
                //                       )),
                //                       height: 50,
                //                       child: Row(
                //                         mainAxisAlignment:
                //                             MainAxisAlignment.spaceBetween,
                //                         children: [
                //                           Text("ĐƠN HÀNG: "),
                //                           Expanded(
                //                             child: Text("DH001"),
                //                           ),
                //                           Text("Trần thế quyền"),
                //                           Icon(Icons.navigate_next),
                //                         ],
                //                       ),
                //                     ),
                //                     Container(
                //                       margin: new EdgeInsets.only(top: 15),
                //                       height: 60,
                //                       child: Row(
                //                         children: [
                //                           Column(
                //                             crossAxisAlignment:
                //                                 CrossAxisAlignment.start,
                //                             children: [
                //                               Container(
                //                                 margin: new EdgeInsets.only(
                //                                     bottom: 10),
                //                                 child: Text("Ngày: "),
                //                               ),
                //                               Text("Trạng thái: "),
                //                             ],
                //                           ),
                //                           Expanded(
                //                             child: Column(
                //                               crossAxisAlignment:
                //                                   CrossAxisAlignment.start,
                //                               children: [
                //                                 Container(
                //                                   margin: new EdgeInsets.only(
                //                                       bottom: 10),
                //                                   child: Text("15/09/2021"),
                //                                 ),
                //                                 Text(
                //                                   "Đợi duyệt",
                //                                   style: TextStyle(
                //                                       color: Colors.amber),
                //                                 ),
                //                               ],
                //                             ),
                //                           ),
                //                           Column(
                //                             crossAxisAlignment:
                //                                 CrossAxisAlignment.start,
                //                             children: [
                //                               Container(
                //                                 margin: new EdgeInsets.only(
                //                                     bottom: 10),
                //                                 child: Text("Tổng tiền: "),
                //                               ),
                //                               Text("Chiếu khấu: "),
                //                             ],
                //                           ),
                //                           Column(
                //                             crossAxisAlignment:
                //                                 CrossAxisAlignment.start,
                //                             children: [
                //                               Container(
                //                                 margin: new EdgeInsets.only(
                //                                     bottom: 10),
                //                                 child: Text(
                //                                   "3.000.000",
                //                                   style: TextStyle(
                //                                       color: Colors.blue),
                //                                 ),
                //                               ),
                //                               Text("10%"),
                //                             ],
                //                           ),
                //                         ],
                //                       ),
                //                     ),
                //                   ],
                //                 ),
                //                 onPressed: () {
                //                   Get.to(chitietdonhang());
                //                 },
                //               ),
                //             ],
                //           ),
                //         );
                //       },
                //     ),
                //   ),
                // ),
              ],
            ),
          ),
        ),

      bottomNavigationBar: Bottommenu(),
    );
  }

  Widget cs() {
    return Container(
      child: SingleChildScrollView(
        child: Obx(
              () => Container(
                  color: Color.fromARGB(255, 241, 243, 253),
            child: ListView.builder(
              itemCount: xemthem.toInt(),
              physics: NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemBuilder: (context, index) {
                if (index == (xemthem.toInt() - 1)) {
                  return Container(
                    margin: new EdgeInsets.only(left: 10, right: 10, bottom: 10),
                    height: 50,
                    child: RaisedButton(
                      child: Text("Xem hêm"),
                      color: Colors.amber,
                      onPressed: () {
                        xemthem += 5;
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
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                                    crossAxisAlignment: CrossAxisAlignment.start,
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
                                          margin: new EdgeInsets.only(bottom: 10),
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
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Container(
                                        margin: new EdgeInsets.only(bottom: 10),
                                        child: Text("Tổng tiền: "),
                                      ),
                                      Text("Chiếu khấu: "),
                                    ],
                                  ),
                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
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
                          Get.toNamed(Routes.STORE_MANAGER_INFO_ORDER);
                        },
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
