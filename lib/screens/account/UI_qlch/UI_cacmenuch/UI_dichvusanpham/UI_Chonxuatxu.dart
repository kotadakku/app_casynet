import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'UI_ThemSPDV.dart';
class chonxuatxu extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    final chonqgs=Get.put(chonqg());
    var countqg=0.obs;
    var x="".obs;
    List quocgia=["Việt Nam","Mỹ","Trung Quốc","Anh","Pháp","Indonesia","Nhật Bản","Đài Loan","Ấn Độ","khác"];
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          "Chọn xuất xứ",
          style: TextStyle(color: Colors.black),
        ),
      ),
      body: Container(
        child: SingleChildScrollView(
          child: Obx(()=>
              Column(
                children: [
                  ListView.builder(
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      itemCount: quocgia.length,
                      itemBuilder:(context,indext){
                        return RadioListTile(
                                title: Text(quocgia[indext]),
                                value: indext,
                                groupValue: countqg.value,
                                onChanged: (value){
                                  chonqgs.quocgia.value=quocgia[indext];
                                  countqg.value=int.parse(value.toString());
                                  x.value=x.value+" ";

                                  Get.back();
                                }
                        );
                      }
                  ),
                  Text(x.toString(),maxLines: 1,),
                ],
              )
          ),
        ),
      ),
    );
  }
}
