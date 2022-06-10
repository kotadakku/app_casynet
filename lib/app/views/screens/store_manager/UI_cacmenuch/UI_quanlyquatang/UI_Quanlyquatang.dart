
import 'package:app_casynet/app/controller/store_manager/gift/gift_manager_controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../../../routes/app_pages.dart';
import '../../UI_cuahang.dart';
import 'UI_Themquatang.dart';

class QuanLyQuaTang extends StatelessWidget {
  GiftManagerController _giftManagerController = Get.find();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Row(
          children: [
            Expanded(
              child: Container(
                height: 40,
                color: Color.fromARGB(224, 224, 224, 224),
                margin: new EdgeInsets.only(top: 40, bottom: 40),
                child: TextField(
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    hintText: 'Tìm kiếm trên cửa hàng',
                    prefixIcon: Icon(Icons.search),
                  ),
                ),
              ),
            ),
            Container(
              height: 40,
              width: 80,
              margin: new EdgeInsets.only(left: 10),

              child: ElevatedButton(
                style: ElevatedButton.styleFrom(primary: Colors.amber),
                child: Text("${'add'.tr} +"),
                onPressed: () {
                  Get.toNamed(Routes.STORE_MANAGER_ADD_GIFT);
                },
              ),
            ),
          ],
        ),
      ),
      body: Container(
        color: Color.fromARGB(255, 241, 243, 253),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                height: 50,
                padding: EdgeInsets.only(top: 10.h, right: 10.w, bottom: 10.h),
                child: Row(
                  children: [
                    Container(
                      child: Obx(()=>Checkbox(
                        value: _giftManagerController.isSelectedAll.value,
                        onChanged: (value) {
                          _giftManagerController.selectAllGift(value);
                        },
                      ),)
                    ),
                    Spacer(),
                    Obx(()=>
                    _giftManagerController.isSelectedAll.value ?
                    ElevatedButton(
                        onPressed: (){
                          _giftManagerController.deleteAllGift();
                        },
                        style: ElevatedButton.styleFrom(
                          primary: Colors.red
                        ),
                        child: Row(
                          children: [
                            Text('delete'.tr),
                            Text(" 20 ${'record'.tr}"),],
                        )
                    ): SizedBox()
                    )

                  ],
                ),
              ),
              ListView.builder(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemCount: 4,
                itemBuilder: (context, index) {
                  return Container(
                    color: Colors.white,
                    margin: EdgeInsets.only(bottom: 10),
                    child: Row(
                      children: [
                        Container(
                          child: Obx(()=>Checkbox(
                            value: _giftManagerController.ckeckInList(index),
                            onChanged: (value) {
                              if(value == true){
                                _giftManagerController.listSelected.add(index);
                              }
                              else{
                                _giftManagerController.listSelected.remove(index);
                              }
                            },
                          ),)
                        ),
                        Expanded(
                          child: Container(
                            child: Column(
                              children: [
                                Container(
                                  margin: EdgeInsets.only(right: 10),
                                  child: Row(
                                    children: const [
                                      Expanded(
                                        child: Text(
                                          "Thay lốp Maxxis chính hãng miễn phí",
                                          maxLines: 1,
                                          overflow: TextOverflow.ellipsis,
                                          style: TextStyle(fontWeight: FontWeight.bold),
                                        ),
                                      ),
                                      ImageIcon(AssetImage(
                                          "assets/images/Icon/icon_butchi.png")),
                                    ],
                                  ),
                                ),
                                Container(
                                  margin: EdgeInsets.only(right: 10),
                                  child: Row(
                                    children: [
                                      Container(
                                        child: Image.network(
                                          "https://image.bnews.vn/MediaUpload/Org/2020/10/29/winner-x-bike-sport.jpg",
                                          width: 100,
                                        ),
                                      ),
                                      Expanded(
                                        child: Column(
                                          children: [
                                            Row(
                                              children: [
                                                Expanded(
                                                  child: Text("ID:01-303"),
                                                ),
                                                ImageIcon(AssetImage("assets/images/Icon/icon_dung2.png"),size: 18,color: Colors.green,),
                                              ],
                                            ),
                                            Row(
                                              children: [
                                                Expanded(child: Text("${'start_date'.tr}:15/09/2021",maxLines: 1,overflow: TextOverflow.ellipsis,),),
                                              ],
                                            ),
                                            Row(
                                              children: [
                                                Expanded(child: Text("${'end_date'.tr}:15/010/2021",maxLines: 1,overflow: TextOverflow.ellipsis),),
                                              ],
                                            ),

                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
