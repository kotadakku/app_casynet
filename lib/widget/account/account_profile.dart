
import 'package:flutter/material.dart';

class AccountProfile extends StatelessWidget {
  const AccountProfile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: CircleAvatar(

        child: Text("123", style: TextStyle(fontSize: 40)),
      ),
      title: Text("Jave Rubi",),
      subtitle: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 10,),
          Text(
            "Tài khoản Facebook"
          ),
          Text("Thành viên tù: 09/04/2020")
        ],
      ),
    );
  }
}
