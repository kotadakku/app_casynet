
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../../controller/account/edit_info_controller.dart';

class EditInfomation extends StatelessWidget {
  EditInfomation({Key? key}) : super(key: key);
  EditInfoController editInfoController = Get.find();
  @override
  Widget build(BuildContext context) {

    return WillPopScope(
      child: Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text("${'edit'.tr} ${editInfoController.title.tr}"),
        actions: [
          Obx(()=>
              IconButton(
                  onPressed: (){
                    editInfoController.onSaveValue();

                  },
                  icon: Icon(Icons.check ,
                      color: editInfoController.isChange.value
                          ? Colors.green
                          : Colors.grey
                  )
              )
          )
        ],
      ),
      body: Container(
        padding: EdgeInsets.all(10.0),
        child: TextField(
          controller: editInfoController.textEditingController,
          autofocus: true,
          keyboardType: editInfoController.isPhone ? TextInputType.phone : TextInputType.multiline,
          maxLength: 100,
          maxLines: null,
          style: TextStyle(
          ),
          decoration: InputDecoration(
              contentPadding: EdgeInsets.symmetric(horizontal: 10.w)
          ),
          onChanged: (value){
            editInfoController.checkOnSave(value);
          },
        ),
      ),
    ),
      onWillPop: () => _onWillPop(context)
    );
  }
  Future<bool> _onWillPop(BuildContext context) async {
    late bool? exitResult;
    FocusManager.instance.primaryFocus?.unfocus();
    if(editInfoController.isSave == false &&
    editInfoController.isChange == true
    ){
      exitResult = await showDialog(
        context: context,
        builder: (context) => _buildExitDialog(context),
      );
      if(exitResult == false){
        Get.back(result: editInfoController.current_value);
      }
      else{
        Get.back(result: editInfoController.textEditingController.text);
      }
    }
    else{
      Get.back(result: editInfoController.current_value);
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
