
import 'package:app_casynet/app/controller/auth/authentication_manager.dart';
import 'package:app_casynet/app/views/widgets/image_network_loading.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../theme/app_colors.dart';
import '../../../widgets/shadow_of_doubt.dart';

class ProfileAccountWidget extends StatelessWidget {
  const ProfileAccountWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<AuthenticationManager>(
      init: AuthenticationManager(),
      builder: (controller){
      return ListTile(
        contentPadding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 10.0),
        // Ảnh đại diện
        leading: Container(
          child: Stack(
            children: [
              ShadowOfDoubt(
                diameter: 60,
                origin: Offset(0,60),
              ),
              Container(
                height: 60,
                width: 60,
                decoration: BoxDecoration(
                  border: Border.all(color: kYellowColor, width: 2),
                  color: Colors.white,
                  shape: BoxShape.circle,
                ),
                child: ClipOval(
                  child: ImageNetworkLoading(image_url: controller.user_current.image.toString()),
                ),

              ),

            ],
          ),),
        // Tên
        title: Text('${controller.user_current.lastname?? "user_312312"} ${controller.user_current.firstname??''}',
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
            Text("Thành viên từ: ${controller.user_current.created_at?? '__/__/20__'}",
              style: TextStyle(
                  color: kTextColor_gray
              ),
            )
          ],
        ),
      );
    });
  }
}


