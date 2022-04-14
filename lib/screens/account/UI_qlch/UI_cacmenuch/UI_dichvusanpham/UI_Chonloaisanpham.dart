import 'package:app_casynet/screens/account/UI_qlch/UI_cacmenuch/UI_dichvusanpham/UI_ThemSPDV.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
class chonloaisanpham extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    final cls=Get.put(chonloaisp());
    List<dynamic> list=["Ô tô","Xe máy"];
    var chon="".obs;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        centerTitle: true,
        title: Text(
          "Chọn loại sản phẩm",
          style: TextStyle(color: Colors.black),
        ),
      ),
      body: Container(
        child: ListView.builder(
          itemCount: list.length,
          itemBuilder: (context, index) {
            return Container(
              child:ListTile(
                title:  Text(list[index]),
                onTap: () {
                  cls.lsp.value=list[index];
                  Get.back();
                },
              ),
            );

          },
        ),
      ),
    );
  }
}
