import 'package:app_casynet/screens/account/account_base.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../screens/home.dart';

class BottomNavigator extends StatefulWidget {
  const BottomNavigator({Key? key}) : super(key: key);

  @override
  State<BottomNavigator> createState() => _BottomNavigatorState();
}

class _BottomNavigatorState extends State<BottomNavigator> {
  int _selectedIndex = 1;
  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      showSelectedLabels: false,
      unselectedItemColor: Colors.black,
      items: [
        BottomNavigationBarItem(
          icon: SvgPicture.asset("assets/bottom_navi_icon/home.svg", width: 30,),
          // activeIcon: ,
          label: "Home"
        ),
        BottomNavigationBarItem(
          icon: SvgPicture.asset("assets/bottom_navi_icon/noti.svg", width: 30,),
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
      currentIndex: _selectedIndex,
      selectedItemColor: Colors.black,
      onTap: _onItemTapped,
    );
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
    switch(index){
      case 0: Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context){
        return HomePage();
      }), (route) => false);
      break;
      case 3:  Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context){
        return AccountBasePage();
      }), (route) => false);
      break;
    }

  }
}
