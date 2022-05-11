import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Bottommenu extends StatelessWidget {
  const Bottommenu({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        currentIndex: 0,
        // selectedLabelStyle: TextStyle(fontSize: 22),
        selectedItemColor: Colors.black38,
        items: [

          BottomNavigationBarItem(
            icon: ImageIcon(
              AssetImage("assets/Icon/icon_home.png"),
              color: Colors.amber,
            ),
            label: "Home",
            // title: Text(
            //   "Home",
            //   style: TextStyle(color: Colors.black38),
            // ),
            backgroundColor: Colors.blue,
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.grid_view,
              color: Colors.black38,
            ),
            label: "Danh mục",
            // title: Text(
            //   "Danh mục",
            //   style: TextStyle(color: Colors.black38),
            // ),
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.shopping_cart_outlined,
              color: Colors.black38,
            ),
            label: "Giỏ hàng",
            // title: Text(
            //   "Giỏ hàng",
            //   style: TextStyle(color: Colors.black38),
            // ),
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.account_circle_outlined,
              color: Colors.black38,
            ),
            label: "Tài khoản",
            // title: Text(
            //   "Tài khoản",
            //   style: TextStyle(color: Colors.black38),
            // ),
          ),
          BottomNavigationBarItem(
            backgroundColor: Colors.blue,
            icon: Icon(
              Icons.directions_car_outlined,
              color: Colors.black38,
            ),
            label: "Chọn xe",
            // title: Text(
            //   "Chọn xe",
            //   style: TextStyle(color: Colors.black38),
            // ),
          ),
        ],
        onTap: (index) {

        });
  }
}
