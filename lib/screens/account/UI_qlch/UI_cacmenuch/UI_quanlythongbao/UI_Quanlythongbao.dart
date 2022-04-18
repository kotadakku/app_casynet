import 'package:app_casynet/screens/account/UI_qlch/UI_cacmenuch/UI_quanlythongbao/UI_Themthongbao.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class quanlythongbao extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Row(
          children: [
            Expanded(
              child: Container(
                child: Text("Quản lý thông báo"),
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
                  Get.to(themthongbao());
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
        child:SingleChildScrollView(
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
                                          "assets/Icon/icon_butchi.png"),size: 20,),
                                    ],
                                  ),
                                ),
                                Container(
                                  margin: EdgeInsets.only(right: 10),
                                  child: Row(
                                    children: [
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
                                                Expanded(child: Text("Cập nhật lúc:15/09/2021",maxLines: 1,overflow: TextOverflow.ellipsis,),),
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
