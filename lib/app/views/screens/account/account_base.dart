
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../routes/app_pages.dart';
import '../../widgets/account/appbar_account_widget.dart';
import '../../widgets/account/menu_account_widget.dart';
import '../theme/app_colors.dart';


class AccountBasePage extends StatelessWidget {
  const AccountBasePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      child: SafeArea(
        child: Scaffold(
          backgroundColor: Colors.white,
          appBar: AppBarAccountWidget(),
          body: SingleChildScrollView(
            child: Container(
              color: Colors.white,
              child: Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  // Nút đăng nhập/ đăng ký
                  Padding(padding: EdgeInsets.symmetric(vertical: 10.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        SizedBox(
                          width: 150,
                          child: OutlinedButton(
                            onPressed: () {
                              Get.toNamed(Routes.AUTH, arguments: 0);
                            },
                            child: Text("Đăng nhập"),
                            style: OutlinedButton.styleFrom(
                                primary: kYellowColor,
                                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5.0))
                            ),
                          ),
                        ),

                        SizedBox(
                          width: 150,
                          child: OutlinedButton(
                            onPressed: () {
                              Get.toNamed(Routes.AUTH, arguments: 1);
                            },
                            child: Text("Đăng ký"),
                            style: OutlinedButton.styleFrom(
                                primary: kYellowColor,
                                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5.0))
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),

                  SizedBox(height: 15, child: Container(color: Color(0xffF1F3FD),),),
                  // Tùy chọn người dùng
                  MenuAccountWidget(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
