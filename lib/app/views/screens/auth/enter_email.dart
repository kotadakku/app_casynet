

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:app_casynet/app/controller/controller.dart';
import '../../theme/app_colors.dart';

class EnterEmailReset extends StatelessWidget {
  EnterEmailReset({Key? key}) : super(key: key);
  TextEditingController email_reset = TextEditingController();
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  AuthController _authController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: GestureDetector(
          onTap: (){
            FocusManager.instance.primaryFocus!.unfocus();
          },
          child: Container(
            height: MediaQuery.of(context).size.height,
            child: Stack(
              children: [
                Column(
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
                    Expanded(
                        child: Form(
                          key: formKey,
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Padding(
                                padding: EdgeInsets.all(10.0),
                                child: Text('enter_email'.tr),
                              ),
                              Padding(
                                padding: EdgeInsets.symmetric(horizontal: 10.w),
                                child: TextFormField(
                                  controller: email_reset,
                                  validator: (value){
                                    if (value!.isEmpty ||
                                        !RegExp(r"^[a-zA-Z0-9.]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                                            .hasMatch(value)) {
                                      return 'Email không hợp lệ';
                                    }

                                  },
                                  decoration: InputDecoration(
                                    border: OutlineInputBorder(
                                      borderSide: BorderSide(
                                          color: AppColors.yellowColor
                                      ),
                                      borderRadius: BorderRadius.circular(50.0),
                                    ),
                                    focusedBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(50.0),
                                      borderSide: BorderSide(color: AppColors.yellowColor, width: 2.0),
                                    ),
                                    enabledBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(50.0),
                                      borderSide: BorderSide(color: AppColors.textGrayColor, width: 2.0),
                                    ),
                                  ),
                                ),
                              ),
                              ElevatedButton(
                                child: Text('reset'.tr),
                                onPressed: (){
                                  if(formKey.currentState!.validate()){
                                    _authController.resetPassword(email_reset.text);
                                  }
                                },
                              )
                            ],
                          ),
                        )
                    )
                  ],
                ),
                Obx(()=>
                  _authController.isSending == true ? Center(
                    child: CircularProgressIndicator.adaptive(),
                  ) : SizedBox()
                )
              ],
            )
          ),
        )
    );
  }
}
