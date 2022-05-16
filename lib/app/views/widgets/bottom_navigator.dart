
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import '../../controller/bottom_nav_controller.dart';
import '../../utlis/service/notication_service.dart';
import '../theme/app_colors.dart';

class BottomNavigator extends StatelessWidget {
  var c = Get.find<BottomNavController>();
  BottomNavigator({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: Colors.white,
      ),
      child: Obx(()=> BottomNavigationBar(
        showSelectedLabels: false,
        items: [
          BottomNavigationBarItem(
              icon: Icon(Icons.home_outlined, color: kTextColor, size: 35,),
              activeIcon: Icon(Icons.home, color: kYellowColor, size: 35,),
              // activeIcon: ,
              label: "Home"
          ),
          BottomNavigationBarItem(
              icon: Stack(
                children: <Widget>[
                  Icon(Icons.notifications_none, color: kTextColor, size: 35,),
                  GetBuilder<NotificationService>(
                      init: NotificationService(),
                      builder: (controller){
                        return controller.totalNotificationCounter==0 ? SizedBox(): Positioned(
                          right: 0,
                          child: new Container(
                            padding: EdgeInsets.all(1),
                            decoration: new BoxDecoration(
                              color: Colors.white,
                              border: Border.all(color: kYellowColor),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            constraints: BoxConstraints(
                              minWidth: 18,
                              minHeight: 18,
                            ),
                            child: new Text(
                              controller.totalNotificationCounter.toString(),
                              style: new TextStyle(
                                color: kYellowColor,
                                fontSize: 13,
                              ),
                              textAlign: TextAlign.center,
                            ),
                          ),
                        );
                      }
                  )
                ],
              ),
              activeIcon: Icon(Icons.notifications, color: kYellowColor, size: 35,),
              label: "Notications"
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.shopping_cart_outlined, color: kTextColor, size: 35),
              activeIcon: Icon(Icons.shopping_cart, color: kYellowColor, size: 35),
              label: "Cart"
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.account_circle_outlined, color: kTextColor, size: 35,),
              activeIcon: Icon(Icons.account_circle, color: kYellowColor, size: 35,),
              label: "Account"
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.help_outline, color: kTextColor, size: 35,),
              activeIcon: Icon(Icons.help, color: kYellowColor, size: 35,),
              label: "Detail"
          ),
        ],
        showUnselectedLabels: false,
        currentIndex: c.tabIndex.value,
        elevation: 10,
        type: BottomNavigationBarType.fixed,
        onTap:(index)=> c.changeTabIndex(index),
      ),
    ));
  }
}
