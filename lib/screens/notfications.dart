import 'package:app_casynet/widget/bottom_navigator.dart';
import 'package:flutter/material.dart';

import '../widget/account/top_account_widget.dart';

class NotificationPage extends StatelessWidget {
  const NotificationPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<Widget> _menus = [
      ListTile(
        // Ảnh thông báo
        leading: Image.asset("assets/notification/noti_1.png"),
        // Tên thông báo
        title: Text("Casynet gui KH don hang #221635372"),
        // Chi tiết thông báo
        subtitle: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Khoa Hoc Thiet Ke"),
            Text("17:01 14-03-2020")
          ],
        ),
      ),
      ListTile(
        leading: Image.asset("assets/notification/noti_1.png"),
        title: Text("Casynet gui KH don hang #221635372"),
        subtitle: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Khoa Hoc Thiet Ke"),
            Text("17:01 14-03-2020")
          ],
        ),
      ),
      ListTile(
        leading: Image.asset("assets/notification/noti_1.png"),
        title: Text("Casynet gui KH don hang #221635372"),
        subtitle: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Khoa Hoc Thiet Ke"),
            Text("17:01 14-03-2020")
          ],
        ),
      ),
      ListTile(
        leading: Image.asset("assets/notification/noti_1.png"),
        title: Text("Casynet gui KH don hang #221635372"),
        subtitle: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Khoa Hoc Thiet Ke"),
            Text("17:01 14-03-2020")
          ],
        ),
      ),
    ];
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [
            // Thanh tìm kiếm
            TopAccountWidget(),
            Container(
              width: double.infinity,
              color: Color(0xffF1F3FD),
              child: Padding(
                padding: EdgeInsets.symmetric(vertical: 15, horizontal: 10),
                child: Text("Thông báo",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
              )


            ),
            // Danh sách thông báo
            ListView.builder(
                itemCount: 4,
                scrollDirection: Axis.vertical,
                shrinkWrap: true,
                itemBuilder: (context, index){
                  return Padding(padding: EdgeInsets.symmetric(vertical: 10), child: _menus[index]);
                }
            )
          ],
        ),
      )
    ) ;
  }
}
