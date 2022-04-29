
import 'package:app_casynet/app/controller/auth/auth_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

import 'widgets/register_widget.dart';
import '../theme/app_colors.dart';
import 'widgets/signin_widget.dart';

class AuthPage extends StatelessWidget {
  const AuthPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    AuthController authController = Get.find();
    return Scaffold(
        body: SingleChildScrollView(
            child: GestureDetector(
              onTap: (){
                FocusManager.instance.primaryFocus!.unfocus();
              },
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
                        controller: authController.controller,
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
                      controller: authController.controller,
                      children: [
                        SignInWidget(),
                        RegisterWidget()
                      ],
                    ),
                    )
                  ],
                ),
              ),
            )
        )
    );;
  }
}

