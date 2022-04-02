
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../theme/app_colors.dart';
import '../../../widget/account/top_account_widget.dart';

class NewAddress extends StatelessWidget {
  const NewAddress({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var switch_default = true.obs;
    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
          child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TopAccountWidget(),
                SizedBox(height: 30,),
                Text("Thêm địa chỉ mới",
                  style: TextStyle(
                      fontSize: 18.0,
                      fontWeight: FontWeight.bold
                  ),
                ),
                Divider(
                  indent: 10,
                ),
                Padding(padding: EdgeInsets.only(left: 10, right: 10 ), child: Row(
                  children: [
                    Expanded(
                        child: Text("Nhập họ và tên",
                          style: TextStyle(
                              color: kTextColor_gray
                          ),
                        )
                    ),
                    Expanded(
                        child: TextField(
                          cursorColor: kTextColor_gray,
                          textAlign: TextAlign.end,
                          decoration: InputDecoration(
                              border: InputBorder.none,
                              hintText: "Nhập họ và tên",
                              hintStyle: TextStyle(
                                  color: kTextColor
                              )
                          ),
                        ))
                  ],
                ),),
                Divider(
                  indent: 10,
                ),
                Padding(padding: EdgeInsets.only(left: 10, right: 10 ), child: Row(
                  children: [
                    Expanded(
                        child: Text("Số điện thoại",
                          style: TextStyle(
                              color: kTextColor_gray
                          ),
                        )
                    ),
                    Expanded(
                        child: TextField(
                          textAlign: TextAlign.end,
                          obscureText: true,
                          cursorColor: kTextColor_gray,
                          decoration: InputDecoration(
                              border: InputBorder.none,
                              hintText: "Nhập số điện thoại",
                              hintStyle: TextStyle(
                                  color: kTextColor
                              )
                          ),
                        ))
                  ],
                ),),
                Divider(
                  indent: 10,
                ),
                Padding(padding: EdgeInsets.only(left: 10, ), child: Row(
                  children: [
                    Expanded(
                        child: Text("Tỉnh/Thành phố",
                          style: TextStyle(
                              color: kTextColor_gray
                          ),
                        )
                    ),
                    Expanded(
                        child: TextFormField(
                          readOnly: true,
                          initialValue: "Hà Nội",
                          textAlign: TextAlign.end,
                          decoration: InputDecoration(
                              border: InputBorder.none,
                              hintText: "Hà Nội",
                              hintStyle: TextStyle(
                                  color: kTextColor
                              ),
                              suffixIcon: Container(height: 10, width: 10, child: Icon(Icons.arrow_forward_ios, size: 12,),)
                          ),
                        )
                    )
                  ],
                ),),
                Divider(
                  indent: 10,
                ),
                Padding(padding: EdgeInsets.only(left: 10, ), child: Row(
                  children: [
                    Expanded(
                        child: Text("Quận/Huyện",
                          style: TextStyle(
                              color: kTextColor_gray
                          ),
                        )
                    ),
                    Expanded(
                      child: TextFormField(
                        readOnly: true,
                        initialValue: "Quận Nam Từ Liêm",
                        textAlign: TextAlign.end,
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: "Hà Nội",
                          hintStyle: TextStyle(
                              color: kTextColor
                          ),
                          suffixIcon: Container(height: 10, width: 10, child: Icon(Icons.arrow_forward_ios, size: 12,),)
                        ),
                      )
                    )
                  ],
                ),),
                Divider(
                  indent: 10,
                ),
                Padding(padding: EdgeInsets.only(left: 10, right: 10), child: Row(
                  children: [
                    Expanded(
                        child: Text("Phường/Xã",
                          style: TextStyle(
                              color: kTextColor_gray
                          ),
                        )
                    ),
                    Expanded(
                        child: TextField(
                          textAlign: TextAlign.end,
                          obscureText: true,
                          cursorColor: kTextColor_gray,
                          decoration: InputDecoration(
                              border: InputBorder.none,
                              hintText: "Nhập Phường/Xã",
                              hintStyle: TextStyle(
                                  color: kTextColor
                              )
                          ),
                        ))
                  ],
                ),),
                Divider(
                  indent: 10,
                ),
                Padding(padding: EdgeInsets.only(left: 10, right: 10 ), child: Row(
                  children: [
                    Expanded(
                        child: Text("Địa chỉ cụ thể",
                          style: TextStyle(
                              color: kTextColor_gray
                          ),
                        )
                    ),
                    Expanded(
                      child: TextField(
                        cursorColor: kTextColor_gray,
                        textAlign: TextAlign.end,
                        obscureText: true,
                        decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: "Nhập địa chỉ cụ thể",
                            hintStyle: TextStyle(
                                color: kTextColor
                            )
                        ),
                      )
                    )
                  ],
                ),),
                SizedBox(height: 30,),
                Divider(
                  indent: 10,
                ),
                Padding(padding: EdgeInsets.only(left: 10, right: 10 ), child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Đặt làm địa chỉ mặc định",
                      style: TextStyle(
                          color: kTextColor_gray
                      )
                    ),
                    Obx(()=>Switch(value: switch_default.value, onChanged: (value) {
                      switch_default.value = value;
                    }))
                  ],
                ),
                ),
                Container(height: 10, color: kBackgroundColor,),
                SizedBox(height: 10,),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 10),
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {  },
                    child: Text("Lưu địa chỉ"),
                    style: ElevatedButton.styleFrom(
                        primary: kYellowColor
                    ),
                  ),
                )
              ]
          ),
        ),
      )
    );
  }
}
