
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'UI_ThemSPDV.dart';
class chonloaisanpham extends StatelessWidget {
  const chonloaisanpham({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    final cls=Get.put(chonloaisp());
    List<dynamic> list=["Ô tô","Xe máy"];
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        centerTitle: true,
        title: const Text(
          "Chọn loại sản phẩm",
          style: TextStyle(color: Colors.black),
        ),
      ),
      body: ListView.builder(
        itemCount: list.length,
        itemBuilder: (context, index) {
          return ListTile(
            title:  Text(list[index]),
            onTap: () {
              cls.lsp.value=list[index].toString();
              Get.back();
            },
          );

        },
      ),
    );
  }
}
