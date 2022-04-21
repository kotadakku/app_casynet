import 'package:app_casynet/controller/authentication_manager.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../data/model/user.dart';
import '../../theme/app_colors.dart';

class RegisterWidget extends StatelessWidget {
  const RegisterWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var _isMale = true.obs;
    var _isCheckboxAccept = true.obs;
    AuthenticationManager controller = Get.find();
    User user = User();
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.0),
      child: Form(
        key: controller.formRegisterKey,
        autovalidateMode: AutovalidateMode.onUserInteraction,
        child: Column(
            children: [
              SizedBox(height: 20,),
              //TextField Họ và tên
              Container(
                height: 40,
                child: TextFormField(
                    textAlignVertical: TextAlignVertical.center,

                    cursorColor: kYellowColor,
                    onSaved: (value){
                      user.username = value;
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

                        hintStyle: const TextStyle(
                            fontSize: 12
                        ),
                        hintText: 'Họ và tên',
                        prefixIcon: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 5.0),
                          child: Icon(Icons.perm_identity, color: kTextColor,),
                        ),
                        suffixIcon: SizedBox(
                          height: 15,
                          width: 15,
                          child: Center( child: Text("*",
                              style: TextStyle(
                                  color: Colors.red
                              )
                          )
                          ),

                        )

                    )
                ),
              ),
              SizedBox(height: 10,),
              //TextField Email
              Container(
                height: 40,
                child: TextFormField(
                    textAlignVertical: TextAlignVertical.center,
                    onSaved: (value){
                      user.email = value;
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

                        hintStyle: const TextStyle(
                            fontSize: 12
                        ),
                        hintText: 'Email',
                        prefixIcon: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 5.0),
                          child: Icon(Icons.email_outlined, color: kTextColor,),
                        ),
                        suffixIcon: SizedBox(
                          height: 15,
                          width: 15,
                          child: Center( child: Text("*",
                              style: TextStyle(
                                  color: Colors.red
                              )
                          )
                          ),

                        )

                    )
                ),
              ),
              SizedBox(height: 10,),
              //TextField Số điện thoại
              Container(
                height: 40,
                child: TextField(
                    textAlignVertical: TextAlignVertical.center,
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

                        hintStyle: const TextStyle(
                            fontSize: 12
                        ),
                        hintText: 'Số điện thoại',
                        prefixIcon: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 5.0),
                          child: Icon(Icons.phone, color: kTextColor,),
                        ),
                        suffixIcon: SizedBox(
                          height: 15,
                          width: 15,
                          child: Center( child: Text("*",
                              style: TextStyle(
                                  color: Colors.red
                              )
                          )
                          ),

                        )

                    )
                ),
              ),
              SizedBox(height: 10,),
              // TextField mật khẩu
              Container(
                height: 40,
                child: TextFormField(
                    textAlignVertical: TextAlignVertical.center,
                    onSaved: (value){
                      user.password = value;
                    },
                    obscureText: true,
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

                        hintStyle: const TextStyle(
                            fontSize: 12
                        ),

                        hintText: 'Mật khẩu',
                        prefixIcon: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 5.0),
                          child: Icon(Icons.lock, color: kTextColor,),
                        ),
                        suffixIcon: SizedBox(
                          height: 15,
                          width: 15,
                          child: Center( child: Text("*",
                              style: TextStyle(
                                  color: Colors.red
                              )
                          )
                          ),

                        )

                    )
                ),
              ),
              SizedBox(height: 10,),
              //TextField xác nhận mật khẩu
              Container(
                height: 40,
                child: TextFormField(
                    textAlignVertical: TextAlignVertical.center,
                    obscureText: true,
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

                        hintStyle: const TextStyle(
                            fontSize: 12
                        ),
                        hintText: 'Xác nhận mật khẩu',
                        prefixIcon: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 5.0),
                          child: Icon(Icons.lock, color: kTextColor,),
                        ),
                        suffixIcon: SizedBox(
                          height: 15,
                          width: 15,
                          child: Center( child: Text("*",
                              style: TextStyle(
                                  color: Colors.red
                              )
                          )
                          ),

                        )

                    )
                ),
              ),
              SizedBox(height: 10,),
              // TextField Ngày sinh
              Container(
                height: 40,
                child: TextFormField(
                    textAlignVertical: TextAlignVertical.center,
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

                      hintStyle: const TextStyle(
                          fontSize: 12
                      ),
                      hintText: 'Ngày sinh',
                      prefixIcon: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 5.0),
                        child: Icon(Icons.calendar_today_rounded, color: kTextColor,),
                      ),

                    )
                ),
              ),
              SizedBox(height: 5,),
              // CHọn giới tính
              Row(
                children: [
                  Text("Giới tính"),
                  Obx(()=>Radio(
                      value: true,
                      groupValue: _isMale.value,
                      onChanged: (value){
                        _isMale.value = !_isMale.value;
                      },
                      activeColor: Color(0xffDFB400))
                  ),
                  Text("Nam"),
                  SizedBox(width: 20,),
                  Obx(()=>Radio(
                      value: false,
                      groupValue: _isMale.value,
                      onChanged: (value){
                        _isMale.value = !_isMale.value;
                      },
                      activeColor: Color(0xffDFB400)
                  )),
                  Text("Nữ")
                ],
              ),
              // Checkbox xác nhận nhận thông tin
              Row(
                children: [
                  Obx(()=>Checkbox(
                      activeColor: kYellowColor,
                      value: _isCheckboxAccept.value,
                      onChanged: (value){
                        _isCheckboxAccept.value = !_isCheckboxAccept.value;
                      }
                  ),),
                  SizedBox(width: 5.0),
                  SizedBox(width: 250, child:
                  Text("Nhận thông tin và chương trình khuyến mãi của Casynet qua email",
                    overflow: TextOverflow.visible,
                    maxLines: 2,
                  )
                  )
                ],
              ),
              SizedBox(height: 0,),
              // Button tạo tài khoản
              ElevatedButton(
                onPressed: () {
                  controller.formRegisterKey.currentState?.save();
                  controller.registerUser(user);
                },
                style: ElevatedButton.styleFrom(
                    primary: kYellowColor,
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
                    Text("Tạo tài khoản",
                      style: TextStyle(

                      ),
                    )
                  ],
                ),
              ),
              SizedBox(height: 10,),
              RichText(
                text: TextSpan(
                  children: [
                    TextSpan(
                      text: 'Khi bạn nhấn đăng ký, bạn đã đồng ý thực hiện mọi giao dịch mua bán theo ',
                      style: new TextStyle(color: Colors.black),
                    ),
                    TextSpan(
                      text: 'điều kiện sử dụng và chính  sách ',
                      style: new TextStyle(color: Colors.blue),
                      recognizer: new TapGestureRecognizer()
                        ..onTap = () {
                        },
                    ),
                    TextSpan(
                      text: 'của Casynet',
                      style: new TextStyle(color: Colors.black),
                    ),
                  ],
                ),
              ),
            ]
        ),
      ),
    );
  }
}


