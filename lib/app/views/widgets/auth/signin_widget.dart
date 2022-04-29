import 'package:app_casynet/app/views/screens/account/account_base.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import '../../../controller/auth/authentication_manager.dart';
import '../../../data/model/user.dart';
import '../../screens/theme/app_colors.dart';

class SignInWidget extends StatelessWidget {
  const SignInWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    AuthenticationManager controller = Get.find();
    User user = User();

    var _emailController = TextEditingController();

    return ListView(
      children: [
        Column(
          children: [
            Form(
              key: controller.formSignInKey,
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 30.0),
                child: Column(
                  children: [
                    SizedBox(
                      height: 30,
                    ),
                    TextFormField(
                        textAlignVertical: TextAlignVertical.center,
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        onSaved: (value) {
                          user.email = value;
                        },
                        validator: (value) {
                          if (value!.isEmpty) {
                            return "Bạn chưa nhập email";
                          }
                          if (!RegExp(r"^[a-zA-Z0-9.]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                              .hasMatch(value)) {
                            return "Bạn chưa nhập đúng định dạng email, Ex: a@gmail.com";
                          } /*if(){
                        return "Không tồn tại tài khoản";
                        }*/
                        },
                        decoration: InputDecoration(
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(50.0),
                            borderSide:
                                BorderSide(color: kYellowColor, width: 2.0),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(50.0),
                            borderSide:
                                BorderSide(color: kTextColor, width: 2.0),
                          ),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(50.0),
                          ),
                          hintStyle: const TextStyle(fontSize: 15),
                          hintText: 'Họ và tên',
                          prefixIcon: Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 5.0),
                            child: Icon(
                              Icons.perm_identity,
                              color: kYellowColor,
                            ),
                          ),
                        )),
                    SizedBox(
                      height: 20,
                    ),
                    TextFormField(
                        textAlignVertical: TextAlignVertical.center,
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        obscureText: true,
                        onSaved: (value) {
                          user.password = value;
                        },
                        validator: (value) {
                          if (value!.isEmpty) {
                            return "Bạn chưa nhập mật khẩu";
                          } /*if(){
                            return "Bạn nhập chưa đúng mật khẩu";
                          }*/
                        },
                        decoration: InputDecoration(
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(50.0),
                            borderSide:
                                BorderSide(color: kYellowColor, width: 2.0),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(50.0),
                            borderSide:
                                BorderSide(color: kTextColor, width: 2.0),
                          ),
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(50.0)),
                          hintStyle: const TextStyle(fontSize: 15),
                          hintText: 'Mật khẩu',
                          prefixIcon: Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 5.0),
                            child: Icon(
                              Icons.lock,
                              color: kYellowColor,
                            ),
                          ),
                        )),
                    SizedBox(
                      height: 20,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [Text("Quên mật khẩu"), Text("Cần trợ giúp?")],
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    // button đăng nhập
                    ElevatedButton(
                      onPressed: () {
                        controller.formSignInKey.currentState?.save();
                        if (controller.formSignInKey.currentState?.validate() ==
                            false) {
                          controller.loginUser(user);
                          print(user.toJsonLogin());
                          Get.snackbar(
                            "Bạn chưa nhập email hoặc password", "",
                            duration: 10.seconds,
                            // it could be any reasonable time, but I set it lo-o-ong
                            snackPosition: SnackPosition.BOTTOM,
                            /*showProgressIndicator: true,*/
                            isDismissible: true,
                            backgroundColor: Colors.black26.withOpacity(0.1),
                            colorText: Colors.white,
                            /*mainButton:
                              TextButton(onPressed: Get.back, child: const Text("Close"))*/
                          );
                          Get.back();
                        }
                        if (controller.formSignInKey.currentState?.validate() !=
                            false) {
                          controller.loginUser(user);
                          print(user.toJsonLogin());
                          Get.snackbar("Bạn đăng nhập thành công", "",
                              duration: 10.seconds,
                              // it could be any reasonable time, but I set it lo-o-ong
                              snackPosition: SnackPosition.BOTTOM,
                              /*showProgressIndicator: true,*/
                              isDismissible: true,
                              backgroundColor: Colors.black26.withOpacity(0.1),
                              colorText: Colors.white,
                              mainButton: TextButton(
                                  onPressed: Get.back,
                                  child: const Text("Close")));
                        }
                        print(user.email);
                        print(user.password);

                        /*Get.back();*/
                      },
                      style: ElevatedButton.styleFrom(
                          primary: kYellowColor,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(50.0),
                          )),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(Icons.assignment_ind_outlined),
                          SizedBox(
                            width: 10.0,
                          ),
                          Text(
                            "Đăng nhập",
                            style: TextStyle(),
                          )
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                  ],
                ),
              ),
            ),
            Container(
              width: MediaQuery.of(context).size.width,
              color: Color(0xffF1F3FD),
              child: Center(
                child: Padding(
                  padding: EdgeInsets.symmetric(vertical: 8.0),
                  child: Text("Hoặc đăng nhập bằng"),
                ),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 30.0),
              child: Column(
                children: [
                  ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                        primary: Color(0xff3D5A96),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(50.0),
                        )),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        SvgPicture.asset(
                          "assets/account/fb.svg",
                          height: 12,
                        ),
                        Expanded(
                            child: Center(
                                child: Text(
                          "Đăng nhập bằng Facebook",
                          style: TextStyle(),
                        )))
                      ],
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                        primary: Color(0xffDA483F),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(50.0),
                        )),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        SvgPicture.asset(
                          "assets/account/gg.svg",
                          height: 12,
                        ),
                        Expanded(
                            child: Center(
                                child: Text(
                          "Đăng nhập bằng Google",
                          style: TextStyle(),
                        )))
                      ],
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                        primary: Color(0xff0082CA),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(50.0),
                        )),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        SvgPicture.asset(
                          "assets/account/zalo.svg",
                          height: 14,
                        ),
                        Expanded(
                            child: Center(
                                child: Text(
                          "Đăng nhập bằng Zalo",
                          style: TextStyle(),
                        )))
                      ],
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ],
    );
  }
}
