import 'package:app_casynet/containts/colors.dart';
import 'package:app_casynet/screens/account/account_base.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

import '../Cart/cart.dart';
import '../screens/account/account_login.dart';
import '../screens/account/infor_account.dart';
import '../screens/account/order/order_account.dart';
import '../screens/details.dart';
import '../screens/home.dart';
import '../screens/notfications.dart';

class BottomNavigator extends StatelessWidget {
  var selectedIndex = 0.obs;
  BottomNavigator({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
                color: kTextColor,
                offset: Offset(0.0, -1.0)
            )
          ]
      ),
      child: Obx(()=> BottomNavigationBar(
        showSelectedLabels: false,
        unselectedItemColor: Colors.black,
        items: [
          BottomNavigationBarItem(
              icon: SvgPicture.asset("assets/bottom_navi_icon/home.svg", width: 30,),
              // activeIcon: ,
              label: "Home"
          ),
          BottomNavigationBarItem(
              icon: Stack(
                children: <Widget>[
                  SvgPicture.asset("assets/bottom_navi_icon/noti.svg", width: 30,),
                  Positioned(
                    right: 0,
                    child: new Container(
                      padding: EdgeInsets.all(1),
                      decoration: new BoxDecoration(
                        color: kYellowColor,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      constraints: BoxConstraints(
                        minWidth: 18,
                        minHeight: 18,
                      ),
                      child: new Text(
                        '10',
                        style: new TextStyle(
                          color: Colors.white,
                          fontSize: 13,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  )
                ],
              ),
              label: "Notications"
          ),
          BottomNavigationBarItem(
              icon: SvgPicture.asset("assets/bottom_navi_icon/cart.svg", width: 30,),
              label: "Cart"
          ),
          BottomNavigationBarItem(
              icon: SvgPicture.asset("assets/bottom_navi_icon/account.svg", width: 30,),
              label: "Account"
          ),
          BottomNavigationBarItem(
              icon: SvgPicture.asset("assets/bottom_navi_icon/detail.svg", width:30),
              label: "Detail"
          ),
        ],
        currentIndex: selectedIndex.value,
        selectedItemColor: Colors.black,
        onTap: _onItemTapped,
      ),
    ));
  }
  void _onItemTapped(int index) {
    switch(index){
      case 0: Get.offNamed("/home");
      break;
      case 1: Get.off(NotificationPage());
      break;
      case 2: Get.to(Cart());
      break;
      case 3: Get.offNamed('/account/login');
      break;
      case 4: Get.to(DetailsPage());
      break;
    };
    selectedIndex.value = index;

  }
}
