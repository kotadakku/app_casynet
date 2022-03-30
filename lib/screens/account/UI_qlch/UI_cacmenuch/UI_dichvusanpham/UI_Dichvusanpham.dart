import 'package:app_casynet/screens/account/UI_qlch/UI_cacmenuch/UI_dichvusanpham/UI_ThemSPDV.dart';
import 'package:app_casynet/screens/account/UI_qlch/UI_cuahang.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:get/get.dart';
import '../../Appbar.dart';

class dichvusanpham extends StatelessWidget {
  var x = "".obs;
  var iscs = [false, false, false, false, false, false, false].obs;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            Expanded(
              child: Container(
                height: 40,
                color: Color.fromARGB(224, 224, 224, 224),
                margin: new EdgeInsets.only(top: 40, bottom: 40),
                child: TextField(
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    hintText: 'Tìm kiếm trên cửa hàng',
                    prefixIcon: Icon(Icons.search),
                  ),
                ),
              ),
            ),
            Container(
              height: 40,
              width: 80,
              margin: new EdgeInsets.only(left: 10),
              child: RaisedButton(
                color: Colors.amber,
                child: Text("Thêm +"),
                onPressed: () {
                    Get.to(themspdv());
                },
              ),
            ),
          ],
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
      body: Obx(
        () => Container(
          color: Color.fromRGBO(200, 200, 200, 200),
          child: SingleChildScrollView(
            child: Column(
              children: [
                Text(x.toString()),
                ListView.builder(
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  itemCount: 6,
                  itemBuilder: (context, index) {
                    return Obx(
                      () => Container(
                          color: Colors.white,
                          margin: new EdgeInsets.only(bottom: 10),
                        child: Column(
                          children: [
                            Container(
                              decoration: BoxDecoration(
                                  border: Border(
                                    bottom: BorderSide(
                                        width: 1.0,
                                        color:
                                        Color.fromRGBO(200, 200, 200, 200)),
                                  )),
                              height: 50,
                              child: Row(
                                children: [
                                  Expanded(
                                      child: Text(
                                          "Bảo hiểm vận chuyển hàng hóa")),
                                  ImageIcon(
                                    AssetImage("assets/Icon/icon_butchi.png"),
                                    size: 20,
                                  ),
                                ],
                              ),
                            ),
                            Slidable(
                              key: const ValueKey(0),
                              endActionPane: ActionPane(
                                motion: const ScrollMotion(),
                                extentRatio: 0.25,
                                children: [
                                  Container(
                                    child:SlidableAction(
                                      onPressed: (context) {},
                                      backgroundColor: Colors.amber,
                                      foregroundColor: Colors.white,
                                      label: 'Xóa',
                                    ),
                                  ),

                                ],
                              ),
                              child: Row(
                                mainAxisAlignment:
                                MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(x.toString()),
                                  Checkbox(
                                    value: iscs[index],
                                    onChanged: (value) {
                                      iscs[index] = value!;
                                    },
                                  ),
                                  Container(
                                    margin: new EdgeInsets.only(right: 10),
                                    child: Image.network(
                                      "https://image.bnews.vn/MediaUpload/Org/2020/10/29/winner-x-bike-sport.jpg",
                                      width: 100,
                                    ),
                                  ),
                                  Expanded(
                                    child: Column(
                                      crossAxisAlignment:
                                      CrossAxisAlignment.start,
                                      children: [
                                        Row(
                                          mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                          children: [
                                            Container(
                                              margin: new EdgeInsets.only(
                                                  bottom: 5),
                                              child: Text("Mã: 01-303",
                                                  maxLines: 1,
                                                  overflow:
                                                  TextOverflow.ellipsis),
                                            ),
                                            Container(
                                              margin: new EdgeInsets.only(
                                                  bottom: 5),
                                              child: Text("Số lượng:1000",
                                                  maxLines: 1,
                                                  overflow:
                                                  TextOverflow.ellipsis),
                                            ),
                                          ],
                                        ),
                                        Row(
                                          children: [
                                            Expanded(
                                              child: Container(
                                                margin: new EdgeInsets.only(
                                                    bottom: 5),
                                                child: Text("Loại: Sản phẩm",
                                                    maxLines: 1,
                                                    overflow:
                                                    TextOverflow.ellipsis),
                                              ),
                                            ),
                                            Container(
                                              margin: new EdgeInsets.only(),
                                              child: Text("Giá: 1.000.000",
                                                  maxLines: 1,
                                                  overflow:
                                                  TextOverflow.ellipsis),
                                            ),
                                          ],
                                        ),
                                        ExpansionTile(
                                          title: Row(
                                            children: [
                                              Expanded(
                                                child: Container(
                                                  margin: new EdgeInsets.only(),
                                                  child: Text(
                                                    "Loại Sản phẩm: xe máy",
                                                    maxLines: 1,
                                                    overflow:
                                                    TextOverflow.ellipsis,
                                                  ),
                                                ),
                                              ),
                                              Container(
                                                child: Text("Xem"),
                                              ),
                                            ],
                                          ),
                                          children: [
                                            Text("sdasd"),
                                            Text("sdasd"),
                                            Text("sdasd"),
                                          ],
                                        ),
                                        // Row(
                                        //   children: [
                                        //     Expanded(
                                        //       child: Container(
                                        //         margin: new EdgeInsets.only(),
                                        //         child: Text(
                                        //           "Loại Sản phẩm: xe máy",
                                        //           maxLines: 1,
                                        //           overflow: TextOverflow.ellipsis,
                                        //         ),
                                        //       ),
                                        //     ),
                                        //     Expanded(
                                        //       child: Container(
                                        //         child: ExpansionTile(
                                        //           title: Text("ss"),
                                        //           children: [
                                        //             Text("sd"),
                                        //             Text("sd"),
                                        //           ],
                                        //         ),
                                        //       ),
                                        //     ),
                                        //
                                        //   ],
                                        // ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),

                          ],
                        ),


                        ),

                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
