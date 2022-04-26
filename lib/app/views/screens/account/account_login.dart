
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../../controller/account/account_page_controller.dart';
import '../../widgets/account/appbar_account_widget.dart';
import '../../widgets/account/menu_account_widget.dart';
import '../../widgets/account/profile_account_widget.dart';
import '../store/mystore.dart';
import '../theme/app_colors.dart';

class AccountLoginPage extends StatelessWidget {
  const AccountLoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final AccountPageController controller = AccountPageController();
    return Scaffold(
        appBar: AppBarAccountWidget(),
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          child: Column(
            children: [
              // Thông tin nguoif dùng
              ProfileAccountWidget(),
              // Nút của hàng của tôi
              Container(width: double.infinity,
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: ElevatedButton(
                  onPressed: () {
                    Get.to(Mystore());
                  },
                  child:
                  Text("Cửa hàng của tôi",
                    style: TextStyle(
                        color: Colors.white
                    ),
                  ),
                  style: ElevatedButton.styleFrom(
                      primary: kYellowColor,
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(50.0))
                  ),
                ),
              ),
              Divider(
                color: kBackgroundColor,
                height: 20,
                thickness: 10,
              ),

              // Tùy chọn tài khoản
              MenuAccountWidget(),
              SizedBox(height: 10.h, child: Container(color: Color(0xffF1F3FD),),),
              // nút đằng xuất
              Padding(
                  padding: EdgeInsets.symmetric(horizontal: 10.w),
                  child: OutlinedButton(
                    onPressed: () {
                      controller.logout();
                    },
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        FaIcon(FontAwesomeIcons.arrowRightFromBracket, size: 15, color: kYellowColor,),
                        SizedBox(width: 10.0,),
                        Text("Đăng xuất",
                          style: TextStyle(
                              color: kYellowColor
                          ),
                        )
                      ],
                    ),
                  )
              )
            ],
          ),
        )
    );
  }
}


