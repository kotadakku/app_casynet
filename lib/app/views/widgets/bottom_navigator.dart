
import 'package:app_casynet/app/controller/home/bottombar_controller.dart';
import 'package:app_casynet/app/controller/home/home_controller.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import '../../utlis/service/notication_service.dart';
import '../theme/app_colors.dart';

class BottomNavigator extends StatelessWidget {
  final BottombarController _bottombarController = Get.find();
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
          const BottomNavigationBarItem(
              icon: Icon(Icons.home_outlined, color: AppColors.textGrayColor, size: 35,),
              activeIcon: Icon(Icons.home, color: AppColors.yellowColor, size: 35,),
              // activeIcon: ,
              label: "Home"
          ),
          BottomNavigationBarItem(
              icon: Stack(
                children: <Widget>[
                  Icon(Icons.notifications_none, color: AppColors.textGrayColor, size: 35,),
                  GetBuilder<NotificationService>(
                      init: NotificationService(),
                      builder: (controller){
                        return controller.totalNotificationCounter==0 ? SizedBox(): Positioned(
                          right: 0,
                          child: Container(
                            padding: const EdgeInsets.all(1),
                            decoration:BoxDecoration(
                              color: Colors.white,
                              border: Border.all(color: AppColors.yellowColor),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            constraints: const BoxConstraints(
                              minWidth: 18,
                              minHeight: 18,
                            ),
                            child: Text(
                              controller.totalNotificationCounter.toString(),
                              style: const TextStyle(
                                color: AppColors.yellowColor,
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
              activeIcon: Icon(Icons.notifications, color: AppColors.yellowColor, size: 35,),
              label: "Notications"
          ),
          const BottomNavigationBarItem(
              icon: Icon(Icons.shopping_cart_outlined, color: AppColors.textGrayColor, size: 35),
              activeIcon: Icon(Icons.shopping_cart, color: AppColors.yellowColor, size: 35),
              label: "Cart"
          ),
          const BottomNavigationBarItem(
              icon: Icon(Icons.account_circle_outlined, color: AppColors.textGrayColor, size: 35,),
              activeIcon: Icon(Icons.account_circle, color: AppColors.yellowColor, size: 35,),
              label: "Account"
          ),
          const BottomNavigationBarItem(
              icon: Icon(Icons.help_outline, color: AppColors.textGrayColor, size: 35,),
              activeIcon: Icon(Icons.help, color: AppColors.yellowColor, size: 35,),
              label: "Detail"
          ),
        ],
        showUnselectedLabels: false,
        currentIndex: _bottombarController.tabIndex.value,
        elevation: 10,
        type: BottomNavigationBarType.fixed,
        onTap:(index)=> _bottombarController.changeTabIndex(index),
      ),
    ));
  }
}
