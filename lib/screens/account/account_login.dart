import 'package:app_casynet/containts/colors.dart';
import 'package:app_casynet/widget/account/profile_account_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../widget/account/menu_account_widget.dart';
import '../../widget/account/top_account_widget.dart';
import '../../widget/bottom_navigator.dart';

class AccountLoginPage extends StatelessWidget {
  const AccountLoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        bottomNavigationBar: BottomNavigator(),
        backgroundColor: Colors.white,
        body: SafeArea(
          child: SingleChildScrollView(
            child: Container(
              color: Colors.white,
              child: Column(
                children: [
                  // Thanh tìm kiếm
                  TopAccountWidget(),
                  // Thông tin nguoif dùng
                  SizedBox(height: 20,),
                  ProfileAccountWidget(),
                  // Nút của hàng của tôi
                  Container(width: double.infinity,
                    padding: EdgeInsets.symmetric(horizontal: 20),
                    child: ElevatedButton(
                      onPressed: () {  },
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

                  SizedBox(height: 15, child: Container(color: Color(0xffF1F3FD),),),
                  // Tùy chọn tài khoản
                  MenuAccountWidget(),
                  SizedBox(height: 10, child: Container(color: Color(0xffF1F3FD),),),
                  // nút đằng xuất
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 10),
                    child: OutlinedButton(
                      onPressed: () {  },
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
            ),
          ),
        )
    );
  }
}
