import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../../../controller/store_manager/notification/create_noti_controller.dart';

class ThemThongBao extends StatelessWidget {
  final CreateNotificationController _createNotificationController = Get.find();

  ThemThongBao({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        centerTitle: true,
        title: Text(
          'add_noti'.tr,
          style: const TextStyle(color: Colors.black),
        ),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_rounded),
          color: Colors.amberAccent,
          onPressed: () {
            Get.back();
          },
        ),
      ),
      body: Container(
        color: const Color.fromARGB(255, 241, 243, 253),
        child: Form(
          key: _createNotificationController.formKey,
          child: Column(
            children: [
              Container(
                margin: const EdgeInsets.only(bottom: 10),
                padding: const EdgeInsets.only(top: 20),
                color: Colors.white,
                child: Container(
                  margin: const EdgeInsets.only(left: 10, right: 10),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Expanded(
                            child: Text(
                              'title'.tr,
                              style: const TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 16,
                              ),
                            ),
                          ),
                          Obx(()=>Text("${_createNotificationController.countTextTitle.value}/120"),)
                        ],
                      ),
                      TextFormField(
                        onSaved: (value){
                          _createNotificationController.notificationModel.title = value;
                        },
                        validator: (value){
                          if(value?.trim() == ''){
                            return 'required_field'.tr;
                          }

                        },
                        onChanged: (value){
                          _createNotificationController.countTextTitle.value = value.length;
                        },
                        decoration: InputDecoration(
                          hintText: 'enter_title'.tr,
                          counterText: "",
                          border: InputBorder.none,
                        ),
                        maxLength: 120,
                        maxLines: 2,
                        // controller: tensanpham,
                        // onChanged: (text) {
                        //   demtensanpham.value = text.length;
                        // },
                      ),
                    ],
                  ),
                ),
              ),
              Container(
                margin: const EdgeInsets.only(bottom: 10),
                color: Colors.white,
                child: Container(
                  margin: const EdgeInsets.only(left: 10, right: 10),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Expanded(
                            child: Text(
                              'description'.tr,
                              style: const TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 16,
                              ),
                            ),
                          ),
                          Obx(()=> Text("${_createNotificationController.countTextDescription.value}/3000"),)
                        ],
                      ),
                      TextFormField(
                        onChanged: (value){
                          _createNotificationController.countTextDescription.value = value.length;
                        },
                        onSaved: (value){
                          _createNotificationController.notificationModel.body = value;
                        },
                        decoration: InputDecoration(
                          hintText: 'enter_descrip'.tr,
                          counterText: "",
                          border: InputBorder.none,
                        ),
                        maxLength: 120,
                        maxLines: 2,
                        // controller: tensanpham,
                        // onChanged: (text) {
                        //   demtensanpham.value = text.length;
                        // },
                      ),
                    ],
                  ),
                ),
              ),
              Container(
                padding: const EdgeInsets.only(left: 10,right: 10),
                decoration: const BoxDecoration(
                    color: Colors.white,
                    border: Border(
                      bottom: BorderSide(
                          width: 1.0, color: Color.fromRGBO(200, 200, 200, 200)),
                    )),
                height: 50,
                child: Row(
                  children: [
                    Expanded(child: Text('send_mail'.tr)),
                    Obx(
                          () => Text(_createNotificationController.isSendEmail.value ? 'yes'.tr: 'no'.tr),
                    ),
                    Container(
                      margin: const EdgeInsets.only(left: 10),
                      child: Obx(
                            () => Switch.adaptive(
                          value: _createNotificationController.isSendEmail.value,
                          onChanged: (bool value) {
                            _createNotificationController.isSendEmail.value = value;
                          },
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              InkWell(
                onTap: (){

                },
                child: Container(
                  height: 50,
                  padding: EdgeInsets.symmetric(horizontal: 10.0.w),
                  color: Colors.white,
                  child: Row(
                    children: [
                      Expanded(
                        child: Text('customer'.tr),
                      ),
                      Text('select'.tr),
                      const Icon(Icons.navigate_next),
                    ],
                  ),
                ),
              ),
              Container(
                height: 50,
                margin: const EdgeInsets.only(top: 20, bottom: 20),
                child: Row(
                  children: [
                    Expanded(
                      child: Container(
                        margin: const EdgeInsets.only(right: 5, left: 10),

                        child: ElevatedButton(
                          child: Text('back'.tr),
                          onPressed: () {
                            Get.back();
                          },
                        ),
                      ),
                    ),
                    Expanded(
                      child: Container(
                        margin: const EdgeInsets.only(right: 10, left: 5),
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(primary: Colors.amber),
                          child: Text('save_gift'.tr),
                          onPressed: () {
                            _createNotificationController.createNotification();
                          },
                        ),
                      ),
                    ),
                  ],
                ),
              ),

            ],
          ),
        )
      ),
    );
  }
}
