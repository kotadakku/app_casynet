import 'package:app_casynet/containts/size.dart';
import 'package:app_casynet/widget/account/top_account_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import '../../containts/colors.dart';
import '../../widget/account/profile_account_widget.dart';
import '../../widget/bottom_navigator.dart';
import 'change_password.dart';

class InformationAccount extends StatelessWidget {
  const InformationAccount({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      bottomNavigationBar: BottomNavigator(),
      body: SafeArea(
        child: Column(
          children: [
            TopAccountWidget(),
            Container(
              padding: EdgeInsets.symmetric(vertical: 20),
              child: Center(
                  child: Stack(
                      children: [
                        ShadowOfDoubt(diameter: 100, origin: Offset(0,110),),
                        Container(
                          width: 100,
                          height: 100,
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              image: ExactAssetImage("assets/account/image_user.png"),
                            ),
                            border: Border.all(color: kYellowColor, width: 2),
                            color: Colors.white,
                            shape: BoxShape.circle,
                          ),
                          child: Align(
                            child: Container(
                              width: 30,
                              height: 30,
                              child: FloatingActionButton(
                                onPressed: () {},
                                child: Icon(
                                  Icons.camera_alt_outlined,
                                  size: 20,
                                ),
                                backgroundColor: kYellowColor,
                              ),
                            ),
                            alignment: Alignment.bottomRight,
                          ),
                        ),
                      ],

                  )),
            ),
            Divider(
              indent: 10,
            ),
            Column(
              children: [
                // Họ tên
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Họ tên",
                        style: TextStyle(color: kTextColor_gray),
                      ),
                      Row(
                        children: [
                          Text("Jade Rubi"),
                          Padding(
                            padding: EdgeInsets.all(10),
                            child: Icon(
                              Icons.arrow_forward_ios,
                              size: 10,
                              color: kTextColor,
                            ),
                          )
                        ],
                      )
                    ],
                  ),
                ),
                Divider(
                  indent: 10,
                ),
                // Email
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("Email"),
                      Row(
                        children: [
                          Text("ngoc***d@gmail.com"),
                          SizedBox(
                            width: 5,
                          ),
                          Text(
                            "Thay đổi",
                            style: TextStyle(color: kTextLink),
                          ),
                          SizedBox(
                            width: 5,
                          ),
                          Padding(
                            padding: EdgeInsets.all(10),
                            child: Icon(
                              Icons.arrow_forward_ios,
                              size: 10,
                              color: kTextColor,
                            ),
                          )
                        ],
                      )
                    ],
                  ),
                ),
                Divider(
                  indent: 10,
                ),
                // Số điện thoại
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("Số điện thoại"),
                      Row(
                        children: [
                          Text(
                            "Thêm",
                            style: TextStyle(color: kTextLink),
                          ),
                          Padding(
                            padding: EdgeInsets.all(10),
                            child: Icon(
                              Icons.arrow_forward_ios,
                              size: 10,
                              color: kTextColor,
                            ),
                          )
                        ],
                      )
                    ],
                  ),
                ),
                Divider(
                  indent: 10,
                ),
                // Tên của hàng
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("Tên cửa hàng"),
                      Row(
                        children: [
                          Text(
                            "Thêm tên cửa hàng",
                            style: TextStyle(color: kTextColor),
                          ),
                          Padding(
                            padding: EdgeInsets.all(10),
                            child: Icon(
                              Icons.arrow_forward_ios,
                              size: 10,
                              color: kTextColor,
                            ),
                          )
                        ],
                      )
                    ],
                  ),
                ),
                Divider(
                  indent: 10,
                ),
                // Giới tính
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("Giới tính"),
                      Row(
                        children: [
                          Text("Nữ"),
                          Padding(
                            padding: EdgeInsets.all(10),
                            child: Icon(
                              Icons.arrow_forward_ios,
                              size: 10,
                              color: kTextColor,
                            ),
                          )
                        ],
                      )
                    ],
                  ),
                ),
                Divider(
                  indent: 10,
                ),
                // Ngày sinh
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("Ngày sinh"),
                      GestureDetector(
                        child: Row(
                          children: [
                            Text(
                              "Thiết lập ngay",
                              style: TextStyle(color: kTextColor),
                            ),
                            Padding(
                              padding: EdgeInsets.all(10),
                              child: Icon(
                                Icons.arrow_forward_ios,
                                size: 10,
                                color: kTextColor,
                              ),
                            )
                          ],
                        ),
                        onTap: () {
                          DatePicker.showDatePicker(context,
                              showTitleActions: true,
                              minTime: DateTime(1900, 1, 1),
                              maxTime: DateTime.now(), onChanged: (date) {
                            print('change $date');
                          }, onConfirm: (date) {
                            print('confirm $date');
                          },
                              currentTime: DateTime.now(),
                              locale: LocaleType.vi);
                        },
                      )
                    ],
                  ),
                ),
                Divider(
                  indent: 10,
                ),
                // Mật khẩu
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("Mật khẩu"),
                      GestureDetector(
                        child: Row(
                          children: [
                            Text(
                              "Thay đổi mật khẩu",
                              style: TextStyle(color: kTextLink),
                            ),
                            Padding(
                              padding: EdgeInsets.all(10),
                              child: Icon(
                                Icons.arrow_forward_ios,
                                size: 10,
                                color: kTextColor,
                              ),
                            )
                          ],
                        ),
                        onTap: () {
                          Get.to(ChangePasswordAccount());
                        },
                      )
                    ],
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
