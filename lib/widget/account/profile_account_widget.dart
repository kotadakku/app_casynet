
import 'package:app_casynet/containts/colors.dart';
import 'package:flutter/material.dart';

class ProfileAccountWidget extends StatelessWidget {
  const ProfileAccountWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      // Ảnh đại diện
      leading:
      Container(
        child: Container(
          height: 60,
          width: 60,
          decoration: BoxDecoration(
              image: DecorationImage(
                image: ExactAssetImage("assets/account/image_user.png"),
              ),
              border: Border.all(color: kYellowColor, width: 2),
              color: Colors.white,
              shape: BoxShape.circle,
          ),

        ),
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
                offset: Offset(0, 5),
                blurRadius: 10,
            ),
          ]
        ),
      ),

      // Tên
      title: Text("Jave Rubi",
        style: TextStyle(
          color: kYellowColor,
          fontWeight: FontWeight.bold
        ),
      ),
      subtitle: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 10,),
          Text(
            "Tài khoản Facebook",
            style: TextStyle(
              color: kTextColor_gray
            ),
          ),
          // Ngày tham gia
          Text("Thành viên tù: 09/04/2020",
            style: TextStyle(
                color: kTextColor_gray
            ),
          )
        ],
      ),
    );
  }
}
