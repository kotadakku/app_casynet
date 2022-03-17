import 'package:app_casynet/containts.dart';
import 'package:app_casynet/widget/account/account_profile.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../widget/account/menu.dart';
import '../../widget/account/top_account.dart';
import '../../widget/home/bottom_navigator.dart';

class AccountLoginPage extends StatelessWidget {
  const AccountLoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        bottomNavigationBar: BottomNavigator(),
        body: SafeArea(
          child: SingleChildScrollView(
            child: Container(
              height: MediaQuery.of(context).size.height-150,
              color: Colors.white,
              child: Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  TopAccount(),
                  AccountProfile(),
                  SizedBox(width: 250,
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
                  AccountMenu(),
                  SizedBox(height: 10, child: Container(color: Color(0xffF1F3FD),),),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 10),
                    child: OutlinedButton(
                      onPressed: () {  },
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(Icons.assignment_ind_outlined, color: kYellowColor),
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
