import 'package:app_casynet/theme/app_colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class NotificationCustomer extends StatelessWidget {
  const NotificationCustomer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 5.0,
        backgroundColor: Colors.white,
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          color: Colors.black,
          onPressed: (){
            Get.back();
          },
        ),
        title: Text("Thông báo tới khách hàng",
          style: TextStyle(
              color: Colors.black
          ),
        ),
        actions: [
          IconButton(
            icon: Icon(CupertinoIcons.add_circled),
            color: Colors.black,
            onPressed: (){

            },
          )

        ],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            color: kBackgroundColor,
            height: 50,
            padding: EdgeInsets.symmetric(horizontal: 10.0.w, vertical: 10.0.h),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    readOnly: true,
                    decoration: InputDecoration(
                      fillColor: Colors.white,
                      filled: true,
                      contentPadding: EdgeInsets.all(5.0),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5.0),
                        borderSide: BorderSide(
                          color: kYellowColor,
                        )
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5.0),
                        borderSide: BorderSide(
                          color: kTextColor,
                        )
                      ),
                      suffixIcon: Icon(Icons.keyboard_arrow_down)
                    ),
                  )
                ),
                Expanded(
                    child: TextField(
                      readOnly: true,
                      decoration: InputDecoration(
                          fillColor: Colors.white,
                          filled: true,
                          contentPadding: EdgeInsets.all(5.0),
                          focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(5.0),
                              borderSide: BorderSide(
                                color: kYellowColor,
                              )
                          ),
                          enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(5.0),
                              borderSide: BorderSide(
                                color: kTextColor,
                              )
                          ),
                          suffixIcon: Icon(Icons.keyboard_arrow_down)
                      ),
                    )
                ),
                Icon(Icons.filter_alt),
              ],
            ),
          )
        ],
      ),
    );
  }
}
