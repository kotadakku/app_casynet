import 'package:app_casynet/containts.dart';
import 'package:flutter/material.dart';

class AccountMenu extends StatelessWidget {

  const AccountMenu({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    final List<Widget> _menus = [
      Container(
        child: ListTile(
          leading: Icon(Icons.add),
          title: Text("Thông tin tài khoản"),
          trailing: Icon(Icons.keyboard_arrow_down),
        ),
      ),
      Container(
        child: ListTile(
          leading: Icon(Icons.add),
          title: Text("Địa chỉ"),
          trailing: Icon(Icons.keyboard_arrow_down),
        ),
      ),
      Container(
        child: ListTile(
          leading: Icon(Icons.add),
          title: Text("Tin nhắn"),
          trailing: Icon(Icons.keyboard_arrow_down),
        ),
      ),
      Container(
        child: ListTile(
          leading: Icon(Icons.add),
          title: Text("Đơn hàng"),
          trailing: Icon(Icons.keyboard_arrow_down),
        ),
      ),
      Container(
        child: ListTile(
          leading: Icon(Icons.add),
          title: Text("Thông báo"),
          trailing: Icon(Icons.keyboard_arrow_down),
        ),
      )
    ];
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 10.0),
      child: ListView.separated(
        physics: NeverScrollableScrollPhysics(),
        scrollDirection: Axis.vertical,
        shrinkWrap: true,
        itemCount: _menus.length,
        separatorBuilder: (context, index) {
          return Divider(
            color: kYellowColor,
          );
        },
        itemBuilder: (BuildContext context, int index) {
          return _menus[index];
        },
      )
    );
  }
}
