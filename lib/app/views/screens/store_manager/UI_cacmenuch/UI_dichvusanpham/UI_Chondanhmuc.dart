
import 'package:app_casynet/app/controller/home/api/category_controller.dart';
import 'package:app_casynet/app/controller/store_manager/product/select_category_controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../controller/store_manager/add_product/get_category_controller.dart';
import 'UI_ThemSPDV.dart';




class SelectCategory extends StatelessWidget {
  SelectCategory({Key? key}) : super(key: key);
  final getdms = Get.put(getdanhmuc());

  final CategoryController _categoryController = Get.find();
  final SelectCategoryController _selectCategoryController = Get.find();

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      child: Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        centerTitle: true,
        title: Text(
          'select_category'.tr,
          style: TextStyle(color: Colors.black),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            ListView.builder(
              itemCount: _categoryController.categoriesList.length,
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              itemBuilder: (context, index) {
                return Obx(
                      () => CheckboxListTile(
                          controlAffinity: ListTileControlAffinity.leading, // check box hiện bên trái
                          activeColor: const Color.fromARGB(255, 223, 180, 0),
                          title: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text('${_categoryController.categoriesList[index].name}'),
                            ],
                          ),
                          value: _selectCategoryController.isCategorySelected(_categoryController.categoriesList[index]),
                          onChanged: (bool? value){
                            _selectCategoryController.onChangeCheckbox(_categoryController.categoriesList[index]);
                          }),
                  /*Container(
                    child: Row(
                      children: [
                        Checkbox(
                          value: _selectCategoryController.isCategorySelected(_categoryController.categoriesList[index]),
                          activeColor: Colors.amber,
                          onChanged: (value) {
                            _selectCategoryController.onChangeCheckbox(_categoryController.categoriesList[index]);
                          },
                        ),
                        Text('${_categoryController.categoriesList[index].name}'),
                      ],
                    ),
                  ),*/
                );
              },
            ),
            Container(
              child: ElevatedButton(
                child: Obx(()=>
                    Text(
                        "Lưu ${_selectCategoryController.listCategorySelected.length} (Tùy chọn)")
                ),
                onPressed: () {
                  Get.back(result: _selectCategoryController.listCategorySelected);
                },
              ),
            ),
          ],
        ),
      ),
    ),
      onWillPop: () => _onWillPop(context)
    );
  }
  Future<bool> _onWillPop(BuildContext context) async {
    late bool? exitResult;
    FocusManager.instance.primaryFocus?.unfocus();
    if(_selectCategoryController.isChange != false){
      exitResult = await showDialog(
        context: context,
        builder: (context) => _buildExitDialog(context),
      );
      if(exitResult == false){
        Get.back();
      }
      else{
        Get.back(result: _selectCategoryController.listCategorySelected);
      }
    }
    else{
      Get.back();
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

