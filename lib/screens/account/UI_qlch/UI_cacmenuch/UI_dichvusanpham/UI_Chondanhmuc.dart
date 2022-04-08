import 'package:app_casynet/screens/account/UI_qlch/UI_cacmenuch/UI_dichvusanpham/UI_ThemSPDV.dart';
import 'package:app_casynet/screens/account/UI_qlch/UI_cacmenuch/UI_dichvusanpham/danhmuc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

final getdms = Get.put(getdanhmuc());
class chondanhmuc extends StatefulWidget {
  @override
  State<chondanhmuc> createState() => _chondanhmucState();
}

class _chondanhmucState extends State<chondanhmuc> {


  final nothing = [
  ].obs;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getdms.fetchdanhmucsp();
    for(int i=0;i<getdms.danhmucs.length;i++){
      nothing.add(danhmuc(title: getdms.danhmucs[i].tendanhmuc.toString(),id: int.parse(getdms.danhmucs[i].iddanhmuc)));
    };
    if(getdms.getdanhmuctid.length>0){
      for(int x=0;x<getdms.getdanhmuctid.length;x++){
        for(int j=0;j<nothing.length;j++){
          if(nothing[j].id==getdms.getdanhmuctid[x].id){
            nothing[j].checkdanhmuc=true;
          }
        }
      }
    }

  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          "Chọn danh mục",
          style: TextStyle(color: Colors.black),
        ),
        leading: Container(
          child: IconButton(
            icon: Icon(Icons.arrow_back_rounded),
            color: Colors.amberAccent,
            onPressed: () {
              Get.back();
            },
          ),
        ),
      ),
      body: Visibility(
        visible: getdms.ischeck.value,
        replacement: const Center(
          child: CircularProgressIndicator(),
        ),
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
                                getdms.dem.value=0;
                                if(nothing.last.checkdanhmuc==true){
                                  for(int i=0;i<nothing.length-1;i++){
                                    nothing[i].checkdanhmuc =false;
                                    }
                                }
                                for(int i=0;i<nothing.length;i++){
                                  if(nothing[i].checkdanhmuc==true){
                                    getdms.dem++;
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
                    child: Text("Lưu "+getdms.dem.toString()+" (Tùy chọn)"),
                    onPressed: () {
                      getdms.getdanhmuctid.value=[];
                      for(int i=0;i<nothing.length;i++){
                        if(nothing[i].checkdanhmuc==true){
                          getdms.getdanhmuctid.add(nothing[i]);
                        }
                      }
                      Get.back();
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
