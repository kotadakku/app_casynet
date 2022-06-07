
import 'package:flutter/cupertino.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../CheckInternet.dart';
import 'UI_ThemSPDV.dart';

class chonxuatxu extends StatefulWidget {
  @override
  State<chonxuatxu> createState() => _chonxuatxuState();
}

final GetXuatxu = Get.put(getxuatxu());
final checkinternet CheckInternet = Get.put(checkinternet());
var x="".obs;

class _chonxuatxuState extends State<chonxuatxu> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        centerTitle: true,
        title: Text(
          "Chọn xuất xứ",
          style: TextStyle(color: Colors.black),
        ),
      ),
      body: SingleChildScrollView(
        child: Obx(
          () => Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
                FutureBuilder(
                  builder: (context, snapshot) {
                    if (CheckInternet.satatusinternet.toString() == "No Internet") {
                      return Center(
                        child: Text(CheckInternet.satatusinternet.toString()),
                      );
                    } else {
                      return Column(
                        children: [
                          FutureBuilder(
                            future: GetXuatxu.fetchXuatxu(),
                            builder: (context, snapshot) {
                              if (GetXuatxu.xuatxu.length == 0) {
                                return Center(
                                  child: CircularProgressIndicator(),
                                );
                              } else {
                                return SingleChildScrollView(
                                  child: Obx(() => Column(
                                        children: [
                                          ListView.builder(
                                              shrinkWrap: true,
                                              physics:
                                                  NeverScrollableScrollPhysics(),
                                              itemCount:
                                                  GetXuatxu.xuatxu.length,
                                              itemBuilder: (context, indext) {
                                                return RadioListTile(
                                                    title: Text(GetXuatxu
                                                        .xuatxu[indext]
                                                        .name
                                                        .toString()),
                                                    value: indext,
                                                    groupValue:
                                                        GetXuatxu.countqg.value,
                                                    onChanged: (value) {
                                                      GetXuatxu.idxs.value =
                                                          int.parse(GetXuatxu
                                                              .xuatxu[indext]
                                                              .id
                                                              .toString());
                                                      GetXuatxu
                                                              .tenxuatxu.value =
                                                          GetXuatxu
                                                              .xuatxu[indext]
                                                              .name
                                                              .toString();
                                                      GetXuatxu.countqg.value =
                                                          int.parse(
                                                              value.toString());
                                                      Get.back();
                                                    });
                                              }),
                                        ],
                                      )),
                                );
                              }
                            },
                          )
                        ],
                      );
                    }
                  },
                ),
              Offstage(
                offstage: true,
                child: Text(CheckInternet.satatusinternet.toString()),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
