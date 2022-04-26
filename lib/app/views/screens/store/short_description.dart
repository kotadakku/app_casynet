
import 'package:flutter/widgets.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'new_created_store.dart';

class ShortDescription extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title:  Text( "Mô tả ngắn",),
        actions: [
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: OutlinedButton(
                style: ButtonStyle(
                  shape: MaterialStateProperty.all(RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0))),
                ),
                onPressed: () {},
                child: const Text(
                  "Lưu",
                  style: TextStyle(color: Colors.black),
                )),
          )
        ],
      ),
      body: SafeArea(
          child: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Column(
              children: [
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
    );
  }
}