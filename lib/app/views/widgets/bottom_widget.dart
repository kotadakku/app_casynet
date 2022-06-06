
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

import '../theme/app_colors.dart';
import '../theme/app_sizes.dart';

class BottomWidget extends StatelessWidget {
  const BottomWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 20, horizontal: 10),
      child: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: 20,),
            Text('${'introduce'.tr}  -  ${'nes_info'.tr}  -  ${'contact'.tr}',
              style: TextStyle(
                  fontSize: 15
              ),
            ),
            SizedBox(height: 20,),
            Image.asset("assets/images/home/dadangky.png", width: 200,),
            SizedBox(height: 20,),
            Text('Công ty cổ phần đầu tư Bắc Thủ Đô',
              style: TextStyle(
                  fontWeight: FontWeight.bold
              ),
            ),
            SizedBox(height: 10,),
            Text('Copyright @2020 casynet',
              style: TextStyle(
                  fontSize: 12,
                  color: AppColors.textGrayColor
              ),
            ),
          ],
        ),
      )
    );
  }
}
