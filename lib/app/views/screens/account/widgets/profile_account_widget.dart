
import 'package:app_casynet/app/views/widgets/image_network_loading.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../controller/account/auth/authentication_manager.dart';
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
              const ShadowOfDoubt(
                diameter: 60,
                origin: Offset(0,60),
              ),
              Container(
                height: 60,
                width: 60,
                decoration: BoxDecoration(
                  border: Border.all(color: AppColors.yellowColor, width: 2),
                  color: Colors.white,
                  shape: BoxShape.circle,
                ),
                child: ClipOval(
                  child: ImageNetworkLoading(image_url: controller.user_current.value.image.toString()),
                ),

              ),

            ],
          ),),
        // Tên
        title: Text('${controller.user_current.value.firstname?? "user_312312"} ${controller.user_current.value.lastname??''}',
          style: const TextStyle(
              color: AppColors.yellowColor,
              fontWeight: FontWeight.bold
          ),
        ),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 10,),
             Text(
              "Tài khoản Facebook",
              style: TextStyle(
                  color: AppColors.textGrayBoldColor
              ),
            ),
            // Ngày tham gia
            Text("${'joined'.tr}: ${controller.user_current.value.created_at?? '__/__/20__'}",
              style: const TextStyle(
                  color: AppColors.textGrayBoldColor
              ),
            )
          ],
        ),
      );
    });
  }
}


