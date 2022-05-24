import 'package:app_casynet/app/controller/auth/auth_controller.dart';
import 'package:app_casynet/app/views/widgets/loading_overlay.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '../../../../controller/auth/authentication_manager.dart';
import '../../../../data/model/user.dart';

import '../../../theme/app_colors.dart';

class RegisterWidget extends StatelessWidget {
  const RegisterWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    var _isMale = true.obs;
    var _isCheckboxAccept = true.obs;
    AuthController authController = Get.find();
    User user = User();
    return  Obx(()=>LoadingOverlay(
        isLoading: authController.register_loading.value,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.0),
          child: Form(
            key: authController.formRegisterKey,
            child: ListView(
              children: [
                Column(children: [
                  SizedBox(
                    height: 20,
                  ),
                  //TextField Họ và tên
                  TextFormField(
                      textAlignVertical: TextAlignVertical.center,
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      cursorColor: kYellowColor,
                      onSaved: (value) {
                        if(value != null){
                          List<String> val = value.split(" ",);
                          user.firstname = val[0];
                          val.removeAt(0);
                          user.lastname = val.join(" ");
                        };

                      },
                      validator: (value) {
                        if (value == null) {
                          return "Bạn cần nhập họ và tên, không được để trống 1";
                        }
                        if (value.isEmpty) {
                          return "bạn cần nhập họ và tên, không được để trống";
                        }
                      },
                      decoration: InputDecoration(
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(50.0),
                          borderSide: BorderSide(color: kYellowColor, width: 2.0),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(50.0),
                          borderSide: BorderSide(color: kTextColor, width: 2.0),
                        ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(50.0),
                        ),
                        hintStyle: const TextStyle(fontSize: 12),
                        hintText: 'Họ và tên',
                        prefixIcon: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 5.0),
                          child: Icon(
                            Icons.perm_identity,
                            color: kTextColor,
                          ),
                        ),
                        suffixIcon: SizedBox(
                          height: 15,
                          width: 15,
                          child: Center(
                              child:
                              Text("*", style: TextStyle(color: Colors.red))),
                        ),
                      )),

                  SizedBox(
                    height: 10,
                  ),
                  //TextField Email
                  TextFormField(
                      textAlignVertical: TextAlignVertical.center,
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      onSaved: (value) {
                        user.email = value;
                      },
                      validator: (value) {
                        if (value!.isEmpty ||
                            !RegExp(r"^[a-zA-Z0-9.]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                                .hasMatch(value)) {
                          return "Bạn chưa nhập đúng định dạng, Ex: a@gmail.com";
                        }
                      },
                      cursorColor: kYellowColor,
                      decoration: InputDecoration(
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(50.0),
                            borderSide: BorderSide(color: kYellowColor, width: 2.0),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(50.0),
                            borderSide: BorderSide(color: kTextColor, width: 2.0),
                          ),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(50.0),
                          ),
                          hintStyle: const TextStyle(fontSize: 12),
                          hintText: 'Email',
                          prefixIcon: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 5.0),
                            child: Icon(
                              Icons.email_outlined,
                              color: kTextColor,
                            ),
                          ),
                          suffixIcon: SizedBox(
                            height: 15,
                            width: 15,
                            child: Center(
                                child:
                                Text("*", style: TextStyle(color: Colors.red))),
                          ))),
                  SizedBox(
                    height: 10,
                  ),
                  //TextField Số điện thoại
                  TextFormField(
                      textAlignVertical: TextAlignVertical.center,
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      onSaved: (value) {
                        user.phone = value;
                      },
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "Bạn cần nhập số điện thoại";
                        }
                        if (!RegExp(r"^0[0-9]{9}$").hasMatch(value)) {
                          return "Không có khoảng trắng, cần 10 số";
                        }
                      },
                      cursorColor: kYellowColor,
                      decoration: InputDecoration(
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(50.0),
                            borderSide: BorderSide(color: kYellowColor, width: 2.0),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(50.0),
                            borderSide: BorderSide(color: kTextColor, width: 2.0),
                          ),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(50.0),
                          ),
                          hintStyle: const TextStyle(fontSize: 12),
                          hintText: 'Số điện thoại',
                          prefixIcon: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 5.0),
                            child: Icon(
                              Icons.phone,
                              color: kTextColor,
                            ),
                          ),
                          suffixIcon: SizedBox(
                            height: 15,
                            width: 15,
                            child: Center(
                                child:
                                Text("*", style: TextStyle(color: Colors.red))),
                          ))),
                  SizedBox(
                    height: 10,
                  ),
                  // TextField mật khẩu
                  Obx(()=>TextFormField(
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      controller: authController.passwordController,
                      textAlignVertical: TextAlignVertical.center,
                      onSaved: (value) {
                        user.password = value;
                      },
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "Bạn cần nhập mật khẩu";
                        }if(!RegExp(r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9]).{8,}').hasMatch(value)){
                          return "Mật khẩu ít nhất 8 ký tự, trong đó có ít nhất một chữ hoa, số, ký tự đặc biệt, Ex: ngocson_jp@yahoo.co.jp";
                        }
                        //(?=.*?[!@#\><*~])
                      },
                      obscureText: authController.isRegisterObscurePassword.value,
                      cursorColor: kYellowColor,
                      decoration: InputDecoration(
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(50.0),
                            borderSide: BorderSide(color: kYellowColor, width: 2.0),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(50.0),
                            borderSide: BorderSide(color: kTextColor, width: 2.0),
                          ),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(50.0),
                          ),
                          hintStyle: const TextStyle(fontSize: 12),
                          hintText: 'Mật khẩu',
                          prefixIcon: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 5.0),
                            child: Icon(
                              Icons.lock,
                              color: kTextColor,
                            ),
                          ),
                          suffixIcon: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              GestureDetector(
                                child: authController.isRegisterObscurePassword.value ? Icon(Icons.visibility_off_outlined, color: kTextColor,):
                                Icon(Icons.visibility_outlined, color: kYellowColor,), onTap: (){
                                authController.changeRegisterObscurePassword(!authController.isRegisterObscurePassword.value);
                              },),
                              SizedBox(
                                height: 15,
                                width: 15,
                                child: Center(
                                    child:
                                    Text("*", style: TextStyle(color: Colors.red))),
                              )
                            ],
                          )
                      )
                  ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  //TextField xác nhận mật khẩu
                  TextFormField(
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      textAlignVertical: TextAlignVertical.center,
                      obscureText: true,
                      cursorColor: kYellowColor,
                      onSaved: (value) {},
                      validator: (value) {
                        /*if (value.length < ) {
                      return "Bạn cần nhập nhiều hơn 8 ký tự";
                    }*/if(value != authController.passwordController.text){
                          return "Mật khẩu không trùng khớp";
                        }
                      },
                      decoration: InputDecoration(
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(50.0),
                            borderSide: BorderSide(color: kYellowColor, width: 2.0),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(50.0),
                            borderSide: BorderSide(color: kTextColor, width: 2.0),
                          ),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(50.0),
                          ),
                          hintStyle: const TextStyle(fontSize: 12),
                          hintText: 'Xác nhận mật khẩu',
                          prefixIcon: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 5.0),
                            child: Icon(
                              Icons.lock,
                              color: kTextColor,
                            ),
                          ),
                          suffixIcon: SizedBox(
                            height: 15,
                            width: 15,
                            child: Center(
                                child:
                                Text("*", style: TextStyle(color: Colors.red))),
                          ))),
                  SizedBox(
                    height: 10,
                  ),
                  // TextField Ngày sinh
                  TextFormField(
                      textAlignVertical: TextAlignVertical.center,
                      cursorColor: kYellowColor,
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      controller: authController.birthDayTextController,
                      onSaved: (value) {
                        user.birthday = value;
                      },
                      validator: (value){
                        
                      },
                      readOnly: true,
                      onTap: (){
                        showDatePicker(
                          context: context,
                          initialDate: DateTime.now().subtract(Duration(days:1)),
                          firstDate: DateTime(1900),
                          lastDate: DateTime.now().subtract(Duration(days:1)),
                        ).then((value){
                          authController.birthDayTextController.text = DateFormat("yyyy/MM/dd").format(value!);

                        });
                      },
                      decoration: InputDecoration(
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(50.0),
                          borderSide: BorderSide(color: kYellowColor, width: 2.0),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(50.0),
                          borderSide: BorderSide(color: kTextColor, width: 2.0),
                        ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(50.0),
                        ),
                        hintStyle: const TextStyle(fontSize: 12),
                        hintText: 'Ngày sinh',
                        prefixIcon: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 5.0),
                          child: IconButton(
                              color: kTextColor,
                              onPressed: () {
                              },
                              icon: Icon(
                                Icons.calendar_today_rounded,
                              )),
                        ),
                      )),
                  SizedBox(
                    height: 5,
                  ),
                  // CHọn giới tính
                  Row(
                    children: [
                      Text("Giới tính"),
                      Obx(() => Radio(
                          value: true,
                          groupValue: _isMale.value,
                          onChanged: (value) {
                            _isMale.value = !_isMale.value;
                          },
                          activeColor: Color(0xffDFB400))),
                      Text("Nam"),
                      SizedBox(
                        width: 20,
                      ),
                      Obx(() => Radio(
                          value: false,
                          groupValue: _isMale.value,
                          onChanged: (value) {
                            _isMale.value = !_isMale.value;
                          },
                          activeColor: Color(0xffDFB400))),
                      Text("Nữ")
                    ],
                  ),
                  // Checkbox xác nhận nhận thông tin
                  Row(
                    children: [
                      Obx(
                            () => Checkbox(
                            activeColor: kYellowColor,
                            value: _isCheckboxAccept.value,
                            onChanged: (value) {
                              _isCheckboxAccept.value = !_isCheckboxAccept.value;
                            }),
                      ),
                      SizedBox(width: 5.0),
                      SizedBox(
                          width: 250,
                          child: Text(
                            "Nhận thông tin và chương trình khuyến mãi của Casynet qua email",
                            overflow: TextOverflow.visible,
                            maxLines: 2,
                          ))
                    ],
                  ),
                  SizedBox(
                    height: 0,
                  ),
                  // Button tạo tài khoản
                  ElevatedButton(
                    onPressed: () async {
                      user.gender = _isMale.value? 1:0;
                      user.receiveNotification = _isCheckboxAccept.value;

                      authController.formRegisterKey.currentState?.save();
                      FocusManager.instance.primaryFocus!.unfocus();
                      if(authController.formRegisterKey.currentState!.validate()){
                        await authController.registerUser(user);
                      }
                      else {
                        Get.defaultDialog(
                            middleText: 'Vui lòng nhập đầy đủ thông tin',
                            title:  'Thông báo',
                            textConfirm: 'OK',
                            confirmTextColor: Colors.white,
                            onConfirm: () {
                              Get.back();
                            }
                        );
                      }


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
                          "Tạo tài khoản",
                          style: TextStyle(),
                        )
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  RichText(
                    text: TextSpan(
                      children: [
                        TextSpan(
                          text:
                          'Khi bạn nhấn đăng ký, bạn đã đồng ý thực hiện mọi giao dịch mua bán theo ',
                          style: new TextStyle(color: Colors.black),
                        ),
                        TextSpan(
                          text: 'điều kiện sử dụng và chính  sách ',
                          style: new TextStyle(color: Colors.blue),
                          recognizer: new TapGestureRecognizer()..onTap = () {},
                        ),
                        TextSpan(
                          text: 'của Casynet',
                          style: new TextStyle(color: Colors.black),
                        ),
                      ],
                    ),
                  ),
                ]),
              ],
            ),
          ),
        )
      )
    );
  }
}
