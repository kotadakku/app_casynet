import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../Appbar.dart';
import '../Bottommenu.dart';
import '../UI_cuahang.dart';

class thongtincuahang extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final widthdt = MediaQuery.of(context).size.width;
    final heightdt = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          "Thông tin cửa hàng",
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
          child: Container(
            color: Color.fromRGBO(200, 200, 200, 200),
            child: ListView(
              physics: NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              children: [
                Container(
                  child: Image.network(
                      "https://xemaynghean.com/wp-content/uploads/2019/03/50272791_137653880484230_7970165378053570560_n-1024x554.jpg"),
                ),
                Container(
                  height: 50,
                  child: RaisedButton(
                    padding: new EdgeInsets.only(left: 10, right: 10),
                    color: Colors.white,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Expanded(
                          child: Text(
                            "Tên",
                            style: TextStyle(fontSize: 15),
                          ),
                        ),
                        Text("Cửa hàng xe máy Hùng Sơn",
                            style: TextStyle(fontSize: 15)),
                        Icon(Icons.navigate_next),
                      ],
                    ),
                    onPressed: () {},
                  ),
                ),
                Container(
                    height: 50,
                    child: RaisedButton(
                      padding: new EdgeInsets.only(left: 10, right: 10),
                      color: Colors.white,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Expanded(
                            child: Text("Link", style: TextStyle(fontSize: 15)),
                          ),
                          Text("cuahangxemayhungson",
                              style: TextStyle(fontSize: 15)),
                          Icon(Icons.navigate_next),
                        ],
                      ),
                      onPressed: () {},
                    )),
                Container(
                    height: 50,
                    child: RaisedButton(
                      padding: new EdgeInsets.only(left: 10, right: 10),
                      color: Colors.white,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Expanded(
                            child: Text("Số diện thoại",
                                style: TextStyle(fontSize: 15)),
                          ),
                          Text("0974745553", style: TextStyle(fontSize: 15)),
                          Icon(Icons.navigate_next),
                        ],
                      ),
                      onPressed: () {},
                    )),
                Container(
                  height: 50,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Container(
                        height: 50,
                        width: widthdt/2,
                        child: RaisedButton(
                          color: Colors.white,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Expanded(child: Text("Giờ mở", style: TextStyle(fontSize: 15)),),
                              Text("08:00", style: TextStyle(fontSize: 15)),
                              Container(
                                child: ImageIcon(
                                  AssetImage("assets/Icon/icon_dongho.png"),
                                  color: Colors.blue,
                                ),
                              ),
                            ],
                          ),
                          onPressed: () {},
                        ),
                      ),
                      Container(
                        height: 50,
                        width: widthdt/2,
                        child: RaisedButton(
                          color: Colors.white,
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Expanded(
                                child:Text("Giờ đóng", style: TextStyle(fontSize: 15)),
                              ),

                              Text("21:00", style: TextStyle(fontSize: 15)),
                              ImageIcon(
                                AssetImage("assets/Icon/icon_dongho.png"),
                                color: Colors.blue,
                              ),
                            ],
                          ),
                          onPressed: () {},
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  margin: new EdgeInsets.only(top: 10),
                  height: 50,
                  child: RaisedButton(
                    color: Colors.white,
                    child: Row(
                      children: [
                        Expanded(
                          child: Text("Địa chỉ", style: TextStyle(fontSize: 15)),
                        ),
                        Text("Chọn Tỉnh/Thành phố",
                            style: TextStyle(fontSize: 15)),
                        Icon(Icons.navigate_next),
                      ],
                    ),
                    onPressed: () {

                    },
                  ),

                ),
                Container(
                  height: 50,
                  child: RaisedButton(
                    color: Colors.white,
                    child: Row(
                      children: [
                        Expanded(
                          child: Text("Quận/Huyện", style: TextStyle(fontSize: 15)),
                        ),
                        Text("Chọn Quận/Huyện",
                            style: TextStyle(fontSize: 15)),
                        Icon(Icons.navigate_next),
                      ],
                    ),
                    onPressed: () {

                    },
                  ),

                ),
                Container(
                  height: 50,
                  child: RaisedButton(
                    color: Colors.white,
                    child: Row(
                      children: [
                        Expanded(
                          child: Text("Số nhà, tên đường", style: TextStyle(fontSize: 15)),
                        ),
                        Container(
                          width: 150,
                          child: TextField(
                            decoration: InputDecoration(
                              border: InputBorder.none,
                              hintText: "Nhập Số nhà, tên đường",
                            ),
                          ),
                        ),
                        Icon(Icons.navigate_next),
                      ],
                    ),
                    onPressed: () {

                    },
                  ),

                ),
                Container(
                  color: Colors.white,
                  height: 300,
                  child: Image.network("https://media-cdn-v2.laodong.vn/Storage/newsportal/2018/11/29/643923/Screen-Shot-2018-11-.png"),
                ),
                Container(
                  height: 50,
                  child: RaisedButton(
                    color: Colors.white,
                    child: Row(
                      children: [
                        Expanded(
                          child: Text("Danh mục ngành nghề chính", style: TextStyle(fontSize: 15)),
                        ),
                        RaisedButton(
                          color: Colors.red,
                          child: Text("Mua bán xe",style: TextStyle(color: Colors.white),),
                          onPressed: () {

                          },
                        ),
                      ],
                    ),
                    onPressed: () {

                    },
                  ),
                ),
                Container(
                  height: 50,
                  child: RaisedButton(
                    color: Colors.white,
                    child: Row(
                      children: [
                        Expanded(
                          child: Text("Danh mục ngành nghề", style: TextStyle(fontSize: 15)),
                        ),
                        Icon(Icons.navigate_next),
                      ],
                    ),
                    onPressed: () {

                    },
                  ),

                ),
                Container(
                  height: 50,
                  child: RaisedButton(
                    color: Colors.white,
                    child: Row(
                      children: [
                        Expanded(
                          child: Text("Loại cửa hàng", style: TextStyle(fontSize: 15)),
                        ),
                        Text("Xe máy",style: TextStyle(fontSize: 15)),
                        Icon(Icons.navigate_next),
                      ],
                    ),
                    onPressed: () {

                    },
                  ),

                ),
                Container(
                  height: 145,
                  color: Colors.white,
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Text("Giới thiệu cửa hàng"),
                          Container(
                            margin: new EdgeInsets.only(right: 20),
                            child: ImageIcon(AssetImage("assets/Icon/icon_butchi.png"),),
                          ),

                        ],
                      ),
                      SingleChildScrollView(
                        child: TextField(
                          maxLines: 5,
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: "Nhập giới thiệu cửa hàng",
                          ),
                        ),
                      ),

                    ],
                  ),
                ),
                Container(
                  margin: new EdgeInsets.only(top: 10),
                  height: 50,
                  child: RaisedButton(
                    color: Colors.white,
                    child: Row(
                      children: [
                        Expanded(child: Text("Loại giao diện",style: TextStyle(fontSize: 15))),
                        Text("NCI CASYNET",style: TextStyle(fontSize: 15)),
                        Icon(Icons.navigate_next),
                      ],
                    ),
                    onPressed: () {

                    },
                  ),
                ),
                Container(
                  height: 50,
                  child: RaisedButton(
                    color: Colors.white,
                    child: Row(
                      children: [
                        Expanded(child: Text("SĐT Zalo",style: TextStyle(fontSize: 15))),
                        Container(
                          width: 150,
                          child: TextField(
                            decoration: InputDecoration(
                              border: InputBorder.none,
                              hintText: "Nhập số điện thoại",
                            ),
                          ),
                        ),
                        Icon(Icons.navigate_next),
                      ],
                    ),
                    onPressed: () {

                    },
                  ),
                ),
                Container(
                  height: 50,
                  child: RaisedButton(
                    color: Colors.white,
                    child: Row(
                      children: [
                        Expanded(child: Text("Mã cộng tác viên",style: TextStyle(fontSize: 15))),
                        Text("bht123456",style: TextStyle(fontSize: 15)),
                        Icon(Icons.navigate_next),
                      ],
                    ),
                    onPressed: () {

                    },
                  ),
                ),
                Container(
                  height: 50,
                  margin: new EdgeInsets.only(left: 10,right: 10,bottom: 20,top: 20),
                  width: widthdt,
                  child: RaisedButton(
                    color: Colors.amber,
                    child: Text("Lưu thông tin",style: TextStyle(fontSize: 16,color: Colors.white),),
                    onPressed: () {
                    },
                  ),
                )
              ],
            ),
          ),
        ),
      ),
      // bottomNavigationBar: Bottommenu(),
    );
  }
}
