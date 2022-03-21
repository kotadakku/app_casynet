
import 'package:flutter/material.dart';

class ProfileAccountWidget extends StatelessWidget {
  const ProfileAccountWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      // Ảnh đại diện
      leading: CircleAvatar(

        child: Text("123", style: TextStyle(fontSize: 40)),
      ),
      // Tên
      title: Text("Jave Rubi",),
      subtitle: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 10,),
          Text(
            "Tài khoản Facebook"
          ),
          // Ngày tham gia
          Text("Thành viên tù: 09/04/2020")
        ],
      ),
    );
  }
}
