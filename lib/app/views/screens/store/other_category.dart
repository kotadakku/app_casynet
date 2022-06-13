import 'package:app_casynet/app/controller/home/api/category_controller.dart';
import 'package:app_casynet/app/controller/store/other_category_controller.dart';
import 'package:app_casynet/app/views/widgets/image_network_loading.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class OtherCategory extends StatelessWidget {
  OtherCategory({
    Key? key,
  }) : super(key: key);

  // final List<Category> itemCategory;
  CategoryController dataCtr = Get.find();
  OtherCategoryController _otherCateController = Get.find();

  @override
  Widget build(BuildContext context) {
    return WillPopScope(

      onWillPop: () => _onWillPopOtherCategory(context),
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Chọn danh mục nghề khác"),
          actions: [
            IconButton(
                onPressed: (){
                  Get.back(result: _otherCateController.listOtherCategory);
                },
                icon: const Icon(Icons.check,
                  color: Colors.grey,
                ))
          ],
        ),
        body: SafeArea(
          child: SingleChildScrollView(
            child: Container(
              margin: EdgeInsets.only(left: 10.0.w, right: 10.0.w),
              child: ListView.builder(
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                scrollDirection: Axis.vertical,
                /*separatorBuilder: (BuildContext context, int index) {
                  return const Divider(
                    height: 4.0,
                    thickness: 1.0,
                  );
                },*/
                itemCount: dataCtr.categoriesList.length,
                itemBuilder: ( context, index) {
                  return Obx(
                    () => CheckboxListTile(
                      activeColor: const Color.fromARGB(255, 223, 180, 0),
                      title: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(dataCtr.categoriesList[index].name ??
                              "Không có thông tin"),
                          Stack(
                            children: [
                              Container(
                                width: 40.w,
                                height: 40.h,
                                color: const Color.fromARGB(255, 223, 180, 0),
                              ),
                              Positioned(
                                  left: 12.w,
                                  top: 12.h,
                                  child: ImageNetworkLoading(
                                    image_url: dataCtr
                                        .categoriesList[index].imageUrl
                                        .toString(),
                                    width: 15.w,
                                    height: 15.h,
                                  ))
                            ],
                          )
                        ],
                      ),
                      value: _otherCateController.isCategorySelected(dataCtr.categoriesList[index]),
                        /*_otherCateController.listOtherCategory.value
                          .contains(dataCtr.categoriesList[index].id),*/
                      onChanged: (bool? value) {
                        _otherCateController.onChangeCheckbox(dataCtr.categoriesList[index]);
                       /* if (_otherCateController.listOtherCategory.value
                            .contains(dataCtr.categoriesList[index].id)) {
                          _otherCateController.listOtherCategory.remove(dataCtr.categoriesList[index].id);

                        } else {
                          _otherCateController.listOtherCategory.add(dataCtr.categoriesList[index].id);

                        }*/
                      },
                      controlAffinity: ListTileControlAffinity.leading,// checkbox hiện bên trái
                    ),
                  );
                },
              ),
            ),
          ),
        ),
      ),

    );
  }

  Future<bool> _onWillPopOtherCategory(BuildContext context) async{
    late bool? exitResult;
    FocusManager.instance.primaryFocus?.unfocus();
    if(_otherCateController.isChange != false){
      exitResult = await showDialog(
          context: context,
          builder: (context) => _buildExitDialog(context),
      );
      if(exitResult == false){
        Get.back();
      }else{
        Get.back(result: _otherCateController.listOtherCategory);
      }
    }else{
      Get.back();
    }
    return true;
  }
}

AlertDialog _buildExitDialog(BuildContext context) {
  return AlertDialog(
    title: const Text("Huỷ thay đổi"),
    actions: [
      TextButton(
          onPressed: () => Get.back(result: false),
          child: Text("Hủy")
      ),
      TextButton(
          onPressed: () => Get.back(result: true),
          child: Text("Lưu thay đổi"))
    ],
  );
}



