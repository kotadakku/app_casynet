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

  @override
  void initState() {
    // TODO: implement initState
    // if (getdms.getdanhmuctid.length > 0) {
    //   for (int x = 0; x < getdms.getdanhmuctid.length; x++) {
    //     for (int j = 0; j < getdms.nothing.length; j++) {
    //       if (getdms.nothing[j].id == getdms.getdanhmuctid[x].id) {
    //         getdms.nothing[j].checkdanhmuc = true;
    //       }
    //     }
    //   }
    // }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
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
        body: Container(
          child: FutureBuilder(
            future: getdms.fetchDanhmuc(),
            builder: (context, snapshot) {
              if (getdms.danhmucsp.length == 0) {
                return Center(
                  child: CircularProgressIndicator(),
                );
              } else {
                return Obx(
                  () => SingleChildScrollView(
                    child: Column(
                      children: [
                        ListView.builder(
                          itemCount: getdms.nothing.length,
                          shrinkWrap: true,
                          physics: NeverScrollableScrollPhysics(),
                          itemBuilder: (context, indext) {
                            return Obx(
                              () => Container(
                                child: Row(
                                  children: [
                                    Checkbox(
                                      value: getdms.nothing[indext].checkdanhmuc,
                                      activeColor: Colors.amber,
                                      onChanged: (value) {
                                        getdms.nothing[indext].checkdanhmuc =
                                            !getdms.nothing[indext].checkdanhmuc;
                                        getdms.dem.value = 0;
                                        if (getdms.nothing.last.checkdanhmuc == true) {
                                          for (int i = 0;
                                              i < getdms.nothing.length - 1;
                                              i++) {
                                            getdms.nothing[i].checkdanhmuc = false;
                                          }
                                        }
                                        for (int i = 0;
                                            i < getdms.nothing.length;
                                            i++) {
                                          if (getdms.nothing[i].checkdanhmuc == true) {
                                            getdms.dem++;
                                          }
                                        }
                                      },
                                    ),
                                    Text(getdms.nothing[indext].title),
                                  ],
                                ),
                              ),
                            );
                          },
                        ),
                        Container(
                          child: RaisedButton(
                            child: Text(
                                "Lưu " + getdms.dem.toString() + " (Tùy chọn)"),
                            onPressed: () {
                              getdms.getdanhmuctid.value = [];
                              for (int i = 0; i < getdms.nothing.length; i++) {
                                if (getdms.nothing[i].checkdanhmuc == true) {
                                  getdms.getdanhmuctid.add(getdms.nothing[i]);
                                }
                              }
                              Get.back();
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              }
            },
          ),
        ));
  }
}
