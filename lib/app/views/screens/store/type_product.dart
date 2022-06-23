
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../controller/store/create_seller_controller.dart';

class TypeProduct extends StatelessWidget {
  const TypeProduct({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    // final cls=Get.put(chonloaisp());
    final CreateSellerController _typeProductCtl = Get.find();
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
      body: SizedBox(
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