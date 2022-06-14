
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../../../controller/account/auth/authentication_manager.dart';
import '../../../../routes/app_pages.dart';
import '../../../theme/app_colors.dart';


class MenuAccountWidget extends StatelessWidget {
  const MenuAccountWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    AuthenticationManager _authManager = Get.find();
    final List<String> _menus = [
      'info-account',
      'address',
      'message',
      'order',
      'wallet_voucher',
      'casypoint',
      'favourite_product',
      'followed_seller',
      'viewed_product',
      'seller_manager'
    ];
    List<Widget> _menusWidget = _menus.map((e) {
      var icon;
      VoidCallback  nav = (){};
      switch (e) {
        case 'info-account':
          icon = FontAwesomeIcons.user;
          nav = (){
            if(!_authManager.isLogged.value || _authManager.user_current.value.id == null) Get.toNamed(Routes.AUTH, arguments: 0);
            else Get.toNamed(Routes.ACCOUNT_DETAIL, arguments: [12]); };
          break;
        case 'address':
          icon = FontAwesomeIcons.mapLocation;
          nav = (){
            if(!_authManager.isLogged.value || _authManager.user_current.value.id == null) Get.toNamed(Routes.AUTH, arguments: 0);
            else Get.toNamed(Routes.ACCOUNT_ADDRESS);
          };
          break;
        case 'message':
          icon = FontAwesomeIcons.message;
          nav = (){
            if(!_authManager.isLogged.value || _authManager.user_current.value.id == null) Get.toNamed(Routes.AUTH, arguments: 0);
            else  Get.toNamed(Routes.MESSAGES,  arguments: [12]);

          };
          break;
        case 'order':
          icon = FontAwesomeIcons.bagShopping;
          nav = () {
            if (!_authManager.isLogged.value ||
                _authManager.user_current.value.id == null)
              Get.toNamed(Routes.AUTH, arguments: 0);
            else
              Get.toNamed(Routes.ACCOUNT_ORDER, arguments: [12]);
          };
          break;
        case 'wallet_voucher':
          icon = FontAwesomeIcons.wallet;
          nav = () {
            if (!_authManager.isLogged.value ||
                _authManager.user_current.value.id == null)
              Get.toNamed(Routes.AUTH, arguments: 0);
            else
              Get.toNamed(Routes.ACCOUNT_WALLET_VOUCHER, arguments: [12]);
          };
          break;
        case 'casypoint':
          icon = FontAwesomeIcons.bitcoin;
          nav = () {
            if (!_authManager.isLogged.value ||
                _authManager.user_current.value.id == null)
              Get.toNamed(Routes.AUTH, arguments: 0);
            else
              Get.toNamed(Routes.ACCOUNT_CASYCOIN, arguments: [12]);
          };
          break;
        case 'favourite_product':
          icon = FontAwesomeIcons.heart;
          nav = () {
            if (!_authManager.isLogged.value ||
                _authManager.user_current.value.id == null)
              Get.toNamed(Routes.AUTH, arguments: 0);
            else
              Get.toNamed(Routes.PRODUCTS_FAVOURITE, arguments: [12]);
          };
          break;
        case 'followed_seller':
          icon = FontAwesomeIcons.store;
          nav = () {
            if (!_authManager.isLogged.value ||
                _authManager.user_current.value.id == null)
              Get.toNamed(Routes.AUTH, arguments: 0);
            else
              Get.toNamed(Routes.STORE_FOLLOWED, arguments: [12]);
          };
          break;
        case 'viewed_product':
          icon = FontAwesomeIcons.eye;
          nav = () {
            if (!_authManager.isLogged.value ||
                _authManager.user_current.value.id == null)
              Get.toNamed(Routes.AUTH, arguments: 0);
            else
              Get.toNamed(Routes.PRODUCTS_SEEN, arguments: [12]);
          };
          break;
        case 'seller_manager':
          icon = FontAwesomeIcons.shopware;
          nav = (){
            if(!_authManager.isLogged.value || _authManager.user_current.value.id == null) Get.toNamed(Routes.AUTH, arguments: 0);
            else Get.toNamed(Routes.STORE_MANAGER);

          };
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
                    color: AppColors.textGrayBoldColor,
                  )),
              Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      e.tr,
                      style: TextStyle(color: AppColors.textGrayBoldColor),
                    ),
                    Container(
                      width: 50,
                      height: 50,
                      child: Icon(
                        Icons.arrow_forward_ios,
                        color: AppColors.textGrayBoldColor,
                        size: 12,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        onTap: (){
          nav();
        },
      );
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
              color: AppColors.textGrayColor,
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
