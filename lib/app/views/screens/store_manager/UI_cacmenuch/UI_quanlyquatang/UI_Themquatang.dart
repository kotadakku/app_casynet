import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '../../../../../controller/store_manager/gift/create_gift_controller.dart';

class ThemQuaTang extends StatelessWidget {

  final CreateGiftController _createGiftController = Get.find();

  ThemQuaTang({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        centerTitle: true,
        title: Text(
          'add_gift'.tr,
        ),
      ),
      body: Form(
        key: _createGiftController.formKey,
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                margin: const EdgeInsets.only(bottom: 10),
                color: Colors.white,
                height: 100,
                width: MediaQuery.of(context).size.width,
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: [
                      Obx(
                            () => ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: _createGiftController.imagepicker.length,
                          shrinkWrap: true,
                          itemBuilder: (context, index) {
                            return Row(
                              children: [
                                Stack(
                                  clipBehavior: Clip.none,
                                  overflow: Overflow.visible,
                                  children: [
                                    Container(
                                      margin: const EdgeInsets.only(
                                          bottom: 5, left: 5, top: 5),
                                      color: Colors.red,
                                      child: Image.file(
                                        _createGiftController.imagepicker[index],
                                        width: 100,
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                    Positioned(
                                      width: 30,
                                      height: 30,
                                      left: 80,
                                      child: Container(
                                        decoration: BoxDecoration(
                                          borderRadius:
                                          BorderRadius.circular(20.0),
                                          color:
                                          const Color.fromARGB(255, 241, 243, 253),
                                          border: Border.all(
                                            width: 1,
                                            style: BorderStyle.solid,
                                          ),
                                        ),
                                        child: IconButton(
                                          icon: const Icon(
                                            Icons.close,
                                            size: 12,
                                          ),
                                          onPressed: () {
                                            _createGiftController.imagepicker.removeAt(index);
                                          },
                                        ),
                                      ),
                                    )
                                  ],
                                ),

                                // Text(x.toString()),
                              ],
                            );
                          },
                        ),
                      ),
                      Center(
                        child: Container(
                          margin: const EdgeInsets.only(left: 20),
                          width: 110,
                          height: 90,
                          child: OutlinedButton(
                            style: ElevatedButton.styleFrom(
                              side: const BorderSide(
                                color: Colors.amber,
                                style: BorderStyle.solid,
                              ),
                            ),
                            child: Text('add_image'.tr,
                                maxLines: 2, textAlign: TextAlign.center),
                            onPressed: () {
                              _createGiftController.pickimage();
                            },
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Container(
                margin: const EdgeInsets.only(bottom: 10),
                color: Colors.white,
                height: 100,
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
                          const Text("0/120"),
                        ],
                      ),
                      TextFormField(
                        validator: (value){
                          if(value?.trim() == ''){
                            return 'required_field'.tr;
                          }
                        },
                        onSaved: (value){
                          _createGiftController.gift.title = value;
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
                height: 100,
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
                          const Text("0/3000"),
                        ],
                      ),
                      TextFormField(
                        onSaved: (value){
                          _createGiftController.gift.description = value;
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
                padding: const EdgeInsets.only(left: 10, right: 10),
                color: Colors.white,
                child: Column(
                  children: [
                    Container(
                      decoration: const BoxDecoration(
                          border: Border(
                            bottom: BorderSide(
                                width: 1.0,
                                color: Color.fromRGBO(200, 200, 200, 200)),
                          )),
                      height: 50,
                      child: Row(
                        children: [
                          Expanded(child: Text('display'.tr)),
                          Obx(
                                () => ImageIcon(
                              const AssetImage("assets/images/Icon/icon_dung2.png"),
                              size: 18,
                              color: _createGiftController.isDisplay.value ? Colors.grey : Colors.green,
                            ),
                          ),
                          Obx(
                                () => Text(_createGiftController.isDisplay.value ? 'yes'.tr : 'no'.tr),
                          ),
                          Container(
                            margin: const EdgeInsets.only(left: 10),
                            child: Obx(
                                  () => Switch.adaptive(
                                  value: _createGiftController.isDisplay.value,
                                  onChanged: (bool value) {
                                    _createGiftController.isDisplay.value = value;
                                  }
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      decoration: const BoxDecoration(
                          border: Border(
                            bottom: BorderSide(
                                width: 1.0,
                                color: Color.fromRGBO(200, 200, 200, 200)),
                          )),
                      height: 50,
                      child: Row(
                        children: [
                          Expanded(child: Text('start_date'.tr)),
                          OutlinedButton(
                            style: ElevatedButton.styleFrom(
                              side: const BorderSide(color: Colors.white),
                            ),
                            child: Row(
                              children: [
                                Obx(() => Text(_createGiftController.startDate.value)),
                                Container(
                                  margin: const EdgeInsets.only(left: 10),
                                  child: const ImageIcon(
                                      AssetImage("assets/images/Icon/icon_date.png")),
                                ),
                              ],
                            ),
                            onPressed: () async {
                              DateTime? newdate = await showDatePicker(
                                context: context,
                                initialDate: DateTime.now(),
                                firstDate: DateTime(2000),
                                lastDate: DateTime(2025),
                              );
                              if (newdate != null) {
                                _createGiftController.startDate.value = DateFormat('dd/MM/yyyy').format(newdate);
                                _createGiftController.gift.startDate = newdate;
                              }
                            },
                          ),
                        ],
                      ),
                    ),
                    Container(
                      decoration: const BoxDecoration(
                          border: Border(
                            bottom: BorderSide(
                                width: 1.0,
                                color: Color.fromRGBO(200, 200, 200, 200)),
                          )),
                      height: 50,
                      child: Row(
                        children: [
                          Expanded(child: Text('end_date'.tr)),
                          OutlinedButton(
                            style: ElevatedButton.styleFrom(
                              side: const BorderSide(color: Colors.white),
                            ),
                            child: Row(
                              children: [
                                Obx(() => Text(_createGiftController.expireDate.value),
                                ),
                                Container(
                                  margin: const EdgeInsets.only(left: 10),
                                  child: const ImageIcon(
                                      AssetImage("assets/images/Icon/icon_date.png")),
                                ),
                              ],
                            ),
                            onPressed: () async {
                              DateTime? newdate = await showDatePicker(
                                context: context,
                                initialDate: DateTime.now(),
                                firstDate: DateTime(2000),
                                lastDate: DateTime(2025),
                              );
                              if (newdate != null) {
                                _createGiftController.expireDate.value = DateFormat('dd/MM/yyyy').format(newdate);
                                _createGiftController.gift.expireDate = newdate;
                              }
                            },
                          ),
                        ],
                      ),
                    ),
                    Container(
                      decoration: const BoxDecoration(
                          border: Border(
                            bottom: BorderSide(
                                width: 1.0,
                                color: Color.fromRGBO(200, 200, 200, 200)),
                          )),
                      height: 50,
                      child: Row(
                        children: [
                          Expanded(child: Text('send_mail'.tr)),
                          Obx(
                                () => Text(_createGiftController.isSendEmail.value ? 'yes'.tr : 'no'.tr),
                          ),
                          Container(
                            margin: const EdgeInsets.only(left: 10),
                            child: Obx(
                                  () => Switch.adaptive(

                                value: _createGiftController.isSendEmail.value,
                                onChanged: (bool value) {
                                  _createGiftController.isSendEmail.value = value;
                                },
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      decoration: const BoxDecoration(
                          border: Border(
                            bottom: BorderSide(
                                width: 1.0,
                                color: Color.fromRGBO(200, 200, 200, 200)),
                          )),
                      height: 50,
                      child: Row(
                        children: [
                          Expanded(child: Text('customer'.tr)),
                        ],
                      ),
                    ),
                  ],
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
                            _createGiftController.createGift();
                          },
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
