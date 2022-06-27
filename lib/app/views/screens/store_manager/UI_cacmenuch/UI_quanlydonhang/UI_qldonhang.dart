
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../routes/app_pages.dart';
import '../../widgets/Bottommenu.dart';

var xemthem = 10.obs;
var x = "".obs;

class QuanLyDonHang extends StatelessWidget {
  const QuanLyDonHang({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    var isSelected = [true, false, false, false].obs;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        centerTitle: true,
        title: Text(
          'order_management'.tr,
          style: const TextStyle(color: Colors.amber),
        ),
      ),
      body: DefaultTabController(
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
                          margin: const EdgeInsets.only(top: 10, left: 10),
                          height: 50,
                          width: 400,
                          child: TabBar(
                            indicator: const BoxDecoration(color: Colors.white),
                            labelColor: Colors.black,
                            unselectedLabelColor: Colors.white,
                            tabs: [
                              const Tab(
                                text: "Đợi duyệt",
                              ),
                              const Tab(
                                text: "Đang giao",
                              ),
                              const Tab(
                                text: "Đã giao",
                              ),
                              Tab(
                                text: 'cancelled'.tr,
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

      bottomNavigationBar: const Bottommenu(),
    );
  }

  Widget cs() {
    return SingleChildScrollView(
      child: Obx(
            () => Container(
                color: const Color.fromARGB(255, 241, 243, 253),
          child: ListView.builder(
            itemCount: xemthem.toInt(),
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            itemBuilder: (context, index) {
              if (index == (xemthem.toInt() - 1)) {
                return Container(
                  margin: const EdgeInsets.only(left: 10, right: 10, bottom: 10),
                  height: 50,
                  child: ElevatedButton(
                    child: const Text("Xem hêm"),
                    style: ElevatedButton.styleFrom(primary: Colors.amber),
                    onPressed: () {
                      xemthem += 5;
                    },
                  ),
                );
              }
              return Container(
                margin: const EdgeInsets.only(bottom: 10),
                child: Column(
                  children: [
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(primary: Colors.white),
                      child: Column(
                        children: [
                          Container(
                            decoration: const BoxDecoration(
                                border: Border(
                                  bottom: BorderSide(
                                      width: 1.0,
                                      color: Color.fromRGBO(200, 200, 200, 200)),
                                )),
                            height: 50,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: const [
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
                            margin: const EdgeInsets.only(top: 15),
                            height: 60,
                            child: Row(
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Container(
                                      margin: const EdgeInsets.only(bottom: 10),
                                      child: const Text("Ngày: "),
                                    ),
                                    const Text("Trạng thái: "),
                                  ],
                                ),
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment:
                                    CrossAxisAlignment.start,
                                    children: [
                                      Container(
                                        margin: const EdgeInsets.only(bottom: 10),
                                        child: const Text("15/09/2021"),
                                      ),
                                      const Text(
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
                                      margin: const EdgeInsets.only(bottom: 10),
                                      child: const Text("Tổng tiền: "),
                                    ),
                                    const Text("Chiếu khấu: "),
                                  ],
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Container(
                                      margin: const EdgeInsets.only(bottom: 10),
                                      child: const Text(
                                        "3.000.000",
                                        style: TextStyle(color: Colors.blue),
                                      ),
                                    ),
                                    const Text("10%"),
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
    );
  }
}
