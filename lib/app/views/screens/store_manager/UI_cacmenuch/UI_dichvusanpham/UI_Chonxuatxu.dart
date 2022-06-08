
import 'package:app_casynet/app/controller/home/api/origin_controller.dart';
import 'package:app_casynet/app/controller/store_manager/product/select_origin_controller.dart';
import 'package:flutter/cupertino.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../CheckInternet.dart';
import 'UI_ThemSPDV.dart';

class SelectOriginPage extends StatelessWidget {
  SelectOriginPage({Key? key}) : super(key: key);
  final SelectOriginController _selectOriginController = Get.find();
  final OriginController _originController = Get.find();

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
        child: Scaffold(
            appBar: AppBar(
              centerTitle: true,
              title: Text(
                "Chọn xuất xứ",
                style: TextStyle(color: Colors.black),
              ),
              actions: [
                Obx(()=>
                    IconButton(
                        onPressed: (){
                          _selectOriginController.onSaveValue();
                        },
                        icon: Icon(Icons.check ,
                            color: _selectOriginController.isChange.value
                                ? Colors.green
                                : Colors.grey
                        )
                    )
                )
              ],



            ),
            body: Column(
              children: [
                ListView.builder(
                    shrinkWrap: true,
                    itemCount:
                    _originController.originList.length,
                    itemBuilder: (context, index) {
                      return Obx(()=>RadioListTile<int>(
                          title: Text(_originController.originList[index].name!),
                          value: _originController.originList[index].id!,
                          groupValue: _selectOriginController.selectId.value,
                          onChanged: (value) {
                            _selectOriginController.changeValue(value,_originController.originList[index].name! );
                          }
                      )
                      );
                    }),
              ],
            )
        ),
        onWillPop:()=> _onWillPop(context));;
  }
  Future<bool> _onWillPop(BuildContext context) async {
    late bool? exitResult;
    FocusManager.instance.primaryFocus?.unfocus();
    if(_selectOriginController.isChange != false){
      exitResult = await showDialog(
        context: context,
        builder: (context) => _buildExitDialog(context),
      );
      if(exitResult == false){
        Get.back(result: _selectOriginController.selectIdEnd.value);
      }
      else{
        _selectOriginController.onSaveValue();
        Get.back(result: _selectOriginController.selectIdEnd.value);
      }
    }
    else{
      Get.back(result: _selectOriginController.selectIdEnd.value);
    }

    return true;
  }

  AlertDialog _buildExitDialog(BuildContext context) {
    return AlertDialog(
      title: const Text('Hủy thay đổi'),
      actions: <Widget>[
        TextButton(
          onPressed: () => Get.back(result: false),
          child: Text('HỦY'),
        ),
        TextButton(
          onPressed: () => Get.back(result: true),
          child: Text('LƯU THAY ĐỔI'),
        ),
      ],
    );
  }
}

