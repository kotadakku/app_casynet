import 'package:app_casynet/screens/account/UI_qlch/UI_cacmenuch/UI_quanlyquatang/UI_Quanlyquatang.dart';
import 'package:app_casynet/screens/account/UI_qlch/UI_cacmenuch/UI_dichvusanpham/UI_Dichvusanpham.dart';
import 'package:app_casynet/screens/account/UI_qlch/UI_cacmenuch/UI_quanlythongbao/UI_Quanlythongbao.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../account_login.dart';
import 'Appbar.dart';
import 'Bottommenu.dart';
import 'UI_cacmenuch/UI_Bangdieukhien.dart';
import 'UI_cacmenuch/UI_Thongtincuahang.dart';
import 'UI_cacmenuch/UI_quanlydonhang/UI_doiduyet.dart';


class menucuahang extends StatelessWidget {
  const menucuahang({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Appbars(),
        leading: Container(
          child: IconButton(
            icon: Icon(Icons.arrow_back_rounded),
            color: Colors.amberAccent,
            onPressed: () {
              Get.to(AccountLoginPage());
            },
          ),
        ),
      ),
      body: Center(
        child: Container(
          child: ListView(
            children: [
              Container(
                child: Image.network(
                    "https://xemaynghean.com/wp-content/uploads/2019/03/50272791_137653880484230_7970165378053570560_n-1024x554.jpg"),
              ),
              Container(
                height: 50,
                child: RaisedButton(
                  color: Colors.white,
                  child: Container(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        ImageIcon(
                          AssetImage("assets/Icon/icon_dashboard.png"),
                          color: Colors.amber,
                        ),
                        Expanded(
                          child: Text(
                            "Bảng điều khiển",
                            style: TextStyle(fontSize: 20),
                          ),
                        ),
                        Icon(Icons.navigate_next),
                      ],
                    ),
                  ),
                  onPressed: () {
                    // Navigator.of(context).push(MaterialPageRoute(builder: (context) => bangdieukhien(ii: 1,)));
                    Get.to(bangdieukhien());
                  },
                ),
              ),
              Container(
                height: 50,
                child: RaisedButton(
                  color: Colors.white,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      ImageIcon(
                        AssetImage("assets/Icon/icon_ttcuahang.png"),
                        color: Colors.deepOrangeAccent,
                      ),
                      Expanded(
                        child: Text(
                          "Thông tin cửa hàng",
                          style: TextStyle(fontSize: 20),
                        ),
                      ),
                      Icon(Icons.navigate_next),
                    ],
                  ),
                  onPressed: () {
                    Get.to(thongtincuahang());
                  },
                ),
              ),
              Container(
                height: 50,
                child: RaisedButton(
                  color: Colors.white,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Icon(Icons.dashboard),
                      Expanded(
                        child: Text(
                          "Quản lý đơn hàng",
                          style: TextStyle(fontSize: 20),
                        ),
                      ),
                      Icon(Icons.navigate_next),
                    ],
                  ),
                  onPressed: () {
                    Get.to(doiduyet());
                  },
                ),
              ),
              Container(
                height: 50,
                child: RaisedButton(
                  color: Colors.white,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      ImageIcon(
                        AssetImage("assets/Icon/icon_dvsp.png"),

                      ),
                      Expanded(
                        child: Text(
                          "Dịch vụ/ Sản phẩm",
                          style: TextStyle(fontSize: 20),
                        ),
                      ),
                      Icon(Icons.navigate_next),
                    ],
                  ),
                  onPressed: () {
                    Get.to(dichvusanpham());
                  },
                ),
              ),
              Container(
                height: 50,
                child: RaisedButton(
                  color: Colors.white,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      ImageIcon(
                        AssetImage("assets/Icon/icon_quatang.png"),
                        color: Colors.red,
                      ),
                      Expanded(
                        child: Text(
                          "Quản lý quà tặng",
                          style: TextStyle(fontSize: 20),
                        ),
                      ),
                      Icon(Icons.navigate_next),
                    ],
                  ),
                  onPressed: () {
                    Get.to(quanlyquatang());
                  },
                ),
              ),
              Container(
                height: 50,
                child: RaisedButton(
                  color: Colors.white,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      ImageIcon(
                        AssetImage("assets/Icon/icon_thongbao.png"),
                        color: Colors.blue,
                      ),
                      Expanded(
                        child: Text(
                          "Quản lý thông báo",
                          style: TextStyle(fontSize: 20),
                        ),
                      ),
                      Icon(Icons.navigate_next),
                    ],
                  ),
                  onPressed: () {
                    Get.to(quanlythongbao());
                  },
                ),
              ),
              Container(
                height: 50,
                child: RaisedButton(
                  color: Colors.white,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      ImageIcon(
                        AssetImage("assets/Icon/icon_tintuc.png"),
                        color: Colors.blue,
                      ),
                      Expanded(
                        child: Text(
                          "Tin tức",
                          style: TextStyle(fontSize: 20),
                        ),
                      ),
                      Icon(Icons.navigate_next),
                    ],
                  ),
                  onPressed: () {},
                ),
              ),
              Container(
                margin: new EdgeInsets.only(top: 20),
                height: 50,
                child: RaisedButton(
                  color: Colors.amber,
                  child: Text(
                    "Đi đến cửa hàng",
                    style: TextStyle(fontSize: 20),
                  ),
                  onPressed: () {},
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: Bottommenu(),
    );
  }
}

