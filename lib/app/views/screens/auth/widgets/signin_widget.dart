
import 'package:app_casynet/app/routes/app_pages.dart';
import 'package:app_casynet/app/views/widgets/loading_overlay.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

import '../../../../controller/account/auth/auth_controller.dart';
import '../../../../data/model/user.dart';
import '../../../theme/app_colors.dart';


class SignInWidget extends StatelessWidget {
  const SignInWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    AuthController authController = Get.find();
    User user = User();

    return Obx(()=>LoadingOverlay(isLoading: authController.sigin_loading.value, child: ListView(
      children: [
        Column(
          children: [
            Form(
              autovalidateMode: AutovalidateMode.onUserInteraction,
              key: authController.formSignInKey,
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 30.0),
                child: Column(
                  children: [
                    SizedBox(height: 30,),
                    TextFormField(
                      /*controller: _emailController,*/
                        onSaved: (value){
                          user.email = value;
                        },
                        validator: (value){
                          if(value!.isEmpty){
                            return "Bạn chưa nhập email";
                          }if(!RegExp(r"^[a-zA-Z0-9.]+@[a-zA-Z0-9]+\.[a-zA-Z]+").hasMatch(value)){
                            return "Bạn chưa nhập đúng định dạng email, Ex: a@gmail.com";
                          }/*if(){
                        return "Không tồn tại tài khoản";
                        }*/
                        },
                        initialValue: '0357873039',
                        textAlignVertical: TextAlignVertical.center,
                        decoration: InputDecoration(
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(50.0),
                            borderSide: BorderSide(color: AppColors.yellowColor, width: 2.0),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(50.0),
                            borderSide: BorderSide(color: AppColors.textGrayColor, width: 2.0),
                          ),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(50.0),
                          ),

                          hintStyle: const TextStyle(
                              fontSize: 15
                          ),
                          hintText: 'Email/SDT',
                          prefixIcon: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 5.0),
                            child: Icon(Icons.perm_identity, color: AppColors.yellowColor,),
                          ),
                        )
                    ),
                    SizedBox(height: 20,),
                    Obx(()=>TextFormField(
                      textAlignVertical: TextAlignVertical.center,
                      obscureText: authController.isObscurePassword.value,
                      initialValue: 'vgs@123',
  
                      onSaved: (value){
                        user.password = value;
                      },
                      validator: (value){
                        if(value!.isEmpty){
                          return "Bạn chưa nhập mật khẩu";
                        }/*if(){
                              return "Bạn nhập chưa đúng mật khẩu";
                            }*/
                      },
                      decoration: InputDecoration(
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(50.0),
                          borderSide: BorderSide(color: AppColors.yellowColor, width: 2.0),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(50.0),
                          borderSide: BorderSide(color: AppColors.textGrayColor, width: 2.0),
                        ),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(50.0)
                        ),
                        hintStyle: const TextStyle(
                            fontSize: 15
                        ),
                        hintText: 'password'.tr,
                        suffixIcon: GestureDetector(
                          child: authController.isObscurePassword.value ? Icon(Icons.visibility_off_outlined, color: AppColors.textGrayColor,):
                          Icon(Icons.visibility_outlined, color: AppColors.yellowColor,), onTap: (){
                          authController.changeObscurePassword(!authController.isObscurePassword.value);
                        },),
                        prefixIcon: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 5.0),
                          child: Icon(Icons.lock, color: AppColors.yellowColor,),
                        ),
                      )
                      ),
                    ),
                    
                    
                    SizedBox(height: 20,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        GestureDetector(
                          child: Text('forgot_pass'.tr,
                            style: TextStyle(decoration: TextDecoration.underline,
                            color: Colors.blue)),
                          onTap: () {
                            Get.toNamed(Routes.ACCOUNT_ENTER_EMAIL_RESET);
                          },
                        ),
                        Text('help'.tr)
                      ],
                    ),
                    SizedBox(height: 30,),
                    ElevatedButton(
                      onPressed: () async {
                        authController.formSignInKey.currentState?.save();
                        FocusManager.instance.primaryFocus!.unfocus();
                        await authController.loginUser(user);

                      },
                      style: ElevatedButton.styleFrom(
                          primary: AppColors.yellowColor,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(50.0),
                          )
                      ),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(Icons.assignment_ind_outlined),
                          SizedBox(width: 10.0,),
                          Text('login'.tr,
                            style: TextStyle(

                            ),
                          )
                        ],
                      ),
                    ),
                    SizedBox(height: 10,),
                  ],
                ),
              ),
            ),

            Container(
              width: MediaQuery.of(context).size.width,
              color: Color(0xffF1F3FD),
              child: Center(
                child:  Padding(
                  padding: EdgeInsets.symmetric(vertical: 8.0),
                  child: Text('or_login'.tr),
                ),
              ),
            ),
            SizedBox(height: 10,),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 30.0),
              child: Column(
                children: [
                  ElevatedButton(
                    onPressed: () {  },
                    style: ElevatedButton.styleFrom(
                        primary: Color(0xff3D5A96),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(50.0),
                        )
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        SvgPicture.asset("assets/images/account/fb.svg", height: 12,),
                        Expanded(
                            child: Center(
                                child:  Text("${'login_with'.tr} Facebook",
                                  style: TextStyle(
                                  ),
                                )
                            )
                        )
                      ],
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () {  },
                    style: ElevatedButton.styleFrom(
                        primary: Color(0xffDA483F),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(50.0),
                        )
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        SvgPicture.asset("assets/images/account/gg.svg", height: 12,),
                        Expanded(
                            child: Center(
                                child:  Text("${'login_with'.tr} Google",
                                  style: TextStyle(
                                  ),
                                )
                            )
                        )
                      ],
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () {  },
                    style: ElevatedButton.styleFrom(
                        primary: Color(0xff0082CA),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(50.0),
                        )
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        SvgPicture.asset("assets/images/account/zalo.svg", height: 14,),
                        Expanded(
                            child: Center(
                                child:  Text("${'login_with'.tr} Zalo",
                                  style: TextStyle(
                                  ),
                                )
                            )
                        )
                      ],
                    ),
                  ),

                ],
              ),
            )
          ],
        ),
      ],
    )));
  }
}
