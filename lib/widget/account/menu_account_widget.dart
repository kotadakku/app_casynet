import 'package:app_casynet/containts/colors.dart';
import 'package:app_casynet/screens/account/UI_qlch/UI_cuahang.dart';
import 'package:app_casynet/screens/notfications.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../containts/colors.dart';
import '../../screens/account/casycoin_manager.dart';
import '../../screens/account/favourite_product.dart';
import '../../screens/account/follow_store.dart';
import '../../screens/account/infor_account.dart';
import '../../screens/account/address/information_address.dart';
import '../../screens/account/order/order_account.dart';
import '../../screens/account/seen_product.dart';
import '../../screens/account/wallet_voucher.dart';


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
          nav=() { Get.to(InformationAddress());};
          break;
        case "Tin nhắn":
          icon = FontAwesomeIcons.message;
          nav=() { Get.toNamed('/account/all_message');};
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
          nav=() {Get.to(WalletVoucher());};
          break;
        case "Quản lý tích điểm":
          icon = FontAwesomeIcons.bitcoin;
          nav =(){Get.to(CasycoinManager());};
          break;
        case "Sản phẩm yêu thích":
          icon = FontAwesomeIcons.heart;
          nav =(){Get.to(FavouriteProduct());};
          break;
        case "Cửa hàng theo dõi":
          icon = FontAwesomeIcons.store;
          nav =(){Get.to(FollowedStore());};
          break;
        case "Sản phẩm đã xem":
          icon = FontAwesomeIcons.eye;
          nav =(){Get.toNamed('/product/seen_product');};
          break;
        case "Quản lý cửa hàng":
          icon = FontAwesomeIcons.shopware;
          nav =(){Get.to(menucuahang());};
          break;
      }
      return GestureDetector(
        behavior: HitTestBehavior.translucent,
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
                        Icons.arrow_forward_ios,
                        color: kTextColor_gray,
                        size: 12,
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
