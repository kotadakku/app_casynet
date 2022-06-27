
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../../../controller/store_manager/notification/notification_manager_controller.dart';
import '../../../../../routes/app_pages.dart';

class QuanLyThongBao extends StatelessWidget {
  final NotificationManagerController _notificationManagerController = Get.find();

  QuanLyThongBao({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Row(
          children: [
            Expanded(
              child: Text('noti_manage'.tr),
            ),
            Container(
              height: 40,
              width: 80,
              margin: const EdgeInsets.only(left: 10),

              child: ElevatedButton(
                style: ElevatedButton.styleFrom(primary: Colors.amber),
                child: Text("${'add'.tr} +"),
                onPressed: () {
                  Get.toNamed(Routes.STORE_MANAGER_ADD_NOTI);
                },
              ),
            ),
          ],
        ),
      ),
      body: Container(
        color: const Color.fromARGB(255, 241, 243, 253),
        child:SingleChildScrollView(
          child: Column(
            children: [
              Container(
                height: 50,
                padding: EdgeInsets.only(top: 10.h, right: 10.w, bottom: 10.h),
                child: Row(
                  children: [
                    Obx(()=>Checkbox(
                      value: _notificationManagerController.isSelectedAll.value,
                      onChanged: (value) {
                        _notificationManagerController.selectAllNoti(value);
                      },
                    ),),
                    const Spacer(),
                    Obx(()=>_notificationManagerController.isSelectedAll.value ?
                    ElevatedButton(onPressed: (){
                      _notificationManagerController.deleteAllNotifications();
                    },
                        style: ElevatedButton.styleFrom(
                          primary: Colors.red
                        ),
                      child: Row(
                        children: [
                          Text('delete'.tr),
                          Obx(()=>Text(" ${_notificationManagerController.listSelected.length} ${'record'.tr}"),)
                        ],
                      ))
                        : const SizedBox()
                    )

                  ],
                ),
              ),
              ListView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: 2,
                itemBuilder: (context, index) {
                  return Container(
                    color: Colors.white,
                    margin: const EdgeInsets.only(bottom: 10),
                    child: Row(
                      children: [
                        Obx(()=>Checkbox(
                          value: _notificationManagerController.ckeckInList(index),
                          onChanged: (value) {
                            _notificationManagerController.ckeckInList(index) ?
                            _notificationManagerController.listSelected.remove(index) :
                            _notificationManagerController.listSelected.add(index);
                          },)
                        ),
                        Expanded(
                          child: Column(
                            children: [
                              Container(
                                margin: const EdgeInsets.only(right: 10),
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
                                        "assets/images/Icon/icon_butchi.png"),size: 20,),
                                  ],
                                ),
                              ),
                              Container(
                                margin: const EdgeInsets.only(right: 10),
                                child: Row(
                                  children: [
                                    Expanded(
                                      child: Column(
                                        children: [
                                          Row(
                                            children: const [
                                              Expanded(
                                                child: Text("ID:01-303"),
                                              ),
                                              ImageIcon(AssetImage("assets/images/Icon/icon_dung2.png"),size: 18,color: Colors.green,),
                                            ],
                                          ),
                                          Row(
                                            children: [
                                              Expanded(child: Text("${'update_at'.tr}:15/09/2021",maxLines: 1,overflow: TextOverflow.ellipsis,),),
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
