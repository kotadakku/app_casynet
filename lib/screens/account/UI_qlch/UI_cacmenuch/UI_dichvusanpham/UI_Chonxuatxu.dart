import 'dart:convert';

import 'package:app_casynet/model/Xuatxu.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

import 'UI_ThemSPDV.dart';

class chonxuatxu extends StatefulWidget {
  @override
  State<chonxuatxu> createState() => _chonxuatxuState();
}

final xcv = Get.put(xc());

class _chonxuatxuState extends State<chonxuatxu> {
  @override
  void initState() {
    super.initState();
    xcv.fetchXuatxu("https://coaxial-typewriter.000webhostapp.com/Server/Xuatxu.php");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          "Chọn xuất xứ",
          style: TextStyle(color: Colors.black),
        ),
      ),
      body: Visibility(
        visible: xcv.ischeck.value,
        replacement: const Center(
          child: CircularProgressIndicator(),
        ),
        child: SingleChildScrollView(
          child: Obx(() => Column(
                children: [
                  ListView.builder(
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      itemCount: xcv.xuatxu.length,
                      itemBuilder: (context, indext) {
                        return RadioListTile(
                            title:
                                Text(xcv.xuatxu[indext].tenxuatxu.toString()),
                            value: indext,
                            groupValue: xcv.countqg.value,
                            onChanged: (value) {
                              xcv.idxs.value=int.parse(xcv.xuatxu[indext].idxuaxu.toString());
                              xcv.tenxuatxu.value=xcv.xuatxu[indext].tenxuatxu.toString();
                              xcv.countqg.value = int.parse(value.toString());
                              Get.back();
                            });
                      }),

                ],
              )),
        ),
      ),
    );
  }
}
