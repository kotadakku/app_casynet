import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'UI_Chondanhmuc.dart';
import 'UI_Chonloaisanpham.dart';
import 'UI_Dichvusanpham.dart';

class themspdv extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final clsp=Get.put(chonloaisp());
    final tensanpham = TextEditingController();
    var demtensanpham = 0.obs;
    var chon="".obs;
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
      body: Container(
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
                    margin: EdgeInsets.only(right: 10, left: 10),
                    child: Row(
                      children: [
                        Expanded(child: Text("Ngày hết hạn")),
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
                        Text("Chọn xuất xứ"),
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
                        Expanded(
                          child: Text("Hiện thị sản phẩm"),
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
                          child: Text("Hiện thị ở trang tính"),
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
                  margin: new EdgeInsets.only(top: 20,bottom: 20),
                  child: Row(
                    children: [
                      Expanded(child: Container(
                        margin: new EdgeInsets.only(right: 5,left: 10),
                        child: RaisedButton(
                          color: Colors.white,
                          child: Text("Trở lại"),
                          onPressed: () {

                          },
                        ),
                      ),),
                      Expanded(
                        child: Container(
                          margin: new EdgeInsets.only(right: 10,left: 5),
                          child: RaisedButton(
                            color: Colors.amber,
                            child: Text("Lưu thông tin"),
                            onPressed: () {

                            },
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
      ),
    );
  }
}
class chonloaisp extends GetxController{
  var lsp="".obs;
}
