
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../../controller/store/create_seller_controller.dart';

class TypeProduct extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    // final cls=Get.put(chonloaisp());
    final CreateSellerController _typeProductCtl = Get.find();
    List<dynamic> list=["Ô tô","Xe máy"];
    var chon="".obs;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        centerTitle: true,
        title: const Text(
          "Chọn loại sản phẩm",
          style: TextStyle(color: Colors.black),
        ),
      ),
      body: Container(
        child: ListView.builder(
          itemCount: list.length,
          itemBuilder: (context, index) {
            return ListTile(
              title:  Text(list[index]),
              onTap: () {
                _typeProductCtl.typeProSelected.value=list[index];
                Get.back();
              },
            );

          },
        ),
      ),
    );
  }
}