import 'package:app_casynet/containts/colors.dart';
import 'package:app_casynet/containts/size.dart';
import 'package:app_casynet/screens/account/message.dart';
import 'package:app_casynet/screens/notfications.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import '../../containts/colors.dart';
import '../../screens/account/infor_account.dart';
import '../../screens/account/infor_location.dart';
import '../../screens/account/order_account.dart';


class MenuAccountWidget extends StatelessWidget {
  const MenuAccountWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final List<String> _menus = [
      "Thông tin tài khoản",
      "Địa chỉ",
      "Tin nhắn",
      "Đơn hàng",
      "Thông báo",
      "Ví Voucher",
      "Quản lý tích điểm",
      "Sản phẩm yêu thích",
      "Cửa hàng theo dõi",
      "Sản phẩm đã xem",
      "Quản lý cửa hàng"
    ];
    List<Widget> _menusWidget = _menus.map((e) {
      var icon;
      VoidCallback  nav = (){};
      switch (e) {
        case "Thông tin tài khoản":
          icon = FontAwesomeIcons.user;
          nav=() { Get.to(InformationAccount());};
          break;
        case "Địa chỉ":
          icon = FontAwesomeIcons.mapLocation;
          nav=() { Get.to(InformationLocation());};
          break;
        case "Tin nhắn":
          icon = FontAwesomeIcons.message;
          nav=() { Get.to(MessageAccount());};
          break;
        case "Đơn hàng":
          icon = FontAwesomeIcons.bagShopping;
          nav=() { Get.to(OrderAccount());};
          break;
        case "Thông báo":
          icon = FontAwesomeIcons.bell;
          nav=() { Get.offAll(NotificationPage());};
          break;
        case "Ví Voucher":
          icon = FontAwesomeIcons.wallet;
          break;
        case "Quản lý tích điểm":
          icon = FontAwesomeIcons.bitcoin;
          break;
        case "Sản phẩm yêu thích":
          icon = FontAwesomeIcons.heart;
          break;
        case "Cửa hàng theo dõi":
          icon = FontAwesomeIcons.store;
          break;
        case "Sản phẩm đã xem":
          icon = FontAwesomeIcons.eye;
          break;
        case "Quản lý cửa hàng":
          icon = FontAwesomeIcons.shopware;
          break;
      }
      return GestureDetector(
        child: Container(
          child: Row(
            children: [
              Container(
                  width: 50,
                  height: 50,
                  padding: EdgeInsets.all(15.0),
                  child: FaIcon(
                    icon,
                    size: 20,
                    color: kTextColor_gray,
                  )),
              Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      e,
                      style: TextStyle(color: kTextColor_gray),
                    ),
                    Container(
                      width: 50,
                      height: 50,
                      child: Icon(
                        Icons.keyboard_arrow_down,
                        color: kTextColor_gray,
                        size: sizeStar.width,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        onTap: nav,
      ) ;
    }).toList();
    return Padding(
        padding: EdgeInsets.symmetric(horizontal: 5.0),
        child: ListView.separated(
          physics: NeverScrollableScrollPhysics(),
          scrollDirection: Axis.vertical,
          shrinkWrap: true,
          itemCount: _menus.length,
          separatorBuilder: (context, index) {
            return Divider(
              color: kTextColor,
              height: 0,
              indent: 50,
              thickness: 0.2,
            );
          },
          itemBuilder: (BuildContext context, int index) {
            return _menusWidget[index];
          },
        ));
  }
}
