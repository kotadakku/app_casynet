import 'package:app_casynet/containts/colors.dart';
import 'package:app_casynet/screens/auth/auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../widget/account/menu_account_widget.dart';
import '../../widget/account/top_account_widget.dart';
import '../../widget/bottom_navigator.dart';

class AccountBasePage extends StatelessWidget {
  const AccountBasePage({Key? key}) : super(key: key);

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
              mainAxisSize: MainAxisSize.max,
              children: [
                // Thanh tìm kiếm
                TopAccountWidget(),
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
                            Navigator.push(context, MaterialPageRoute(builder: (builder){
                              return AuthPage();
                            }));
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
                            Navigator.push(context, MaterialPageRoute(builder: (builder){
                              return AuthPage();
                            }));
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
      )
    );
  }
}
