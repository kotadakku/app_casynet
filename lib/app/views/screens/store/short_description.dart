
import 'package:flutter/widgets.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'new_created_store.dart';

class ShortDescription extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      home: Scaffold(
        body: SafeArea(
            child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            children: [
              Container(
                margin: EdgeInsets.only(left: 5.0, right: 5.0),
                height: 50.0,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: InkWell(
                        onTap: () {
                          Get.off(NewCreatedStore());
                        },
                        // splashColor: Colors.black26,
                        splashColor: Color.fromARGB(255, 188, 195, 216),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Icon(Icons.arrow_back),
                          ],
                        ),
                      ),
                    ),
                    Expanded(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "Mô tả ngắn",
                            style: TextStyle(
                              fontSize: 15,
                            ),
                          )
                        ],
                      ),
                    ),
                    Expanded(
                        child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        OutlinedButton(
                          style: OutlinedButton.styleFrom(
                            side: BorderSide(
                                width: 1.0,
                                color: Color.fromARGB(255, 182, 180, 180)),
                            backgroundColor: Color.fromARGB(255, 255, 255, 255),
                            primary: Color.fromARGB(255, 234, 228, 201),
                            textStyle: const TextStyle(fontSize: 18),
                          ),
                          onPressed: () {},
                          child: const Text(
                            'Lưu',
                            style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ),

                      ],
                    ))
                  ],
                ),
              ),
              Divider(height: 5,),
              Container(
                margin: EdgeInsets.only(left: 5.0, top: 1.0,right: 5.0,bottom: 5.0),
                child: TextField(
                  maxLength: 200,
                  maxLines: 6,
                  keyboardType: TextInputType.text,
                  textAlign: TextAlign.left,
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    // suffixIcon: Icon(Icons.navigate_next),

                    hintText: 'Nhập mô tả ngắn cửa hang , Tối đa 200 ký tự',
                  ),
                ),
              )
            ],
          ),
        )),
      ),
    );
  }
}
