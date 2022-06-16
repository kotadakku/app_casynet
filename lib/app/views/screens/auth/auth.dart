
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

import '../../../controller/account/auth/auth_controller.dart';
import 'widgets/register_widget.dart';
import '../../theme/app_colors.dart';
import 'widgets/signin_widget.dart';

class AuthPage extends StatelessWidget {
  const AuthPage({Key? key}) : super(key: key);

  Home({required int home}){}


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
                      color: AppColors.yellowColor,
                      child: Stack(
                        children: [
                          Positioned(
                              left: -15,
                              bottom: -20,
                              child: SvgPicture.asset("assets/images/auth/background.svg", width: 420,)
                          ),
                          Positioned(
                              left: -15,
                              bottom: -70,
                              child: SvgPicture.asset("assets/images/auth/background_2.svg", width: 420,)
                          ),
                          Positioned(
                            left: 50,
                            top: 70,
                            child:  Image.asset("assets/images/splash/logo-while.png"),
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
                        indicatorColor: AppColors.yellowColor,
                        tabs: [
                          Tab(
                            child: Text('login'.tr,
                              style: TextStyle(
                                  color: AppColors.yellowColor
                              ),
                            ),
                          ),
                          Tab(
                            child: Text('register'.tr,
                              style: TextStyle(
                                  color: AppColors.yellowColor
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
    );
  }
}

