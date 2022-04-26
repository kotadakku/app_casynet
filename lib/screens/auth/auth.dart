import 'package:app_casynet/widget/auth/register_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';

import '../../theme/app_colors.dart';
import '../../widget/auth/signin_widget.dart';


class AuthPage extends StatefulWidget {
  const AuthPage({Key? key}) : super(key: key);

  @override
  State<AuthPage> createState() => _AuthPageState();
}

class _AuthPageState extends State<AuthPage> with SingleTickerProviderStateMixin {
  late TabController _controller;
  late Rx<GoogleSignInAccount> googleSignInAccount;


  @override
  void initState() {
    super.initState();
    _controller = TabController(length:2, vsync: this);
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          height: MediaQuery.of(context).size.height,
          child: Column(
            children: [
              Container(
                height: 180,
                width: double.infinity,
                color: kYellowColor,
                child: Stack(
                  children: [
                    Positioned(
                      left: -15,
                      bottom: -20,
                      child: SvgPicture.asset("assets/background.svg", width: 420,)
                    ),
                    Positioned(
                        left: -15,
                        bottom: -70,
                        child: SvgPicture.asset("assets/background_2.svg", width: 420,)
                    ),
                    Positioned(
                      left: 50,
                      top: 70,
                      child:  Image.asset("assets/splash/logo-while.png"),
                    )
                  ],
                ),
              ),
              Container(
                decoration: BoxDecoration(
                    color: Colors.white
                ),
                child: TabBar(
                  controller: _controller,
                  indicatorColor: kYellowColor,
                  tabs: [
                    Tab(
                      child: Text("Đăng nhập",
                        style: TextStyle(
                            color: kYellowColor
                        ),
                      ),
                    ),
                    Tab(
                      child: Text("Đăng ký",
                        style: TextStyle(
                            color: kYellowColor
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(child: TabBarView(
                controller: _controller,
                children: [
                  SignInWidget(),
                  RegisterWidget()
                ],
              ),
              )
            ],
          ),
        )
      )
    );
  }
}
