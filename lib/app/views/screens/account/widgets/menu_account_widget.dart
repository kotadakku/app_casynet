
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../../../controller/auth/authentication_manager.dart';
import '../../../../routes/app_pages.dart';
import '../../../theme/app_colors.dart';
import '../../store_manager/UI_cuahang.dart';


class MenuAccountWidget extends StatelessWidget {
  const MenuAccountWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    AuthenticationManager _authManager = Get.find();
    final List<String> _menus = [
      "Thông tin tài khoản",
      "Địa chỉ",
      "Tin nhắn",
      "Đơn hàng",
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
          (!_authManager.isLogged.value || _authManager.user_current == null) ? nav=() { Get.toNamed(Routes.AUTH, arguments: 0);}:
          nav=() { Get.toNamed(Routes.ACCOUNT_DETAIL, arguments: [12]);};
          break;
        case "Địa chỉ":
          icon = FontAwesomeIcons.mapLocation;
          (!_authManager.isLogged.value || _authManager.user_current == null) ? nav=() { Get.toNamed(Routes.AUTH, arguments: 0);}:
          nav=() { Get.toNamed(Routes.ACCOUNT_ADDRESS);};
          break;
        case "Tin nhắn":
          icon = FontAwesomeIcons.message;
          (!_authManager.isLogged.value || _authManager.user_current == null) ? nav=() { Get.toNamed(Routes.AUTH, arguments: 0);} :
          nav=() { Get.toNamed(Routes.MESSAGES,  arguments: [12]);};
          break;
        case "Đơn hàng":
          icon = FontAwesomeIcons.bagShopping;
          (!_authManager.isLogged.value || _authManager.user_current == null) ? nav=() { Get.toNamed(Routes.AUTH, arguments: 0);} :
          nav=() { Get.toNamed(Routes.ACCOUNT_ORDER, arguments: [12]);};
          break;
        case "Ví Voucher":
          icon = FontAwesomeIcons.wallet;
          (!_authManager.isLogged.value || _authManager.user_current == null) ? nav=() { Get.toNamed(Routes.AUTH, arguments: 0);}:
          nav=() {Get.toNamed(Routes.ACCOUNT_WALLET_VOUCHER,  arguments: [12]);};
          break;
        case "Quản lý tích điểm":
          icon = FontAwesomeIcons.bitcoin;
          (!_authManager.isLogged.value || _authManager.user_current == null) ? nav=() { Get.toNamed(Routes.AUTH, arguments: 0);}:
          nav =(){Get.toNamed(Routes.ACCOUNT_CASYCOIN,  arguments: [12]);};
          break;
        case "Sản phẩm yêu thích":
          icon = FontAwesomeIcons.heart;
          (!_authManager.isLogged.value || _authManager.user_current == null) ? nav=() { Get.toNamed(Routes.AUTH, arguments: 0);}:
          nav =(){Get.toNamed(Routes.PRODUCTS_FAVOURITE,  arguments: [12]);};
          break;
        case "Cửa hàng theo dõi":
          icon = FontAwesomeIcons.store;
          (!_authManager.isLogged.value || _authManager.user_current == null) ? nav=() { Get.toNamed(Routes.AUTH, arguments: 0);}:
          nav =(){Get.toNamed(Routes.STORE_FOLLOWED,  arguments: [12]);};
          break;
        case "Sản phẩm đã xem":
          icon = FontAwesomeIcons.eye;
          (!_authManager.isLogged.value || _authManager.user_current == null) ? nav=() { Get.toNamed(Routes.AUTH, arguments: 0);}:
          nav =(){Get.toNamed(Routes.PRODUCTS_SEEN, arguments: [12] );};
          break;
        case "Quản lý cửa hàng":
          icon = FontAwesomeIcons.shopware;
          (!_authManager.isLogged.value || _authManager.user_current == null) ? nav=() { Get.toNamed(Routes.AUTH, arguments: 0);}:
          nav =(){Get.toNamed(Routes.STORE_MANAGER);};
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
