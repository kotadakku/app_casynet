
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

import '../../../controller/auth/authentication_manager.dart';
import '../../../routes/app_pages.dart';
import '../../widgets/account/appbar_account_widget.dart';
import '../../widgets/account/menu_account_widget.dart';
import '../../widgets/account/profile_account_widget.dart';
import '../store/mystore.dart';
import '../theme/app_colors.dart';


class AccountBasePage extends StatelessWidget {
  const AccountBasePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    AuthenticationManager _authManager = Get.find();
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
                  Obx((){
                    if(!_authManager.isLogged.value){
                      return Padding(padding: EdgeInsets.symmetric(vertical: 10.0),
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
                      );
                    }
                    else {
                      return Column(
                        children: [
                          // Thông tin nguoif dùng
                          ProfileAccountWidget(),
                          // Nút của hàng của tôi
                          Container(width: double.infinity,
                              padding: EdgeInsets.symmetric(horizontal: 20),
                              child: GetBuilder<AuthenticationManager>(
                                  init: AuthenticationManager(),
                                  builder: (controller){
                                    return ElevatedButton(
                                      onPressed: () {
                                        Get.to(Mystore());
                                      },
                                      child: Text(controller.user_current.storeId == null ? "Tạo cửa hàng" :"Cửa hàng của tôi",
                                        style: TextStyle(
                                            color: Colors.white
                                        ),
                                      ),
                                      style: ElevatedButton.styleFrom(
                                          primary: kYellowColor,
                                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(50.0))
                                      ),
                                    );
                                  })
                          )
                        ],
                      );
                    }
                  }),
                  Divider(
                    color: kBackgroundColor,
                    height: 20,
                    thickness: 10,
                  ),
                  // Tùy chọn người dùng
                  MenuAccountWidget(),
                  Obx((){
                    if(_authManager.isLogged.value) return Padding(
                        padding: EdgeInsets.symmetric(horizontal: 10.w),
                        child: OutlinedButton(
                          onPressed: () {
                            _authManager.logOut();
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
                    );
                    else return Text('');
                  })

                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
