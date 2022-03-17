import 'package:app_casynet/containts.dart';
import 'package:app_casynet/screens/auth/auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../widget/account/menu.dart';
import '../../widget/account/top_account.dart';
import '../../widget/home/bottom_navigator.dart';

class AccountBasePage extends StatelessWidget {
  const AccountBasePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigator(),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            color: Colors.white,
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                TopAccount(),
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
               AccountMenu(),
              ],
            ),
          ),
        ),
      )
    );
  }
}
