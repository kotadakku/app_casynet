import 'package:app_casynet/screens/account/UI_qlch/UI_cacmenuch/UI_quanlyquatang/UI_Themquatang.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../UI_cuahang.dart';

class quanlyquatang extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
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
                  Get.to(themquatang());
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
              Get.back();
            },
          ),
        ),
      ),
      body: Container(
        color: Color.fromARGB(255, 241, 243, 253),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                height: 50,
                child: Row(
                  children: [
                    Container(
                      child: Checkbox(
                        value: false,
                        onChanged: (value) {
                          // iscs[index] = value!;
                        },
                      ),
                    ),
                    Text("Xóa "),
                    Text("20 Bản ghi"),

                  ],
                ),
              ),
              ListView.builder(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemCount: 2,
                itemBuilder: (context, index) {
                  return Container(
                    color: Colors.white,
                    margin: EdgeInsets.only(bottom: 10),
                    child: Row(
                      children: [
                        Container(
                          child: Checkbox(
                            value: false,
                            onChanged: (value) {
                              // iscs[index] = value!;
                            },
                          ),
                        ),
                        Expanded(
                          child: Container(
                            child: Column(
                              children: [
                                Container(
                                  margin: EdgeInsets.only(right: 10),
                                  child: Row(
                                    children: [
                                      Expanded(
                                        child: Text(
                                          "Thay lốp Maxxis chính hãng miễn phí",
                                          maxLines: 1,
                                          overflow: TextOverflow.ellipsis,
                                          style: TextStyle(fontWeight: FontWeight.bold),
                                        ),
                                      ),
                                      ImageIcon(AssetImage(
                                          "assets/Icon/icon_butchi.png")),
                                    ],
                                  ),
                                ),
                                Container(
                                  margin: EdgeInsets.only(right: 10),
                                  child: Row(
                                    children: [
                                      Container(
                                        child: Image.network(
                                          "https://image.bnews.vn/MediaUpload/Org/2020/10/29/winner-x-bike-sport.jpg",
                                          width: 100,
                                        ),
                                      ),
                                      Expanded(
                                        child: Column(
                                          children: [
                                            Row(
                                              children: [
                                                Expanded(
                                                  child: Text("ID:01-303"),
                                                ),
                                                ImageIcon(AssetImage("assets/Icon/icon_dung2.png"),size: 18,color: Colors.green,),
                                              ],
                                            ),
                                            Row(
                                              children: [
                                                Expanded(child: Text("Ngày bắt đầu:15/09/2021",maxLines: 1,overflow: TextOverflow.ellipsis,),),
                                              ],
                                            ),
                                            Row(
                                              children: [
                                                Expanded(child: Text("Ngày kết thúc:15/010/2021",maxLines: 1,overflow: TextOverflow.ellipsis),),
                                              ],
                                            ),

                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
