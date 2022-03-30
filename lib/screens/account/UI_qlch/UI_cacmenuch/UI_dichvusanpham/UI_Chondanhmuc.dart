import 'package:app_casynet/screens/account/UI_qlch/UI_cacmenuch/UI_dichvusanpham/UI_ThemSPDV.dart';
import 'package:app_casynet/screens/account/UI_qlch/UI_cacmenuch/UI_dichvusanpham/danhmuc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class chondanhmuc extends StatelessWidget {
  var dem=0.obs;
  final nothing = [
    danhmuc(title: "Rửa xe, thay dầu"),
    danhmuc(title: "Sửa chữa xe"),
    danhmuc(title: "Đồ chơi, phụ kiện"),
    danhmuc(title: "Mua ban xe"),
    danhmuc(title: "Chăm sóc xe"),
    danhmuc(title: "Lốp và ắc quy"),
    danhmuc(title: "Cứu hộ xe"),
    danhmuc(title: "Máy móc, phụ tùng"),
    danhmuc(title: "Cho thuê xe"),
    danhmuc(title: "khác"),
  ].obs;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          "Chọn danh mục",
          style: TextStyle(color: Colors.black),
        ),
        // leading: Container(
        //   child: IconButton(
        //     icon: Icon(Icons.arrow_back_rounded),
        //     color: Colors.amberAccent,
        //     onPressed: () {
        //       Get.to(themspdv());
        //     },
        //   ),
        // ),
      ),
      body: Container(

        child: Obx(
          () => SingleChildScrollView(
            child: Column(
              children: [
                ListView.builder(
                  itemCount: nothing.length,
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  itemBuilder: (context, indext) {
                    return Obx(
                      () => Container(
                        child: Row(
                          children: [
                            Checkbox(
                              value: nothing[indext].checkdanhmuc,
                              activeColor: Colors.amber,
                              onChanged: (value) {
                                nothing[indext].checkdanhmuc =
                                    !nothing[indext].checkdanhmuc;
                                dem.value=0;
                                if(nothing.last.checkdanhmuc==true){
                                  for(int i=0;i<nothing.length-1;i++){
                                    nothing[i].checkdanhmuc =false;
                                    }
                                }
                                for(int i=0;i<nothing.length;i++){
                                  if(nothing[i].checkdanhmuc==true){
                                    dem++;
                                  }
                                }
                              },
                            ),
                            Text(nothing[indext].title),
                          ],
                        ),
                      ),
                    );
                  },
                ),


                Container(
                  child: RaisedButton(
                    child: Text("Lưu "+dem.toString()+" (Tùy chọn)"),
                    onPressed: () {
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
